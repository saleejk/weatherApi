import 'package:flutter/material.dart';
import 'package:flutter_application_1/additional_information.dart';
import 'package:flutter_application_1/apis.dart';
import 'package:flutter_application_1/current_weather.dart';
import 'package:flutter_application_1/services/weather_api_client.dart';
import 'package:flutter_application_1/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheather App',
      theme: ThemeData(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = await client.getCurrentWeather("Georgia");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentWeather(Icons.wb_sunny_rounded, '${data!.temp}',
                          '${data!.cityName}'),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Additional Information',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.0,
                      ),
                      additionalInformation(
                          '${data!.wind}',
                          '${data!.humidity}',
                          '${data!.pressure}',
                          '${data!.feels_like}'),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ],
        ));
  }
}
