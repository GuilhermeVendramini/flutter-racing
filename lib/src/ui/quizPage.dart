import 'dart:async';
import 'dart:ui';

import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/data/questions.dart';
import 'package:racing/src/models/quiz.dart';
import 'package:racing/src/widgets/base/appBar.dart';
import 'package:racing/src/widgets/quiz/backgroundImage.dart';
import 'package:racing/src/widgets/quiz/questions.dart';
import 'package:racing/src/widgets/quiz/summaryStage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class QuizPageScreen extends StatefulWidget {
  final bool scrollTab;

  QuizPageScreen({this.scrollTab = true});

  @override
  _QuizPageScreenState createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen> {
  String _count = '5';
  bool _gameStart = false;
  CountDown _countDown = CountDown(Duration(seconds: 6));
  StreamSubscription<Duration> _streamSubscription;

  void _countdown() {
    _streamSubscription = _countDown.stream.listen(null);
    _streamSubscription.onData((Duration d) {
      setState(() {
        _count = d.inSeconds.toString();
      });
    });

    _streamSubscription.onDone(() {
      setState(() {
        _gameStart = true;
      });
      _streamSubscription.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    _countdown();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: buildDefaultAppBar(context),
          body: Stack(
            children: <Widget>[
              backgroundImage(),
              backgroundShade(opacity: 0.6),
              RotatedBox(
                quarterTurns: 2,
                child: backgroundShade(opacity: 0.2),
              ),
              summaryStage(),
              _main(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _main() {
    return Center(
      child: SingleChildScrollView(
        child: _gameStart ? _questions() : _countdownView(),
      ),
    );
  }

  Widget _countdownView() {
    return Text(
      _count,
      style: TextStyle(
        fontFamily: "Digital-7",
        fontSize: 100.0,
      ),
    );
  }

  Widget _questions() {
    return StreamProvider<List<QuizModel>>.value(
      value: QuestionsService().loadQuestions(),
      initialData: [],
      child: QuestionsBox(),
    );
  }
}
