
import 'package:flutter/material.dart';

Widget textWidget(String title, Color colorText, Color colorBorder, double size, double strokeWidth, String fontFamily ){
  return  Stack(
    children: <Widget>[
      // Stroked text as border.
      Text(
        title,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: size,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = colorBorder),
        ),
      // Solid text as fill.
      Text(
        title,
        style: TextStyle(
          fontFamily: fontFamily,
          fontSize: size,
          color: colorText,
        ),
      ),
    ],
  );
}