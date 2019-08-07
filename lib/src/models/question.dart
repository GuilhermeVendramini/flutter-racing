import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionModel {
  final int id;
  final String title;
  final int stageId;
  final String tips;

  QuestionModel({
    @required this.id,
    @required this.title,
    @required this.stageId,
    @required this.tips,
  });

  factory QuestionModel.fromMap(Map data) {
    data = data ?? {};

    return QuestionModel(
      id: data['id'],
      title: data['title'],
      stageId: data['stageId'],
      tips: data['tips'],
    );
  }

  factory QuestionModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return QuestionModel(
      id: data['id'],
      title: data['title'],
      stageId: data['stageId'],
      tips: data['tips'],
    );
  }
}
