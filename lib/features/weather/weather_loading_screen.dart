import 'package:flutter/material.dart';

class WeatherLoadingScreen extends StatelessWidget {
  const WeatherLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          onPressed: () {},
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
