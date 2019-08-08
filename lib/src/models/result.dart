import 'package:flutter/material.dart';

class QuizResultModel {
  final String title;
  final String userAnswer;
  final bool correctAnswer;

  QuizResultModel({
    @required this.title,
    @required this.userAnswer,
    @required this.correctAnswer,
  });
}
