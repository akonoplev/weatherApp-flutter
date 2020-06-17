import "package:flutter/material.dart";

class CounterWidget extends StatefulWidget {

  @override
  createState() => new CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {

  int _count = 42;

  @override
  Widget build(BuildContext context) {
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Colors.amber[600]
      ),
      child: Row( //горизонтальное выравнивание
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: () {
            _decrement();
          } ,
              icon: Icon(Icons.remove)),
          Text("$_count",
              style:  TextStyle(fontSize: 20.0)),
          IconButton(
            onPressed: () {
              _increment();

          },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }
}