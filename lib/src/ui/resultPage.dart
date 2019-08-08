import 'package:flutter/material.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/controllers/quiz.dart';
import 'package:racing/src/models/result.dart';
import 'package:racing/src/widgets/base/appBar.dart';
import 'package:racing/src/widgets/quiz/backgroundImage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class ResultPageScreen extends StatefulWidget {
  @override
  _ResultPageScreenState createState() => _ResultPageScreenState();
}

class _ResultPageScreenState extends State<ResultPageScreen>
    with TickerProviderStateMixin {
  Animation<double> _animationFade;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationFade = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
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
              _main(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _main() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            _pageTitle(),
            SizedBox(
              height: 20.0,
            ),
            _buildResultList(),
          ],
        ),
      ),
    );
  }

  _pageTitle() {
    return Text(
      'RESULTADO',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  _buildResultList() {
    QuizController _quizController = QuizController();
    return FutureBuilder<List<QuizResultModel>>(
      future: _quizController.getUserQuizResult(
          stageId: 1, userId: '116641360881810574394'),
      initialData: [],
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _resultCard(snapshot.data[index]);
              });
        }
      },
    );
  }

  _resultCard(QuizResultModel result) {
    _animationController.forward();
    return FadeTransition(
      opacity: _animationFade,
      child: Card(
          color: result.correctAnswer
              ? AppColors.green
              : AppColors.red.withOpacity(0.6),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      result.title.toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('R: ${result.userAnswer}'),
                  ],
                ),
                Icon(
                  result.correctAnswer ? Icons.done : Icons.error_outline,
                ),
              ],
            ),
          )),
    );
  }
}
