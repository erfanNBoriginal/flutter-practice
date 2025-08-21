import 'package:flutter/material.dart' as M;
import 'ui_kit.dart' as U;

class ToolTip extends M.StatelessWidget {
  //
  final String message;

  final M.Widget child;

  const ToolTip({
    super.key,
    this.message = '',
    required this.child,
  });

  @override
  M.Widget build(M.BuildContext context) {
    return M.Tooltip(
      message: message,
      height: 22,
      verticalOffset: 30,
      waitDuration: const Duration(milliseconds: 1000),
      decoration: M.BoxDecoration(
        color: U.Theme.outline2.withValues(alpha: 0.85),
        borderRadius: M.BorderRadius.circular(U.Theme.r15),
      ),
      textStyle: M.TextStyle(
        fontSize: 10,
        fontFamily: 'IranSans',
        fontWeight: M.FontWeight.w500,
        color: U.Theme.surface,
      ),
      child: child,
    );
  }
}
