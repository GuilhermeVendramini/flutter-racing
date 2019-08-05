import 'package:flutter/material.dart';
import 'package:racing/src/constants/appColors.dart';
import 'package:racing/src/widgets/base/backgroundImage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        backgroundImage(),
        backgroundShade(),
        _scroll(),
      ],
    );
  }

  Widget _scroll() {
    return SingleChildScrollView(
      child: Container(
        height: 640.0,
        child: Stack(
          children: <Widget>[
            _summaryBox(),
            _car(),
            _stageBox(),
          ],
        ),
      ),
    );
  }

  Widget _summaryBox() {
    return Positioned(
      top: 280.0,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(80.0),
            bottomRight: Radius.circular(80.0),
          ),
        ),
        height: 150.0,
        width: MediaQuery.of(context).size.width * 0.95,
        child: _summary(),
      ),
    );
  }

  Widget _car() {
    return Positioned(
      top: 40.0,
      right: -120.0,
      child: Image(
        height: 300.0,
        image: AssetImage('assets/images/car.png'),
      ),
    );
  }

  Widget _summary() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _trophy(),
          SizedBox(
            width: 4.0,
          ),
          _position(),
          SizedBox(
            width: 4.0,
          ),
          _points(),
        ],
      ),
    );
  }

  Widget _trophy() {
    return Image(
      height: 60.0,
      image: AssetImage('assets/images/trophy.png'),
    );
  }

  Widget _position() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Você está em',
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' 15º lugar',
                    style: TextStyle(
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Subiu 2 posições',
              style: TextStyle(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 4.0,
        ),
        Icon(
          Icons.arrow_upward,
          color: AppColors.green,
          size: 30.0,
        ),
      ],
    );
  }

  Widget _points() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '1250',
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        Text(
          'pontos',
          style: TextStyle(color: AppColors.black),
        ),
      ],
    );
  }

  Widget _stageBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 200.0,
        padding: EdgeInsets.all(20.0),
        color: AppColors.black.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _pin(),
            _currentStage(),
            _avatar(),
          ],
        ),
      ),
    );
  }

  Widget _pin() {
    return Image(
      image: AssetImage('assets/images/pin.png'),
      height: 50.0,
      color: AppColors.blue,
    );
  }

  Widget _currentStage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Etapa Ativada',
          style: TextStyle(
            fontSize: 18.0,
            color: AppColors.lightBlue,
          ),
        ),
        Divider(),
        Image(
          image: AssetImage('assets/images/cofap.png'),
          height: 30.0,
        ),
      ],
    );
  }

  Widget _avatar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 42.0,
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
        Divider(
          height: 8.0,
        ),
        Text(
          'Carol',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(
          height: 2.0,
        ),
        Text(
          'Lider da etapa',
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
      ],
    );
  }
}
