import 'package:firstFlutterApp/ListView/WeatherModel.dart';
import 'package:firstFlutterApp/Networking/WeatherRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/Constants.dart';
import 'package:geolocator/geolocator.dart';

import 'dart:convert';
import 'package:firstFlutterApp/Constants/Constants.dart';
import 'package:http/http.dart' as http;
import '../model/forecast_entity_entity.dart';
import 'LocationInfo.dart';
import 'dart:async';
import 'PlacesPageWidget.dart';


class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationInheritedWidget(
      child: WeatherForecastPage());
  }
}

class WeatherForecastPage extends StatefulWidget {

  WeatherForecastPage();

  @override
  State<StatefulWidget> createState() {
    return _WeatherForecasrPageStateWithReuse(55.75, 37.61);
  }
}

//MARK: - Reusable list view
class _WeatherForecasrPageStateWithReuse extends State<WeatherForecastPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final double latitude;
  final double longitude;
  List<ListItem> weatherForecast;
  var _isLoading = false;

  Placemark _placemark;

  Completer<void> _refreshCompeter;

  _WeatherForecasrPageStateWithReuse(this.latitude, this.longitude);

  Future<List<ListItem>> getWeather(double lat, double lng) async {
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
        _displaySnackBar("Error ${forecastResponse.cod}");
      }
    } else {
      _displaySnackBar("Error occure while loading data from server");
    }
    return List<ListItem>();
  }

  @override
  void initState() {
    super.initState();
    _refreshCompeter = Completer<void>();
    _loadData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var locationInfo = LocationInfo?.of(context);
    _placemark = locationInfo?.placemark;
    _loadData();
  }

  void _loadData() {
    _isLoading = true;
    if (_placemark == null) {
      print("Placemark is nil");
      return;
    }

    var weatherFuture = getWeather(_placemark.position.latitude, _placemark.position.longitude);
    weatherFuture.then((weatherData) {
      initWeatherWith(weatherData, _placemark);
      _isLoading = false;
    });
  }

  Future<void> _onRefresh() async {
    var weatherFuture = getWeather(_placemark.position.latitude, _placemark.position.longitude);
    weatherFuture.then((_weatherForecast) {
        initWeatherWith(_weatherForecast, _placemark);
    });
    return _refreshCompeter.future;
  }

  _displaySnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget get _pageToDisplay {
    if (_isLoading) {
      return _loadingView;
    } else {
      return _contentView;
    }
  }
//
  Widget get _loadingView {
    return Center(
        child: CircularProgressIndicator()
    );
  }
//
  Widget get _contentView {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          itemCount: weatherForecast == null ? 0 : weatherForecast.length,
          itemBuilder: (BuildContext context, int index) {
            final item = weatherForecast[index];
            if (item is ForecastEntityList) {
              return WeatherListItem(item);
            } else if (item is DayHeading) {
              return HeadingListItem(item);
            } else
              throw Exception("wrong type");
          }),
    );
  }
//
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: getPlaceTitle(),
      theme: ThemeData(
        primarySwatch: Colors.lightGreenAccent[300]
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(getPlaceTitle())
        ),
        body: _pageToDisplay,
      ),
    );
  }

  void initWeatherWith(List<ListItem> weatherData, Placemark placemark) {
    var itCurrentDay = DateTime.now();
    var timeZoneOffset = itCurrentDay.timeZoneOffset;
    var weatherForecastLocal = List<ListItem>();
    weatherForecastLocal.add(DayHeading(itCurrentDay)); // first heading
    var itNextDay = DateTime.now().add(Duration(days: 1));
    itNextDay =
        DateTime(itNextDay.year, itNextDay.month, itNextDay.day, 0, 0, 0, 0, 1);
    var iterator = weatherData.iterator;
    while (iterator.moveNext()) {
      var weatherItem = iterator.current as ForecastEntityList;
      if (weatherItem.getDateTime().isAfter(itNextDay)) {
        itCurrentDay = itNextDay;
        itNextDay = itCurrentDay.add(Duration(days: 1));
        itNextDay = DateTime(
            itNextDay.year, itNextDay.month, itNextDay.day, 0, 0, 0, 0, 1);
        weatherForecastLocal.add(DayHeading(itCurrentDay)); // next heading
      } else {
        weatherForecastLocal.add(weatherItem);
      }
    }
    setState(() {
      weatherForecast = weatherForecastLocal;
      _refreshCompeter.complete();
    });
  }

  String getPlaceTitle() {
    var placeTitle = _placemark?.subAdministrativeArea;
    if (placeTitle?.isEmpty == true) {
      placeTitle = _placemark?.administrativeArea;
    }
    return placeTitle ?? "";
  }
}



















//MARK: - not reusable List View
//class _WeatherForecastPageState extends State<WeatherForecastPage> {
//
//  final List<Weather> weatherForecast;
//  bool _isLoading = false;
//
//  _WeatherForecastPageState(this.weatherForecast);
//
//  Widget get _pageToDisplay {
//    if (_isLoading) {
//      return _loadingView;
//    } else {
//      return _contentView;
//    }
//  }
//
//  Widget get _loadingView {
//    return Center(
//        child: CircularProgressIndicator()
//    );
//  }
//
//  Widget get _contentView {
//    return CircularProgressIndicator();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: "ListView Weather Sample",
//      theme: ThemeData(
//        primarySwatch: Colors.amber
//      ),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Weather Forecast Sample")
//        ),
//        body: ListView(
//          children: weatherForecast.map((Weather weather) {
//            return WeatherListItem(weather);
//          }).toList(),
//        ),
//      ),
//    );
//  }
//}