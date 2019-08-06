import 'package:racing/src/data/firestoreService.dart';
import 'package:racing/src/models/quiz.dart';

class QuestionsService extends FirestoreService {
  Stream<List<QuizModel>> loadQuestions() {
    return firestore.collection("questions").snapshots().map((list) =>
        list.documents.map((doc) => QuizModel.fromFirestore(doc)).toList());
  }
}
