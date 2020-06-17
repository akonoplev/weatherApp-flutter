
import 'package:firstFlutterApp/HintLabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyNewStateFullWidget.dart';

//MARK: - StatelessWidget

class MyNewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App с кастомным виджетом",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          title: Text("App with custom widget"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HintLabel("Наш кастомный лейбл"),
              SizedBox(height: 16),
              CounterWidget(),
              SizedBox(height: 16),
              HintLabel("еще один кастомный лейбл")
            ],
          ),
        ),
      ),
    );
  }
}