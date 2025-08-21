import 'package:flutter/material.dart';
// import 'package:widgets/column_layout.dart';
// import 'package:widgets/row_layout.dart';
// import 'package:widgets/staack_layout.dart';
import 'package:widgets/weather_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: WeatherPage(),
      ),
    );
  }
}
