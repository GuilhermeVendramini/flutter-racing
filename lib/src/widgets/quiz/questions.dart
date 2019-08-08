import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/controllers/quiz.dart';
import 'package:racing/src/models/question.dart';
import 'package:racing/src/services/googleSignIn.dart';
import 'package:racing/src/services/quiz.dart';

class QuestionsBox extends StatefulWidget {
  @override
  _QuestionsBoxState createState() => _QuestionsBoxState();
}

class _QuestionsBoxState extends State<QuestionsBox>
    with TickerProviderStateMixin {
  Animation<double> _animationFade;
  AnimationController _animationController;
  int _currentQuestion;
  final TextEditingController _answerController = TextEditingController();

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
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionModel> _questions = Provider.of<List<QuestionModel>>(context);
    final _quizService = Provider.of<QuizService>(context);

    if (_questions.isNotEmpty) {
      _quizService.setQuizLength(_questions.length - 1);
      _currentQuestion = _quizService.getCurrentQuestion();
      _animationController.forward();
    }

    return _questions.isEmpty
        ? Container()
        : FadeTransition(
            opacity: _animationFade,
            child: Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              color: AppColors.black.withOpacity(0.8),
              child: _buildQuestion(_questions[_currentQuestion]),
            ),
          );
  }

  Widget _buildQuestion(QuestionModel question) {
    return Column(
      children: <Widget>[
        Text(
          '${question.title}',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Text('${question.tips}'),
        Divider(),
        TextField(
          controller: _answerController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: 'DIGITE AQUI',
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        _buttons(question),
      ],
    );
  }

  Widget _buttons(QuestionModel question) {
    final _user = Provider.of<UserService>(context);
    final QuizService _quizService = Provider.of<QuizService>(context);
    final int _quizLength = _quizService.getQuizLength();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('DESISTIR'),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          color: AppColors.red,
        ),
        RaisedButton(
          onPressed: () {
            QuizController().quizForward(
              quizService: _quizService,
              question: question,
              user: _user,
              finish: _quizLength == _currentQuestion,
              currentQuestion: _currentQuestion,
              answerController: _answerController,
              context: context,
            );
          },
          child: _quizLength == _currentQuestion
              ? Text('FINALIZAR')
              : Text('AVANÇAR'),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
          color: AppColors.green,
        ),
      ],
    );
  }
}
