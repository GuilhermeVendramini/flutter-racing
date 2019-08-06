import 'package:flutter/material.dart';

class _QuizController with ChangeNotifier {
  int _currentQuestion = 0;
  int _quizLength;
}

class Quiz extends _QuizController {
  int getCurrentQuestion() {
    return _currentQuestion;
  }

  int getQuizLength() {
    return _quizLength;
  }
}

class QuizService extends Quiz {
  void setCurrentQuestion(int index) {
    _currentQuestion = index;
    notifyListeners();
  }

  void setQuizLength(int length) {
    _quizLength = length;
  }
}
