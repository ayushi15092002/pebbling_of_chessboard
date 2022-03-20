import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/level_circle.dart';

int t = 0;
class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => SelectLevelScreenState();
}

class SelectLevelScreenState extends State<SelectLevelScreen> {
  var size, height, width;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    Timer(
        const Duration(milliseconds: 1),
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child:
        // Column(
        //   children: [
        //     SizedBox(
        //       height: height*0.1,
        //     ),
        //     textWidget( "Select Level",  Colors.black, const Color(0xffFFA51E),
        //         MediaQuery.of(context).size.width * 0.09, 17, "Rye"),
        //     SizedBox(
        //       height: height*0.2,
        //     ),
        //     Row(
        //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         SizedBox(
        //           // width: width*0.01,
        //         ),
        //         IconButton(
        //             onPressed: (){
        //
        //             },
        //             icon: Icon(Icons.arrow_left, color: Color(0xffFFA51E),size: 75,)
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //         Container(
        //           height: height*0.5,
        //           width: width*0.7,
        //           color: Color(0xffFFA51E),
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //         IconButton(
        //             onPressed: (){
        //
        //             },
        //             icon: Icon(Icons.arrow_right, color: Color(0xffFFA51E),size: 75,)
        //         ),
        //         SizedBox(
        //           width: width*0.01,
        //         ),
        //       ],
        //     )
        //   ],
        // ),
        SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    // Image.asset("assets/images/path2.png"),
                    Image.asset("assets/images/path1_new.png"),
                    Image.asset("assets/images/path1_new.png"),
                    Image.asset("assets/images/path1_new.png"),
                    Image.asset("assets/images/path1_new.png"),
                    Image.asset("assets/images/path1_new.png"),
                  ],
                ),
              ),
              Positioned(
                bottom: height*0.085,
                  left: width*0.507,
                  child: const LevelCircleWidget(
                levelNumber: 1,
              )),
              Positioned(
                  bottom: height*0.175,
                  left: width*0.305,
                  child: const LevelCircleWidget(
                    levelNumber: 2,
                  )),
              Positioned(
                  bottom: height*0.252,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 3,
                  )),
              Positioned(
                  bottom: height*0.36,
                  left: width*0.38,
                  child: const LevelCircleWidget(
                    levelNumber: 4,
                  )),
              Positioned(
                  bottom: height*0.5,
                  left: width*0.42,
                  child: const LevelCircleWidget(
                    levelNumber: 5,
                  )),
              Positioned(
                  bottom: height*0.625,
                  left: width*0.415,
                  child: const LevelCircleWidget(
                    levelNumber: 6,
                  )),
              Positioned(
                  bottom: height*0.76,
                  left: width*0.465,
                  child: const LevelCircleWidget(
                    levelNumber: 7,
                  )),
              Positioned(
                  bottom: height*0.87,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 8,
                  )),

              Positioned(
                  bottom: height*0.97,
                  left: width*0.469,
                  child: const LevelCircleWidget(
                    levelNumber: 9,
                  )),
              Positioned(
                  bottom: height*1.05,
                  left: width*0.34,
                  child: const LevelCircleWidget(
                    levelNumber: 10,
                  )),
              Positioned(
                  bottom: height*1.145,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 11,
                  )),
              Positioned(
                  bottom: height*1.25,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 12,
                  )),
              // Positioned(
              //     bottom: height*1.335,
              //     left: width*0.469,
              //     child: const LevelCircleWidget(
              //       levelNumber: 13,
              //     )),
              Positioned(
                  bottom: height*1.4,
                  left: width*0.4,
                  child: const LevelCircleWidget(
                    levelNumber: 13,
                  )),
              Positioned(
                  bottom: height*1.505,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 14,
                  )),
              Positioned(
                  bottom: height*1.572,
                  left: width*0.507,
                  child: const LevelCircleWidget(
                    levelNumber: 15,
                  )),
              Positioned(
                  bottom: height*1.663,
                  left: width*0.305,
                  child: const LevelCircleWidget(
                    levelNumber: 16,
                  )),
              Positioned(
                  bottom: height*1.738,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 17,
                  )),
              Positioned(
                  bottom: height*1.847,
                  left: width*0.38,
                  child: const LevelCircleWidget(
                    levelNumber: 18,
                  )),
              Positioned(
                  bottom: height*1.99,
                  left: width*0.42,
                  child: const LevelCircleWidget(
                    levelNumber: 19,
                  )),
              Positioned(
                  bottom: height*2.1138,
                  left: width*0.415,
                  child: const LevelCircleWidget(
                    levelNumber: 20,
                  )),
              Positioned(
                  bottom: height*2.247,
                  left: width*0.465,
                  child: const LevelCircleWidget(
                    levelNumber: 21,
                  )),
              Positioned(
                  bottom: height*2.356,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 22,
                  )),

              Positioned(
                  bottom: height*2.457,
                  left: width*0.469,
                  child: const LevelCircleWidget(
                    levelNumber: 23,
                  )),
              Positioned(
                  bottom: height*2.537,
                  left: width*0.34,
                  child: const LevelCircleWidget(
                    levelNumber: 24,
                  )),
              Positioned(
                  bottom: height*2.633,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 25,
                  )),
              Positioned(
                  bottom: height*2.737,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 26,
                  )),
              Positioned(
                  bottom: height*2.88,
                  left: width*0.4,
                  child: const LevelCircleWidget(
                    levelNumber: 27,
                  )),
              Positioned(
                  bottom: height*(0.085+2.975),
                  left: width*0.507,
                  child: const LevelCircleWidget(
                    levelNumber: 28,
                  )),
              Positioned(
                  bottom: height*(0.175+2.975),
                  left: width*0.305,
                  child: const LevelCircleWidget(
                    levelNumber: 29,
                  )),
              Positioned(
                  bottom: height*(0.252+2.975),
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 30,
                  )),
              Positioned(
                  bottom: height*(0.36+2.975),
                  left: width*0.38,
                  child: const LevelCircleWidget(
                    levelNumber: 31,
                  )),
              Positioned(
                  bottom: height*(0.5+2.975),
                  left: width*0.42,
                  child: const LevelCircleWidget(
                    levelNumber: 32,
                  )),
              Positioned(
                  bottom: height*(0.625+2.975),
                  left: width*0.415,
                  child: const LevelCircleWidget(
                    levelNumber: 33,
                  )),
              Positioned(
                  bottom: height*(0.76+2.975),
                  left: width*0.465,
                  child: const LevelCircleWidget(
                    levelNumber: 34,
                  )),
              Positioned(
                  bottom: height*(0.87+2.975),
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 35,
                  )),

              Positioned(
                  bottom: height*(0.97+2.975),
                  left: width*0.469,
                  child: const LevelCircleWidget(
                    levelNumber: 36,
                  )),
              Positioned(
                  bottom: height*(1.05+2.975),
                  left: width*0.34,
                  child: const LevelCircleWidget(
                    levelNumber: 37,
                  )),
              Positioned(
                  bottom: height*(1.145+2.975),
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 38,
                  )),
              Positioned(
                  bottom: height*(1.25+2.975),
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 39,
                  )),
              Positioned(
                  bottom: height*(1.4+2.975),
                  left: width*0.4,
                  child: const LevelCircleWidget(
                    levelNumber: 40,
                  )),
              Positioned(
                  bottom: height*(1.505+2.975),
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 41,
                  )),
              Positioned(
                  bottom: height*(1.572+2.975),
                  left: width*0.507,
                  child: const LevelCircleWidget(
                    levelNumber: 42,
                  )),
              Positioned(
                  bottom: height*(1.663+2.975),
                  left: width*0.305,
                  child: const LevelCircleWidget(
                    levelNumber: 43,
                  )),
              Positioned(
                  bottom: height*(1.738+2.975),
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 44,
                  )),
              Positioned(
                  bottom: height*(1.847+2.975),
                  left: width*0.38,
                  child: const LevelCircleWidget(
                    levelNumber: 45,
                  )),
              Positioned(
                  bottom: height*(1.99+2.975),
                  left: width*0.42,
                  child: const LevelCircleWidget(
                    levelNumber: 46,
                  )),
              Positioned(
                  bottom: height*(2.1138+2.975),
                  left: width*0.415,
                  child: const LevelCircleWidget(
                    levelNumber: 47,
                  )),
              Positioned(
                  bottom: height*(2.247+2.975),
                  left: width*0.465,
                  child: const LevelCircleWidget(
                    levelNumber: 48,
                  )),
              Positioned(
                  bottom: height*(2.356+2.975),
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 49,
                  )),

              Positioned(
                  bottom: height*(2.457+2.975),
                  left: width*0.469,
                  child: const LevelCircleWidget(
                    levelNumber: 50,
                  )),
              Positioned(
                  bottom: height*(2.537+2.975),
                  left: width*0.34,
                  child: const LevelCircleWidget(
                    levelNumber: 51,
                  )),
              Positioned(
                  bottom: height*(2.633+2.975),
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 52,
                  )),
              Positioned(
                  bottom: height*(2.737+2.975),
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 53,
                  )),
              Positioned(
                  bottom: height*(2.88+2.975),
                  left: width*0.4,
                  child: const LevelCircleWidget(
                    levelNumber: 54,
                  )),
              Positioned(
                  bottom: height*(0.085+5.95),
                  left: width*0.507,
                  child: const LevelCircleWidget(
                    levelNumber: 55,
                  )),
              Positioned(
                  bottom: height*(0.175+5.95),
                  left: width*0.305,
                  child: const LevelCircleWidget(
                    levelNumber: 56,
                  )),
              Positioned(
                  bottom: height*(0.252+5.95),
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 57,
                  )),
              Positioned(
                  bottom: height*(0.36+5.95),
                  left: width*0.38,
                  child: const LevelCircleWidget(
                    levelNumber: 58,
                  )),
              Positioned(
                  bottom: height*(0.5+5.95),
                  left: width*0.42,
                  child: const LevelCircleWidget(
                    levelNumber: 59,
                  )),
              Positioned(
                  bottom: height*(0.625+5.95),
                  left: width*0.415,
                  child: const LevelCircleWidget(
                    levelNumber: 60,
                  )),
              Positioned(
                  bottom: height*(0.76+5.95),
                  left: width*0.465,
                  child: const LevelCircleWidget(
                    levelNumber: 61,
                  )),
              Positioned(
                  bottom: height*(0.87+5.95),
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 62,
                  )),

              Positioned(
                  bottom: height*(0.97+5.95),
                  left: width*0.469,
                  child: const LevelCircleWidget(
                    levelNumber: 63,
                  )),
              Positioned(
                  bottom: height*(1.05+5.95),
                  left: width*0.34,
                  child: const LevelCircleWidget(
                    levelNumber: 64,
                  )),
              Positioned(
                  bottom: height*(1.145+5.95),
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 65,
                  )),
              Positioned(
                  bottom: height*(1.25+5.95),
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 66,
                  )),
              Positioned(
                  bottom: height*(1.4+5.95),
                  left: width*0.4,
                  child: const LevelCircleWidget(
                    levelNumber: 67,
                  )),
              Positioned(
                  bottom: height*(1.505+5.95),
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 68,
                  )),
              Positioned(
                  bottom: height*0.4,
                  left: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*0.7,
                  right: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*1.3,
                  left: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*1.8,
                  left: width*0.6,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*2.83,
                  left: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              Positioned(
                  bottom: height*2.95,
                  right: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*4.3,
                  left: width*0.49,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*5.75,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              Positioned(
                  bottom: height*5.98,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              Positioned(
                  bottom: height*7.25,
                  left: width*0.47,
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
