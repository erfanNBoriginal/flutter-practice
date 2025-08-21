import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class AppBar extends StatelessWidget {
  //
  final bool isPrimary;

  final String? title;

  final Widget? action;

  final void Function()? onMenuPressed;

  final void Function()? onNotifPressed;

  final void Function()? onBackPressed;

  const AppBar.primary({
    super.key,
    required void Function() this.onMenuPressed,
    required void Function() this.onNotifPressed,
  })  : isPrimary = true,
        title = null,
        action = null,
        onBackPressed = null;

  const AppBar.secondary({
    super.key,
    required String this.title,
    required void Function() this.onBackPressed,
    this.action,
  })  : isPrimary = false,
        onMenuPressed = null,
        onNotifPressed = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: U.Theme.surface,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          if (isPrimary) ...[
            U.IconButton(
              color: Colors.transparent,
              icon: U.Image.icon(path: U.Icons.bell),
              onPressed: onNotifPressed!,
            ),
            const Spacer(),
            U.Image(
              path: U.Images.logo,
            ),
            const Spacer(),
            U.IconButton(
              color: Colors.transparent,
              icon: U.Image.icon(path: U.Icons.humburger),
              onPressed: onMenuPressed!,
            ),
          ] else ...[
            action != null ? action! : SizedBox(width: 50),
            const Spacer(),
            U.Text(
              title!,
              font: U.TextFont.yekan,
              size: U.TextSize.s20,
              weight: U.TextWeight.regular,
            ),
            const Spacer(),
            U.IconButton(
              color: Colors.transparent,
              icon: U.Image.icon(path: U.Icons.arrowLeft),
              onPressed: onBackPressed!,
            ),
          ],
        ],
      ),
    );
  }
}
