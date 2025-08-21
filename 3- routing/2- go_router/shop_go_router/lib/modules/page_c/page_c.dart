import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_go_router/modules/page_b/page_b.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageC extends StatelessWidget {
  //
  static const route = '/PageC';

  final String content;

  final Widget childPage;

  const PageC({
    super.key,
    required this.content,
    required this.childPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyan,
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            U.Text('Page C'),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                child: childPage,
              ),
            ),
            U.Button(
              title: 'Go B',
              onPressed: () {
                GoRouter.of(context).goNamed(
                  '${PageB.route}2',
                );
                // GoRouter.of(context).pushNamed(
                //   PageB.route,
                // );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            U.Button(
              title: 'Go Back',
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
