import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/forecast_entity_entity.dart';

//Abstract
abstract class ListItem { }

class WeatherListItem extends StatelessWidget {
  static var _dateFormat = DateFormat("HH:mm");

  final ForecastEntityList weather;

  WeatherListItem(this.weather);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child:
              Text(
                  _dateFormat.format(weather.getDateTime()),
              style:Theme.of(context).textTheme.subhead )),
              Image.network(weather.getIconUrl()),
              Text((weather.main.temp.toInt()).toString() + " \u00B0C",
              style: Theme.of(context).textTheme.subhead,)
        ],)
    );
  }
}

//Heading
class DayHeading extends ListItem {
  final DateTime dateTime;
  DayHeading(this.dateTime);
}

class HeadingListItem extends StatelessWidget {
  static var _dateFormatWeekDay = DateFormat('EEEE');
  final DayHeading dayHeading;

  HeadingListItem(this.dayHeading);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Column(children: <Widget>[
        Text("${_dateFormatWeekDay.format(dayHeading.dateTime)} ${dayHeading.dateTime.day}.${dayHeading.dateTime.month}",
        style: Theme.of(context).textTheme.headline6,),
        Divider()
      ],),
    );
  }
}

class Weather implements ListItem {
  static const String weatherURL = "http://openweathermap.org/img/w/";
  DateTime dateTime;
  num degree;
  int clouds;
  String iconURL;

  String getIconUrl() {
    return weatherURL + iconURL + ".png";
  }

  Weather(this.dateTime, this.degree, this.clouds, this.iconURL);
}