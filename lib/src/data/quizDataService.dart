import 'package:racing/src/data/firestoreService.dart';
import 'package:racing/src/models/question.dart';
import 'package:racing/src/models/quiz.dart';

class QuizDataService extends FirestoreService {
  Stream<List<QuestionModel>> loadQuestions() {
    return firestore.collection("questions").snapshots().map((list) =>
        list.documents.map((doc) => QuestionModel.fromFirestore(doc)).toList());
  }

  void saveUserQuiz(UserQuizModel quiz) {
    firestore.collection("userQuiz").add(quiz.toJson());
  }
}
