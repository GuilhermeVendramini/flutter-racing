import 'dart:async';
import 'dart:ui';

import 'package:countdown/countdown.dart';
import 'package:flutter/material.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/widgets/base/appBar.dart';
import 'package:racing/src/widgets/quiz/backgroundImage.dart';
import 'package:racing/src/widgets/quiz/summaryStage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class QuizPageScreen extends StatefulWidget {
  final bool scrollTab;

  QuizPageScreen({this.scrollTab = true});

  @override
  _QuizPageScreenState createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen>
    with TickerProviderStateMixin {
  String _count = '5';
  bool _gameStart = false;
  AnimationController _animationController;
  Animation<double> _animationFade;
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
        _animationController.forward();
      });
      _streamSubscription.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    _countdown();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationFade = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
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
        child: _gameStart ? _quizBox() : _countdownView(),
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

  Widget _quizBox() {
    return FadeTransition(
      opacity: _animationFade,
      child: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        color: AppColors.black.withOpacity(0.8),
        child: Column(
          children: <Widget>[
            _question(),
            SizedBox(
              height: 30.0,
            ),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _question() {
    return Column(
      children: <Widget>[
        Text(
          'QUAL O CÓDIGO COFAP?',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Text('AMORTECEDOR', textAlign: TextAlign.center),
            Text('TRASEIRO DIREITO', textAlign: TextAlign.center),
            Text('CORSA 10', textAlign: TextAlign.center),
            Text('2006/2007', textAlign: TextAlign.center),
          ],
        ),
        Divider(),
        TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: 'DIGITE AQUI',
          ),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('DESISTIR'),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          color: AppColors.red,
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('AVANÇAR'),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          color: AppColors.green,
        ),
      ],
    );
  }
}
