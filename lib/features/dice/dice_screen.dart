import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 5;

  void _onTapDice() {
    leftDiceNumber = Random().nextInt(6) + 1;
    rightDiceNumber = Random().nextInt(6) + 1;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: _onTapDice,
                    child: Image.asset('assets/images/dice$leftDiceNumber.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: _onTapDice,
                    child:
                        Image.asset('assets/images/dice$rightDiceNumber.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
