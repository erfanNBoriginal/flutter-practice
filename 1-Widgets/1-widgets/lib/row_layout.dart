import 'package:flutter/material.dart';
import 'package:widgets/custom_widget.dart';

class RowLayout extends StatelessWidget {
  //
  const RowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('size');
    print(size);
    print(MediaQuery.of(context).orientation);
    print(MediaQuery.of(context).padding);
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.amber,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          // spacing: 20,
          children: [
            // Spacer(),
            CustomWidget(
              color: Colors.red,
              width: 150,
              height: 100,
            ),
            Spacer(
              flex: 20,
            ),
            CustomWidget(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Spacer(
              flex: 80,
            ),
            CustomWidget(
              color: Colors.green,
              width: 150,
              height: 300,
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
