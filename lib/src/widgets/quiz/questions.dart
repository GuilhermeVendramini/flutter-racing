import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/models/quiz.dart';

class QuestionsBox extends StatefulWidget {
  @override
  _QuestionsBoxState createState() => _QuestionsBoxState();
}

class _QuestionsBoxState extends State<QuestionsBox>
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
    List<QuizModel> question = Provider.of<List<QuizModel>>(context);
    if (question.isNotEmpty) _animationController.forward();
    return question.isEmpty
        ? Container()
        : FadeTransition(
            opacity: _animationFade,
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              color: AppColors.black.withOpacity(0.8),
              child: _buildQuestion(question),
            ),
          );
  }

  Widget _buildQuestion(List<QuizModel> question) {
    return Column(
      children: <Widget>[
        Text(
          '${question[0].title}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text('${question[0].tips}'),
        Divider(),
        TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: 'DIGITE AQUI',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        _buttons(),
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
