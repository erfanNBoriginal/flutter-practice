import 'package:flutter/material.dart';

import '/ui_kit/ui_kit.dart' as U;

enum CounterSize { medium, large }

class Counter extends StatelessWidget {
  //
  final int count;

  final CounterSize size;

  final void Function() onIncresePressed;

  final void Function() onDecresePressed;

  const Counter({
    super.key,
    required this.count,
    required this.onIncresePressed,
    required this.onDecresePressed,
    this.size = CounterSize.medium,
  });

  ({U.TextSize textSize, double cardSize}) get _size {
    switch (size) {
      case CounterSize.medium:
        return (textSize: U.TextSize.s14, cardSize: 40);
      case CounterSize.large:
        return (textSize: U.TextSize.s16, cardSize: 50);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = _size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onIncresePressed,
          child: U.Image.icon(path: U.Icons.add, color: U.Theme.primary),
        ),
        const SizedBox(width: 5),
        U.Card(
          width: size.cardSize,
          height: size.cardSize,
          radius: U.Theme.r15,
          padding: EdgeInsets.all(2.0),
          child: Center(
            child: U.Text(
              count.toString(),
              size: size.textSize,
              weight: U.TextWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onDecresePressed,
          child: U.Image.icon(path: U.Icons.min, color: U.Theme.secondary),
        ),
      ],
    );
  }
}
