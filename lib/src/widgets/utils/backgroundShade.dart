import 'package:flutter/material.dart';

Widget backgroundShade({double opacity = 0.4}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black.withOpacity(opacity),
        ],
        stops: [
          0.0,
          1.0,
        ],
      ),
    ),
  );
}
