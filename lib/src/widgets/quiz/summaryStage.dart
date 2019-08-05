import 'package:flutter/material.dart';

Widget summaryStage() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 80.0,
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _stage(),
          _lap(),
          _timer(),
        ],
      ),
    ),
  );
}

Widget _timer() {
  return Column(
    children: <Widget>[
      Icon(
        Icons.timer,
        size: 20.0,
      ),
      Divider(
        height: 2.0,
      ),
      Text(
        '15:00:00',
        style: TextStyle(
          fontFamily: "Digital-7",
        ),
      ),
    ],
  );
}

Widget _stage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Etapa',
      ),
      Divider(
        height: 2.0,
      ),
      Image(
        image: AssetImage('assets/images/cofap.png'),
        height: 15.0,
      ),
    ],
  );
}

Widget _lap() {
  return Column(
    children: <Widget>[
      Icon(
        Icons.flag,
        size: 20.0,
      ),
      Row(
        children: <Widget>[
          Text(
            'LAP',
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            '1/3',
            style: TextStyle(
              fontFamily: "Digital-7",
            ),
          ),
        ],
      ),
    ],
  );
}
