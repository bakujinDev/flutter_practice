import 'dart:math';

import 'package:flutter/material.dart';

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> {
  int _ballNum = 1;

  void _onTap() {
    _ballNum = Random().nextInt(5) + 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ask Me Anything")),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: _onTap,
            child: Image.asset('assets/images/ball$_ballNum.png'),
          ),
        ),
      ),
    );
  }
}
