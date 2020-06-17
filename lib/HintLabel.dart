
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HintLabel extends StatelessWidget {
  final String text;

  const HintLabel(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.amber[200]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text,
                  style: TextStyle(color: Colors.grey[700]))
      ) ,
    );
  }
}