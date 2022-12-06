import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/api_response.dart';

class WheatherByGeoCode extends StatefulWidget {
  const WheatherByGeoCode({super.key});

  @override
  State<WheatherByGeoCode> createState() => _WheatherByGeoCodeState();
}

class _WheatherByGeoCodeState extends State<WheatherByGeoCode> {
  void getWeather() async {
    final queryParameters = {
      'lat': '41.675246',
      'lon': '26.555880',
      'appid': 'd15cc87781439546b43c86182019a96a',
      'units': 'metric'
    };

    var client = http.Client();
    try {
      var response = await client.get(
        Uri.https(
            'api.openweathermap.org', 'data/2.5/weather/', queryParameters),
      );

      ApiResponse apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      print(apiResponse.sys!.country!);
      print(apiResponse.main!.temp!);
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Current Geo Location',
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
              onPressed: () async {
                getWeather();
              },
              child: Text('Call Api')),
        ],
      ),
    );
  }
}
