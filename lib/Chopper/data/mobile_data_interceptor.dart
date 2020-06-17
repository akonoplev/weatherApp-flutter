import 'package:chopper/chopper.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    final connectivituResult = await Connectivity().checkConnectivity();
    final isMobile = connectivituResult == ConnectivityResult.mobile;
    final isLargeFile = request.url.contains(RegExp(r'(/large|/video|/posts)'));

    if (isMobile && isLargeFile) {
      //need catch this error and return Error Screen to user
      throw MobileDataCostException();
    }

    return request;
  }
}

class MobileDataCostException implements Exception {
  final message = "Downloading large file in a mobile data connection may incure costs";

  @override
  String toString() => message;
}