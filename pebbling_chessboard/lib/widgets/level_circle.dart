import 'package:flutter/material.dart';

import '../game.dart';
import '../level_screen.dart';
import 'TextWidget.dart';

var size, height, width;

class LevelCircleWidget extends StatelessWidget {
  final int levelNumber;

  const LevelCircleWidget({
    Key? key,
    required this.levelNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return GestureDetector(
      child: Container(
        decoration:  BoxDecoration(
          color:  Colors.black, // border color
          shape: BoxShape.circle,
        ),
        height: height * 0.17,
        width: width * 0.17,
        child: CircleAvatar(
          backgroundColor: Color(0xff86B5EC),
          child: textWidget( levelNumber.toString(),  Colors.black, Colors.black,
              levelNumber>=100 ? width * 0.08 :width * 0.1, 1, "Rye"),
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LevelScreen(level: levelNumber,)),
        );
      },
    );
  }
}
