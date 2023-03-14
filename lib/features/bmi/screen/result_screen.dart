import 'package:flutter/material.dart';
import 'package:flutter_practice/features/bmi/data/calculator_brain.dart';
import 'package:flutter_practice/features/bmi/utils/constants.dart';
import 'package:flutter_practice/features/bmi/widget/bottom_button.dart';
import 'package:flutter_practice/features/bmi/widget/reuseable_card.dart';

class ResultScreen extends StatelessWidget {
  final CalculatorBrain calc;

  const ResultScreen({
    super.key,
    required this.calc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  "Your Result",
                  style: kTItleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: ReuseableCard(
                  color: kActivCardColor,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          calc.getResult(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          calc.calculateBMI(),
                          style: kBMITextStyle,
                        ),
                        Text(
                          calc.getInterPretation(),
                          style: kBodyTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            BottomButton(
              onTap: () {},
              buttonTitle: 'RE-CALCULATE',
            )
          ],
        ),
      ),
    );
  }
}
