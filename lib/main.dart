import 'package:flutter/material.dart';
import 'package:flutter_application_1/additional_information.dart';
import 'package:flutter_application_1/apis.dart';
import 'package:flutter_application_1/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheather App',
      theme: ThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'wheatherApp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, '26.3', 'Georgia'),
          SizedBox(
            height: 60,
          ),
          Text(
            'Additional Information',
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.green,
                fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),additionalInformation('24', '2', '1014', '24.6'),
        ],
      ),
    );
  }
}
