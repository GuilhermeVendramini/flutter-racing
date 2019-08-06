import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuizModel {
  final int id;
  final String title;
  final int stage;
  final String tips;

  QuizModel({
    @required this.id,
    @required this.title,
    @required this.stage,
    @required this.tips,
  });

  factory QuizModel.fromMap(Map data) {
    data = data ?? {};

    return QuizModel(
      id: data['id'],
      title: data['title'],
      stage: data['stage'],
      tips: data['tips'],
    );
  }

  factory QuizModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return QuizModel(
      id: data['id'],
      title: data['title'],
      stage: data['stage'],
      tips: data['tips'],
    );
  }
}
