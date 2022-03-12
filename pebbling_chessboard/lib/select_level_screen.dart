import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/prison/prison.dart';
import 'package:pebbling_chessboard/widgets/ButtonWidget.dart';
import 'package:pebbling_chessboard/widgets/CardWidget.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';
import 'package:pebbling_chessboard/widgets/level_circle.dart';
import 'package:pebbling_chessboard/widgets/prisonWidget.dart';

import 'choose_no_of_clones.dart';
import 'game.dart';

class SelectLevelScreen extends StatefulWidget {
  @override
  State<SelectLevelScreen> createState() => SelectLevelScreenState();
}

class SelectLevelScreenState extends State<SelectLevelScreen> {
  var size, height, width;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Timer(
        Duration(milliseconds: 1),
        () => _scrollController
            .jumpTo(_scrollController.position.maxScrollExtent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Center(
                child: Image.asset("assets/images/path2.png"),
              ),
              Positioned(
                bottom: height*0.078,
                  left: width*0.507,
                  child: LevelCircleWidget(
                levelNumber: 1,
              )),
              Positioned(
                  bottom: height*0.169,
                  left: width*0.305,
                  child: LevelCircleWidget(
                    levelNumber: 2,
                  )),
              Positioned(
                  bottom: height*0.244,
                  left: width*0.546,
                  child: LevelCircleWidget(
                    levelNumber: 3,
                  )),
              Positioned(
                  bottom: height*0.351,
                  left: width*0.38,
                  child: LevelCircleWidget(
                    levelNumber: 4,
                  )),
              Positioned(
                  bottom: height*0.494,
                  left: width*0.42,
                  child: LevelCircleWidget(
                    levelNumber: 5,
                  )),
              Positioned(
                  bottom: height*0.617,
                  left: width*0.415,
                  child: LevelCircleWidget(
                    levelNumber: 6,
                  )),
              Positioned(
                  bottom: height*0.751,
                  left: width*0.465,
                  child: LevelCircleWidget(
                    levelNumber: 7,
                  )),
              Positioned(
                  bottom: height*0.86,
                  left: width*0.3,
                  child: LevelCircleWidget(
                    levelNumber: 8,
                  )),
              Positioned(
                  bottom: height*0.96,
                  left: width*0.469,
                  child: LevelCircleWidget(
                    levelNumber: 9,
                  )),
              Positioned(
                  bottom: height*0.96,
                  left: width*0.469,
                  child: LevelCircleWidget(
                    levelNumber: 9,
                  )),
              Positioned(
                  bottom: height*1.04,
                  left: width*0.34,
                  child: LevelCircleWidget(
                    levelNumber: 10,
                  )),
              Positioned(
                  bottom: height*1.135,
                  left: width*0.468,
                  child: LevelCircleWidget(
                    levelNumber: 11,
                  )),
              Positioned(
                  bottom: height*1.24,
                  left:width*0.32,
                  child: LevelCircleWidget(
                    levelNumber: 12,
                  )),
              Positioned(
                  bottom: height*1.335,
                  left: width*0.469,
                  child: LevelCircleWidget(
                    levelNumber: 13,
                  )),
              Positioned(
                  bottom: height*0.4,
                  left: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              // Positioned(
              //     bottom: height*0.5,
              //     left: width*0.3,
              //     child: Image.asset("assets/images/stone.png", width: 100, height: 100,)),
              // Positioned(
              //     bottom: height*0.3,
              //     left: width*0.1,
              //     child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              Positioned(
                  bottom: height*0.7,
                  right: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),

              Positioned(
                bottom: 0.0,
                child: SizedBox(
                  width: width,
                  height: height * 0.11,
                  child: Image.asset(
                    "assets/images/grass.png",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
