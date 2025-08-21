import 'package:flutter/material.dart';
import 'package:shop_navigator/modules/page_b/page_b.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageA extends StatelessWidget {
  //
  static const route = 'PageA';

  final String content;

  const PageA({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          U.Text('Page A'),
          const SizedBox(
            height: 30,
          ),
          U.Text(content),
          const SizedBox(
            height: 30,
          ),
          U.Button(
            title: 'Go Page B',
            onPressed: () {
              Navigator.of(context).pushNamed(
                PageB.route,
                arguments: 'PageB content',
              );
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return PageB(
              //         content: 'Page B Content',
              //       );
              //     },
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
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
