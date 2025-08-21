import 'package:flutter/material.dart';
import 'package:widgets/custom_widget.dart';

class ColumnLayout extends StatelessWidget {
  //
  const ColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          textDirection: TextDirection.rtl,
          verticalDirection: VerticalDirection.up,
          // spacing: 20,
          children: [
            Expanded(
              child: CustomWidget(
                color: Colors.red,
                width: 100,
              ),
            ),
            Expanded(
              child: CustomWidget(
                color: Colors.blue,
                width: 200,
              ),
            ),
            Expanded(
              child: CustomWidget(
                color: Colors.green,
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
