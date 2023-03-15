import 'package:flutter/material.dart';
import 'package:flutter_practice/features/weather/services/weather.dart';
import 'package:flutter_practice/features/weather/weather_location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherLoadingScreen extends StatefulWidget {
  const WeatherLoadingScreen({super.key});

  @override
  State<WeatherLoadingScreen> createState() => _WeatherLoadingScreenState();
}

class _WeatherLoadingScreenState extends State<WeatherLoadingScreen> {
  late double latitude;
  late double longtitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var weatherData = await WeatherModel().getLocationWeather();

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) {
          return WeatherLocationScreen(
            locationWeather: weatherData,
          );
        }),
      ),
    );
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    getData();

    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
