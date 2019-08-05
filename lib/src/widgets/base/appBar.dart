import 'package:flutter/material.dart';

Widget buildDefaultAppBar(BuildContext context) {
  return AppBar(
    title: RichText(
      text: TextSpan(
        text: 'TUDO',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'SOBRE',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          TextSpan(text: 'PEÇAS RACING'),
        ],
      ),
    ),
    centerTitle: true,
  );
}
