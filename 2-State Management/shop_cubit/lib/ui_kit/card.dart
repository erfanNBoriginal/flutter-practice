import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class Card extends StatelessWidget {
  //
  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final double? radius;

  final Widget child;

  const Card({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.radius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius: BorderRadius.circular(radius ?? U.Theme.r20),
        border: Border.all(width: 1.0, color: U.Theme.outline),
      ),
      child: child,
    );
  }
}
