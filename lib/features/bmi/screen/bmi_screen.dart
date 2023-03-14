import 'package:flutter/material.dart';
import 'package:flutter_practice/features/bmi/data/bmi.dart';
import 'package:flutter_practice/features/bmi/data/calculator_brain.dart';
import 'package:flutter_practice/features/bmi/screen/result_screen.dart';
import 'package:flutter_practice/features/bmi/widget/bottom_button.dart';
import 'package:flutter_practice/features/bmi/widget/icon_content.dart';
import 'package:flutter_practice/features/bmi/widget/reuseable_card.dart';
import 'package:flutter_practice/features/bmi/widget/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/constants.dart';

Bmi bmi = Bmi();

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  void onClickGenderBtn(Gender gender) {
    bmi.gender = gender;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "BMI CALCULATOR",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                      onPress: () => onClickGenderBtn(Gender.male),
                      color: bmi.gender == Gender.male
                          ? kActivCardColor
                          : kInactivCardColor,
                      cardChild: IconContent(
                        icon: bmi.getIcon(Category.male),
                        label: bmi.getLabel(Category.male),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () => onClickGenderBtn(Gender.female),
                      color: bmi.gender == Gender.female
                          ? kActivCardColor
                          : kInactivCardColor,
                      cardChild: IconContent(
                        icon: bmi.getIcon(Category.female),
                        label: bmi.getLabel(Category.female),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: ReuseableCard(
                onPress: () => onClickGenderBtn(Gender.female),
                color: kActivCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bmi.getLabel(Category.height),
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${bmi.height}',
                          style: kNumberTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        thumbColor: kRed1,
                        overlayColor: kRedA16,
                      ),
                      child: Slider(
                        value: bmi.height.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: kGray1,
                        onChanged: (double v) {
                          bmi.height = v.round();
                          setState(() {});
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ReuseableCard(
                      color: kActivCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bmi.getLabel(Category.weight),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            bmi.weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: bmi.weight <= 1
                                    ? null
                                    : () {
                                        setState(() {
                                          bmi.weight--;
                                        });
                                      },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    bmi.weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ReuseableCard(
                      color: kActivCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bmi.getLabel(Category.age),
                            style: kLabelTextStyle,
                          ),
                          Text(
                            bmi.age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: bmi.age <= 1
                                    ? null
                                    : () {
                                        setState(() {
                                          bmi.age--;
                                        });
                                      },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    bmi.age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                height: bmi.height,
                weight: bmi.weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    calc: calc,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
