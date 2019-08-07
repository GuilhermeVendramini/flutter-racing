import 'package:flutter/material.dart';

class UserQuizModel {
  final int stageId;
  final String userId;
  final String time;
  final List<Map<String, dynamic>> answers;

  UserQuizModel({
    @required this.stageId,
    @required this.userId,
    @required this.time,
    @required this.answers,
  });

  Map<String, dynamic> toJson() {
    return {
      "stageId": stageId,
      "userId": userId,
      "time": time,
      "answers": answers,
    };
  }
}
