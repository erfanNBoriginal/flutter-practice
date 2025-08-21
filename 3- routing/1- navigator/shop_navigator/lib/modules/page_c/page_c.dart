import 'package:flutter/material.dart';
import 'package:shop_navigator/modules/page_d/page_d.dart';
import 'package:shop_navigator/modules/page_f/page_f.dart';
import '/ui_kit/ui_kit.dart' as U;

class PageC extends StatelessWidget {
  //
  static const route = 'PageC';

  final String content;

  const PageC({
    super.key,
    required this.content,
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
                child: Navigator(
                  initialRoute: PageD.route,
                  onGenerateRoute: (settings) {
                    final Route route;
                    switch (settings.name) {
                      case PageD.route:
                        route = MaterialPageRoute(
                          builder: (context) => PageD(content: ''),
                        );
                        break;
                      case PageF.route:
                        route = MaterialPageRoute(
                          builder: (context) => PageF(
                            content: '',
                          ),
                        );
                        break;
                      default:
                        route = MaterialPageRoute(
                          builder: (context) => PageD(content: ''),
                        );
                        break;
                    }
                    return route;
                  },
                ),
              ),
            ),
            U.Button(
              title: 'Go Back',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
