import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:racing/src/data/firestoreService.dart';
import 'package:racing/src/models/question.dart';
import 'package:racing/src/models/quiz.dart';

class QuizDataService extends FirestoreService {
  Stream<List<QuestionModel>> loadStreamQuestions() {
    return firestore.collection("questions").snapshots().map((list) =>
        list.documents.map((doc) => QuestionModel.fromFirestore(doc)).toList());
  }

  void saveUserQuiz(UserQuizModel quiz) {
    firestore.collection("userQuiz").add(quiz.toJson());
  }

  Future<QuerySnapshot> loadQuestions() {
    return firestore.collection("questions").getDocuments();
  }

  Future<QuerySnapshot> loadQuestion({int id}) {
    return firestore
        .collection("questions")
        .where("id", isEqualTo: id)
        .getDocuments();
  }

  Future<QuerySnapshot> loadUserQuiz({String userId, int stageId}) {
    return firestore
        .collection("userQuiz")
        .where("userId", isEqualTo: userId)
        .where("stageId", isEqualTo: stageId)
        .orderBy("date", descending: true)
        .getDocuments();
  }
}
