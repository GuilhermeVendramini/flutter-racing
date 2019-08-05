import 'package:flutter/material.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/ui/quizPage.dart';
import 'package:racing/src/utils/pageRouteFade.dart';
import 'package:racing/src/widgets/quiz/backgroundImage.dart';
import 'package:racing/src/widgets/quiz/summaryStage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class QuizStartScreen extends StatefulWidget {
  final bool scrollTab;

  QuizStartScreen({this.scrollTab = true});

  @override
  _QuizStartScreenState createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }

  Widget _main() {
    return Center(
      child: SingleChildScrollView(
        child: _startBox(),
      ),
    );
  }

  Widget _startBox() {
    return Container(
      padding: EdgeInsets.all(40.0),
      color: AppColors.black.withOpacity(0.8),
      child: Column(
        children: <Widget>[
          _message(),
          SizedBox(
            height: 40.0,
          ),
          _startButton(),
        ],
      ),
    );
  }

  Widget _startButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          PageRouteFade(builder: (context) => QuizPageScreen()),
        );
      },
      child: Text('INICIAR'),
      padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
    );
  }

  Widget _message() {
    return Text(
      'MELHORE SUA POSIÇÃO\nINICIE O PRÓXIMO DESAFIO!',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
