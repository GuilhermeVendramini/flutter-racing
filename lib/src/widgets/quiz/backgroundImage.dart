import 'package:flutter/material.dart';

Widget backgroundImage() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/driver.jpg'),
        fit: BoxFit.cover,
        alignment: Alignment.bottomCenter,
      ),
    ),
  );
}
