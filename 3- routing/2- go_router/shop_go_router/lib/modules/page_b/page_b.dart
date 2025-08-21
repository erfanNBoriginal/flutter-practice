import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/modules/page_c/page_c.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageB extends StatelessWidget {
  //
  static const route = '/PageB';

  final String content;

  final bool testbool;

  const PageB({
    super.key,
    required this.content,
    this.testbool = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          U.Text('Page B'),
          const SizedBox(
            height: 30,
          ),
          U.Text(content),
          const SizedBox(
            height: 30,
          ),
          U.Button(
            title: 'Go Page C',
            onPressed: () {
              GoRouter.of(context).goNamed(
                PageC.route,
              );
              // Navigator.of(context).pushNamed(
              //   PageC.route,
              //   arguments: 'PageC content',
              // );
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => PageC(
              //       content: 'Page C Content',
              //     ),
              //   ),
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
    );
  }
}
