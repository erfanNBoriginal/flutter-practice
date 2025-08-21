import 'package:flutter/material.dart';
import 'package:widgets/custom_widget.dart';

class StackLayout extends StatelessWidget {
  //
  const StackLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.amber,
        height: 600,
        width: 600,
        child: Stack(
          //alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CustomWidget(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            ),
            Align(
              alignment: Alignment(0.5, -0.5),
              child: CustomWidget(
                color: Colors.green,
                width: 300,
                height: 300,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CustomWidget(
                color: Colors.red,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              top: 30,
              bottom: 60,
              height: 100,
              child: CustomWidget(
                color: Colors.brown,
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
