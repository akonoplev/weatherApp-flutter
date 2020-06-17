import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PlacesPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlacesPageState();
  }
}

class PlacesPageState extends State<PlacesPageWidget> {

  List<Placemark> _places = [
    Placemark(
        name: "Moscow",
        country: "Europe",
    administrativeArea: "Moscow",
    position: Position(longitude: 37.6206, latitude: 55.7532)),
    Placemark(
      name: "Paris",
      country: "Europe",
      administrativeArea: "Paris",
      position: Position(longitude: 2.2950, latitude: 48.8753)
    ),
    Placemark(
      name: "London",
      country: "Europe",
      administrativeArea: "London",
      position: Position(longitude: -0.1254, latitude: 51.5011)
    )
  ];

  Widget get bodyView {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(
            child: InkWell(
              onTap: () => _onItemTapped(null),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Текущая позиция",
                  textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 16.0, color: Colors.black),),
              ),
            )
        )
      ],),
      Divider(
          height: 4,
          thickness: 2),
      Expanded(
        child: ListView.builder(
          itemCount: _places.length,
          itemBuilder: (context, index) {
            final place = _places[index];
            return Dismissible(
              key: Key(place.name),
              onDismissed: (direction) {
                setState(() {
                  _places.removeAt(index);
                });
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("$place removed"),));
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(_preparePlaceTitle(place)),
                onTap: () => _onItemTapped(place),
              ),
            );
          },
        ),
      )
    ],);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
      ),
      body: bodyView
      ,
    );
  }

  void _onItemTapped(Placemark placemark) {

  }

  String _preparePlaceTitle(Placemark placemark) {
    return placemark.name;
  }


}