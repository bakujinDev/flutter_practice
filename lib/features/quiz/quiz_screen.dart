import 'package:flutter/material.dart';
import 'package:flutter_practice/features/quiz/data/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  List<bool> scoreKeeper = [];

  void onTapResBtn(bool answer) {
    if (quizBrain.isFinished(index)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Finished!'),
            content: const Text('You\'ve reached the end of the quiz.'),
          );
        },
      );
    } else {
      scoreKeeper.add(quizBrain.getQuestionRes(index: index, answer: answer));
      index++;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(index),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    onTapResBtn(true);
                  },
                  child: Container(
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        "True",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    onTapResBtn(false);
                  },
                  child: Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        "False",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: scoreKeeper.map((e) {
                if (e) {
                  return const Icon(
                    Icons.check,
                    color: Colors.green,
                  );
                } else {
                  return const Icon(
                    Icons.close,
                    color: Colors.red,
                  );
                }
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
