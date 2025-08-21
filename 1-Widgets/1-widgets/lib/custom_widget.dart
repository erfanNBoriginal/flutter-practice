import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  //
  final double height;

  final double width;

  final Color color;

  final String text;

  const CustomWidget({
    super.key,
    this.height = 100,
    this.width = 100,
    this.color = Colors.cyan,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: height,
      width: width,
      child: Text(
        text,
      ),
    );
  }
}
