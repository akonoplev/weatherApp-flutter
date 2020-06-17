import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationInfo extends InheritedWidget {
  final Placemark placemark;

  LocationInfo(this.placemark, Widget child) : super(child: child);

  static LocationInfo of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(LocationInfo);
  }

  @override
  bool updateShouldNotify(LocationInfo oldLocationInfo) {

    var oldLocationTime = oldLocationInfo?.placemark?.position?.timestamp?.millisecondsSinceEpoch ?? 0;
    var newLocationTime = placemark?.position?.timestamp?.millisecondsSinceEpoch ?? 0;

    if (oldLocationTime == 0 && newLocationTime == 0) {
      return true;
    } else {
      return oldLocationTime < newLocationTime;
    }
  }
}

class LocationInheritedWidget extends StatefulWidget {
  static LocationInfo of(BuildContext context) {
    context.inheritFromWidgetOfExactType(LocationInfo) as LocationInfo;
  }

  const LocationInheritedWidget({this.child, Key key}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _LocationInheritedeState();
  }
}

class _LocationInheritedeState extends State<LocationInheritedWidget> {
  Placemark _placemark;

  void _loadData() {
    var locationFuture = getLocation();
    locationFuture.then((newPosition) {
      var placeFuture = getPlacemark(newPosition);
      placeFuture.then((newPlaceMark) {
        onPositionChange(newPlaceMark);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void onPositionChange(Placemark newPlacemark) {
    _placemark = newPlacemark;
  }

  @override
  Widget build(BuildContext context) {
    return LocationInfo(_placemark, widget.child);
  }

  Future<Position> getLocation() async {
    Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    Position position = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    return position;
  }

  Future<Placemark> getPlacemark(Position position) async {
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemark.isNotEmpty) {
      return placemark[0];
    }
    return null;
  }
}