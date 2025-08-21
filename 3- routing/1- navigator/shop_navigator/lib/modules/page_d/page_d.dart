import 'package:flutter/material.dart';
import 'package:shop_navigator/modules/page_f/page_f.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageD extends StatelessWidget {
  //
  static const route = 'PageD';

  final String content;

  const PageD({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        U.Text('Page D'),
        const SizedBox(
          height: 30,
        ),
        U.Text(content),
        const SizedBox(
          height: 30,
        ),
        U.Button(
          title: 'Go Page F',
          onPressed: () {
            Navigator.of(context).pushNamed(
              PageF.route,
              arguments: 'PageF content',
            );
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
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
