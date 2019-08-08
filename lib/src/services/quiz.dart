import 'package:flutter/material.dart';
import 'package:racing/src/data/quizDataService.dart';
import 'package:racing/src/models/question.dart';
import 'package:racing/src/models/quiz.dart';

class _QuizServiceBase with ChangeNotifier {
  int _currentQuestion = 0;
  int _quizLength;
  UserQuizModel _quiz;
  List<Map<String, dynamic>> _answers = [];
}

class Quiz extends _QuizServiceBase {
  int getCurrentQuestion() {
    return _currentQuestion;
  }

  int getQuizLength() {
    return _quizLength;
  }

  UserQuizModel getUserQuiz() {
    return _quiz;
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

  void quizForward(
      {QuestionModel question,
      int currentQuestion,
      String userId,
      dynamic answer}) {
    _currentQuestion = currentQuestion + 1;
    _answers.add({question.id.toString(): answer});
    _quiz = UserQuizModel(
      stageId: question.stageId,
      userId: userId,
      time: '500',
      date: DateTime.now().millisecondsSinceEpoch,
      answers: _answers,
    );
    notifyListeners();
  }

  void saveUserQuiz() {
    QuizDataService().saveUserQuiz(_quiz);
    _currentQuestion = 0;
    _quizLength = null;
    _quiz = null;
    _answers = [];
  }
}
