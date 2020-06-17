import 'package:firstFlutterApp/Chopper/ChopperApp.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'Networking/WeatherRequest.dart';
import 'ListView/WeatherApp.dart';


void main() {
//  runApp(MyApp());
//  runApp(MyNewApp());
    runApp(WeatherApp());
//
  // var request = WeatherRequest();
   // request.getWeather(0, 0);
//  _setupLogging();
 // runApp(ChopperApp());

  }

  void _setupLogging() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
    


//  var react = Reactangle.square();
//  print(react.width);
//
//  var guit = Guitarist();
//  print(guit.play());
//  guit.playLudans();
//
//  var classAsFunc = ClassAsFunc();
//  var mult = classAsFunc(18, 98);
//  print("$mult");

 // var asyncWork = AsyncWork();
  // asyncWork.run();
}


class MyApp extends StatelessWidget {

  var a = "pizdec";
  var b = 13;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "akonoplev App",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("$a and $b"),
      ),
        body: Center(
          child: Text(
              "Hello world", style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}



class Reactangle {
  num width, height;

  Reactangle(num width, num height) {
    this.width;
    this.height;
  }

  Reactangle.square() {
    this.width = 10;
    this.height = 10;
  }
}

class Musician {

  final instrument;

  Musician(this.instrument);

  void play() => "Hi, I can play $instrument";
}

abstract class Musican1 {
  String instrument;

  Musician(String instrument) {
    this.instrument = instrument;
  }
}


class Guitarist extends Musican1 with BringMeTheHorizon, Jazz {
  get instrument => 'Guitar';
  String play() => "Hi, I can play $instrument";
}

mixin Jazz {
  bool knowHowlayJaz = true;

  void playJazz() {
    if (knowHowlayJaz) {
      print("TNT");
    }
  }
}

mixin BringMeTheHorizon {
  bool OliverSykes = true;

  void playLudans() {
    if(OliverSykes) {
      print("Do you know why, the flowers never bloom?");
    }
  }
}

class ClassAsFunc {
  call(int a, int b) => a*b;
}




