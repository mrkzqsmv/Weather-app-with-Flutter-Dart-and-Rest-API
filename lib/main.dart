import 'package:flutter/material.dart';
import 'package:weather_app_with_api/screens/weather_app_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Scaffold(
        body: WeatherAppPage(),
      ),
    );
  }
}
