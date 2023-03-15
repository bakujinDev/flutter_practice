import 'package:flutter/material.dart';
import 'package:flutter_practice/features/weather/city_screen.dart';
import 'package:flutter_practice/features/weather/services/weather.dart';
import 'package:flutter_practice/features/weather/utils/constants.dart';

class WeatherLocationScreen extends StatefulWidget {
  const WeatherLocationScreen({
    super.key,
    required this.locationWeather,
  });

  final locationWeather;

  @override
  State<WeatherLocationScreen> createState() => _WeatherLocationScreenState();
}

class _WeatherLocationScreenState extends State<WeatherLocationScreen> {
  WeatherModel weather = WeatherModel();

  late int temperature = 0;
  late String weatherIcon = '';
  late String cityName = '';

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();

    int condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    cityName = weatherData['name'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/B_location.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.near_me,
                      size: 50,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CityScreen(),
                        ),
                      );

                      if (typedName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.location_city,
                      size: 50,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  "${weather.getMessage(temperature)} in $cityName!",
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
