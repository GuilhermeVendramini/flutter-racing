import 'package:racing/src/data/firestoreService.dart';
import 'package:racing/src/models/question.dart';

class QuestionsService extends FirestoreService {
  Stream<List<QuestionModel>> loadQuestions() {
    return firestore.collection("questions").snapshots().map((list) =>
        list.documents.map((doc) => QuestionModel.fromFirestore(doc)).toList());
  }
}
