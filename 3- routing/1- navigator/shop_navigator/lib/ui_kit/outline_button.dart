import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class OutlineButton extends StatelessWidget {
  //
  final String title;

  final bool disabled;

  final U.ButtonColor color;

  final U.ButtonSize size;

  final String trailingText;

  final void Function() onPressed;

  const OutlineButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.color = U.ButtonColor.primary,
    this.size = U.ButtonSize.md,
    this.trailingText = '',
    required this.onPressed,
  });

  double get _size {
    switch (size) {
      case U.ButtonSize.sm:
        return 30;
      case U.ButtonSize.md:
        return 40;
      case U.ButtonSize.lg:
        return 50;
    }
  }

  ({Color background, Color foreground}) get _color {
    switch (color) {
      case U.ButtonColor.primary:
        return (
          background: Colors.transparent,
          foreground: U.Theme.primary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
      case U.ButtonColor.secondary:
        return (
          background: Colors.transparent,
          foreground: U.Theme.secondary.withValues(
            alpha: disabled ? 0.55 : 1.0,
          )
        );
    }
  }

  ({U.TextSize size, U.TextWeight weight}) get _textStyle {
    switch (size) {
      case U.ButtonSize.sm:
        return (size: U.TextSize.s14, weight: U.TextWeight.medium);
      case U.ButtonSize.md:
        return (size: U.TextSize.s18, weight: U.TextWeight.medium);
      case U.ButtonSize.lg:
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              U.Theme.r15,
            ),
            border: Border.all(
              width: 2.0,
              color: _color.foreground,
            ),
          ),
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
