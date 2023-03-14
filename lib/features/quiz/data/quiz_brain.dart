import 'package:flutter_practice/features/quiz/data/question.dart';

class QuizBrain {
  final List<Question> _questionsBank = [
    Question(
        text: 'You can lead a cow down stiars but not up stiars.',
        answer: false),
    Question(
        text: 'Approximately one quater of human bones are in the feet.',
        answer: true),
    Question(text: 'A slug\'s blood is green', answer: true),
  ];

  String getQuestionText(int index) => _questionsBank[index].text;

  bool getQuestionRes({required int index, required bool answer}) {
    if (answer == _questionsBank[index].answer) {
      return true;
    } else {
      return false;
    }
  }

  bool isFinished(int index) {
    if (index >= _questionsBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
