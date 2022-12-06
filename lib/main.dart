import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_by_geo_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wheater App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WheatherByGeoCode());
  }
}
