import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:racing/src/data/quizDataService.dart';
import 'package:racing/src/models/question.dart';
import 'package:racing/src/models/result.dart';
import 'package:racing/src/services/googleSignIn.dart';
import 'package:racing/src/services/quiz.dart';
import 'package:racing/src/ui/resultPage.dart';

class QuizController {
  void quizForward({
    QuizService quizService,
    QuestionModel question,
    UserService user,
    bool finish,
    BuildContext context,
    int currentQuestion,
    TextEditingController answerController,
  }) {
    quizService.quizForward(
      question: question,
      currentQuestion: currentQuestion,
      userId: user.getCurrentUser().id,
      answer: answerController.text,
    );
    answerController.clear();

    if (finish) {
      quizService.saveUserQuiz();
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPageScreen(),
        ),
      );
    }
  }

  Future<List<QuizResultModel>> getUserQuizResult(
      {String userId, int stageId}) async {
    List<QuizResultModel> _userQuizResult = [];
    final QuizDataService _quizDataService = QuizDataService();
    final QuerySnapshot _userQuiz = await _quizDataService.loadUserQuiz(
      userId: userId,
      stageId: stageId,
    );

    final List<dynamic> _answers = _userQuiz.documents.first.data['answers'];
    QuerySnapshot _questions = await _quizDataService.loadQuestions();
    List<DocumentSnapshot> _documentData = _questions.documents;

    _answers.forEach((answer) async {
      Map<String, dynamic> _questionData = _documentData
          .firstWhere((q) => q['id'] == int.parse(answer.keys.first))
          .data;
      _userQuizResult.add(QuizResultModel(
        title: _questionData['title'],
        correctAnswer: _questionData['answer'] == answer.values.first,
        userAnswer: answer.values.first,
      ));
    });

    return _userQuizResult;
  }
}
