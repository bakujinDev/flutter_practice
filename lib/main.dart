import 'package:flutter/material.dart';
import 'package:flutter_practice/features/coin/price_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData.dark().copyWith(
      //   primaryColor: const Color(0xff0a0e21),
      //   scaffoldBackgroundColor: const Color(0xff0a0e21),
      //   appBarTheme: AppBarTheme.of(context).copyWith(
      //     backgroundColor: const Color(0xff0a0e21),
      //   ),
      // ),
      home: const PriceScreen(),
    );
  }
}
