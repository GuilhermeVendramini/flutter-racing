import 'package:flutter/material.dart';

Widget backgroundImage() {
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
          image: AssetImage('assets/images/bkmoving.jpg'),
        ),
      ),
    ),
  );
}
