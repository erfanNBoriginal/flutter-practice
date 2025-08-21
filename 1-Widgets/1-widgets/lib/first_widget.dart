import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      alignment: Alignment(0, 0),
      child: Container(
        height: 200,
        width: 200,
        color: Colors.cyanAccent,
      ),
    );
  }
}
