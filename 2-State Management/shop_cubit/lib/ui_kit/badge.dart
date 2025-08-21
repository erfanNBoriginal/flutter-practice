import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

enum BadgeColor {
  primary,
  secondary,
}

class Badge extends M.StatelessWidget {
  //
  final int count;

  final BadgeColor color;

  final M.AlignmentGeometry align;

  final M.Widget child;

  const Badge({
    super.key,
    this.count = 0,
    this.color = BadgeColor.primary,
    this.align = const M.Alignment(1, -1),
    required this.child,
  });

  ({M.Color background, M.Color foreground}) get _color {
    return switch (color) {
      BadgeColor.primary => (
          background: U.Theme.primary,
          foreground: U.Theme.onPrimary,
        ),
      BadgeColor.secondary => (
          background: U.Theme.secondary,
          foreground: U.Theme.onSecondary,
        ),
    };
  }

  @override
  M.Widget build(M.BuildContext context) {
    final color = _color;
    return count == 0
        ? child
        : M.Badge.count(
            count: count,
            alignment: align,
            backgroundColor: color.background,
            textStyle: M.TextStyle(
              fontSize: 12,
              fontFamily: 'IranSans',
              fontWeight: M.FontWeight.w500,
              color: color.foreground,
            ),
            child: child,
          );
  }
}
