import 'package:flutter/material.dart';
import 'ui_kit.dart' as U;

class BottomSheet extends StatelessWidget {
  //

  static show(
    BuildContext context, {
    double? maxWidth,
    double? maxHeight,
    bool useRootNavigator = false,
    required Widget Function(BuildContext context) builder,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: useRootNavigator,
      barrierColor: Colors.black54,
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? 1024,
        maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.80,
      ),
      builder: (context) {
        return U.BottomSheet(
          child: builder(context),
        );
      },
    );
  }

  final Widget child;

  const BottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: U.Theme.background,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(U.Theme.r20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 5,
            width: 70,
            decoration: BoxDecoration(
              color: U.Theme.outline2,
              borderRadius: BorderRadius.circular(U.Theme.r15),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}
