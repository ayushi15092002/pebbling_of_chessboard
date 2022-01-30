
import 'package:flutter/material.dart';

Widget FlavorText(String title, Color colorText, Color colorBorder, double size){
  return  Stack(
    children: <Widget>[
      // Stroked text as border.
      Text(
        title,
        style: TextStyle(
          fontFamily: "Flavors",
          fontSize: size,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 17
            ..color = colorBorder),
        ),
      // Solid text as fill.
      Text(
        title,
        style: TextStyle(
          fontFamily: "Flavors",
          fontSize: size,
          color: colorText,
        ),
      ),
    ],
  );
}