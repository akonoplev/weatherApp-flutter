import 'dart:async';

class AsyncWork {
  void run() async {
//    print("run");
//    var int = asyncRequest();
//    print(int);

    var stream = countStream(10);
    var sum =  await sumStream(stream);
    print("sum is  $sum");


    //Errors
    try {
      getException();
    } catch(e) {
      print(e);
    }
  }

  //Future
  Future<int> asyncRequest() async {
    var digest = await getDataFromServer();

    print(digest);
  }
  
  
  int getDataFromServer() {
    return 15;
  }


  //Stream
  Future<int> sumStream(Stream<int> stream) async {
    var sum = 0;

    await for (var value in stream) {
      sum += value;
    }
    return sum;
  }

  Stream<int> countStream(int to) async* {
    for (int i = 1; i <= to;i++) {
      yield i;
    }
  }

  void getException() {
    throw Exception("Exception!");
  }

}
