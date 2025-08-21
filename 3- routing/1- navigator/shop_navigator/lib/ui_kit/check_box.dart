import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class CheckBox extends StatelessWidget {
  //
  final String title;

  final bool isChecked;

  final void Function() onPressed;

  const CheckBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
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
              color: isChecked ? U.Theme.primary : U.Theme.onBackground,
            ),
            const SizedBox(width: 12),
            U.Image.icon(
              path: isChecked ? U.Icons.checkBoxFill : U.Icons.checkBoxEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
