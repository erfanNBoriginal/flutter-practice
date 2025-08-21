import 'package:flutter/material.dart';
import 'package:widgets/weather_card.dart';

class WeatherPage extends StatelessWidget {
  //
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 26,
        vertical: 36,
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          spacing: 20,
          children: [
            WeatherCard(
              icon: Icons.accessibility,
            ),
            WeatherCard(
              icon: Icons.baby_changing_station,
            ),
            WeatherCard(
              icon: Icons.text_snippet_rounded,
            ),
            WeatherCard(
              icon: Icons.ios_share_sharp,
            ),
            WeatherCard(
              icon: Icons.account_circle,
            ),
          ],
        ),
      ),
    );
  }
}
