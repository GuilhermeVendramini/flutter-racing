import 'package:flutter/material.dart';
import 'package:racing/src/widgets/quiz/backgroundImage.dart';
import 'package:racing/src/widgets/utils/backgroundShade.dart';

class CleanPageScreen extends StatefulWidget {
  @override
  _CleanPageScreenState createState() => _CleanPageScreenState();
}

class _CleanPageScreenState extends State<CleanPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              backgroundImage(),
              backgroundShade(),
            ],
          ),
        ),
      ),
    );
  }
}
