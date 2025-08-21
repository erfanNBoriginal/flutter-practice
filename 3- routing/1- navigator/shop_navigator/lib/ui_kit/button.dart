import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

enum ButtonColor {
  primary,
  secondary,
}

enum ButtonSize {
  sm,
  md,
  lg,
}

class Button extends StatelessWidget {
  //
  final String title;

  final bool disabled;

  final ButtonColor color;

  final ButtonSize size;

  final String trailingText;

  final void Function() onPressed;

  const Button({
    super.key,
    required this.title,
    this.disabled = false,
    this.color = ButtonColor.primary,
    this.size = ButtonSize.md,
    this.trailingText = '',
    required this.onPressed,
  });

  double get _size {
    switch (size) {
      case ButtonSize.sm:
        return 30;
      case ButtonSize.md:
        return 40;
      case ButtonSize.lg:
        return 50;
    }
  }

  ({Color background, Color foreground}) get _color {
    switch (color) {
      case ButtonColor.primary:
        return (
          background: U.Theme.primary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          ),
          foreground: U.Theme.onPrimary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
      case ButtonColor.secondary:
        return (
          background: U.Theme.secondary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          ),
          foreground: U.Theme.onSecondary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case ButtonSize.sm:
        return (size: U.TextSize.s14, weight: U.TextWeight.medium);
      case ButtonSize.md:
        return (size: U.TextSize.s18, weight: U.TextWeight.medium);
      case ButtonSize.lg:
        return (size: U.TextSize.s18, weight: U.TextWeight.medium);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _color.background,
      borderRadius: BorderRadius.circular(
        U.Theme.r15,
      ),
      child: InkWell(
        onTap: disabled ? null : onPressed,
        borderRadius: BorderRadius.circular(
          U.Theme.r15,
        ),
        child: Container(
          height: _size,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Row(
            children: [
              if (trailingText.isEmpty) const Spacer(),
              U.Text(
                title,
                size: _textStyle.size,
                color: _color.foreground,
                weight: _textStyle.weight,
              ),
              const Spacer(),
              if (trailingText.isNotEmpty)
                U.Text(
                  trailingText,
                  size: U.TextSize.s12,
                  weight: U.TextWeight.medium,
                  color: _color.foreground,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
