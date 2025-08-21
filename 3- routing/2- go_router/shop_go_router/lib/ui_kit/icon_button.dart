import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class IconButton extends StatelessWidget {
  //
  final double size;

  final bool disabled;

  final Color color;

  final Widget icon;

  final void Function() onPressed;

  const IconButton({
    super.key,
    this.disabled = false,
    this.color = Colors.transparent,
    this.size = 50,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(
            U.Theme.r15,
          ),
          child: InkWell(
            onTap: disabled ? null : onPressed,
            borderRadius: BorderRadius.circular(
              U.Theme.r15,
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsetsDirectional.all(8),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
