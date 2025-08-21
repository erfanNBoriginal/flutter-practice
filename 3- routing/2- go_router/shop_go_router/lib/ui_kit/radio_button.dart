import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class RadioButton<T> extends StatelessWidget {
  //
  final String title;

  final T value;

  final T groupValue;

  final void Function(T value) onPressed;

  const RadioButton({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onPressed,
  });

  bool get isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(value),
      borderRadius: BorderRadius.circular(U.Theme.r15),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            U.Text(
              title,
              size: U.TextSize.s16,
              weight: U.TextWeight.medium,
              color: isSelected ? U.Theme.primary : U.Theme.onBackground,
            ),
            const SizedBox(width: 12),
            U.Image.icon(
              path: isSelected ? U.Icons.radioFill : U.Icons.radioEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
