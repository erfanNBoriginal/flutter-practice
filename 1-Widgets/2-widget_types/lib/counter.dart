import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  //
  final int count;

  const Counter({
    super.key,
    required this.count,
  });

  //
  @override
  Widget build(BuildContext context) {
    print('Counter Build Method Fired!');
    return Center(
      child: Text(
        'Current Count is: $count',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
