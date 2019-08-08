import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/services/googleSignIn.dart';
import 'package:racing/src/services/quiz.dart';
import 'package:racing/src/ui/basePages.dart';

import 'constants/appTheme.dart';
// import 'models/question.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserService>(builder: (_) => UserService()),
        ChangeNotifierProvider<QuizService>(builder: (_) => QuizService()),
        // StreamProvider<List<QuestionModel>>.value(value: QuestionsService().loadQuestions()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TUDOSOBREPEÇAS RACING',
        theme: themeData,
        home: BaseScreen(),
      ),
    );
  }
}
