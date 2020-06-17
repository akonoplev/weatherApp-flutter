import 'dart:convert';

import 'package:firstFlutterApp/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firstFlutterApp/ListView/WeatherModel.dart';
import '../model/forecast_entity_entity.dart';
import 'package:geolocator/geolocator.dart';

class WeatherRequest {

  Future<List<ListItem>> getWeather(double lat, double lng, BuildContext context) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_API_KEY,
      'units': 'metric',
      'lat': lat.toString(),
      'lon': lng.toString()
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL, Constants.WEATHER_FORECASR_URL, queryParameters);
    var response = await http.get(uri); //выполняем запрос и ждем пока придет ответ

    if (response.statusCode == 200) {

      var forecastResponse = ForecastEntityEntity().fromJson(json.decode(response.body));
      if (forecastResponse.cod == "200") {
        return forecastResponse.xList;
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Error ${forecastResponse.cod}"),
        ));
      }
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Error occure while loading data from server"),
      ));
    }
    return List<ListItem>();
  }

  Future<Placemark> getLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemark.isNotEmpty) {
      return placemark[0];
    }
    return null;
  }

  void loadData(BuildContext context) {
    var locationFuture = getLocation();
    locationFuture.then((value) {
      var weatherFuture = getWeather(value.position.latitude, value.position.latitude, context);
      weatherFuture.then((weatherData) {

      });
    });
  }
}