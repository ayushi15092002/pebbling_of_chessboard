import 'dart:async';
import 'package:flutter/material.dart';
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
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                    Image.asset("assets/images/path2_new.png"),
                  ],
                ),
              ),
              Positioned(
                bottom: 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                levelNumber: 1,
              )),
              Positioned(
                  bottom: 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 2,
                  )),
              Positioned(
                  bottom: 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 3,
                  )),
              Positioned(
                  bottom: 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 4,
                  )),
              Positioned(
                  bottom: 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 5,
                  )),
              Positioned(
                  bottom: 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 6,
                  )),
              Positioned(
                  bottom: 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 7,
                  )),
              Positioned(
                  bottom: 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 8,
                  )),

              Positioned(
                  bottom: 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 9,
                  )),
              Positioned(
                  bottom: 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 10,
                  )),
              Positioned(
                  bottom: 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 11,
                  )),
              Positioned(
                  bottom: 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 12,
                  )),
              Positioned(
                  bottom: 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 13,
                  )),
              Positioned(
                  bottom: 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 14,
                  )),
              Positioned(
                  bottom: 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 15,
                  )),

              /// 2nd

              Positioned(
                  bottom: 1340 + 80/*height*1.572*/,
                  left: width*0.51,
                  child: const LevelCircleWidget(
                    levelNumber: 16,
                  )),
              Positioned(
                  bottom: 1340 +150/*height*1.572*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 17,
                  )),

              Positioned(
                  bottom: 1340 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 18,
                  )),
              Positioned(
                  bottom: 1340 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 19,
                  )),
              Positioned(
                  bottom: 1340 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 20,
                  )),
              Positioned(
                  bottom: 1340 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 21,
                  )),
              Positioned(
                  bottom: 1340 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 22,
                  )),
              Positioned(
                  bottom: 1340 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 23,
                  )),

              Positioned(
                  bottom: 1340 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 24,
                  )),
              Positioned(
                  bottom: 1340 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 25,
                  )),
              Positioned(
                  bottom: 1340 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 26,
                  )),
              Positioned(
                  bottom: 1340 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 27,
                  )),
              Positioned(
                  bottom: 1340 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 28,
                  )),
              Positioned(
                  bottom: 1340 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 29,
                  )),
              Positioned(
                  bottom: 1340 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 30,
                  )),

              /// 3rd

              Positioned(
                  bottom: 2670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 31,
                  )),
              Positioned(
                  bottom: 2670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 32,
                  )),
              Positioned(
                  bottom: 2670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 33,
                  )),
              Positioned(
                  bottom: 2670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 34,
                  )),
              Positioned(
                  bottom: 2670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 35,
                  )),
              Positioned(
                  bottom: 2670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 36,
                  )),
              Positioned(
                  bottom: 2670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 37,
                  )),
              Positioned(
                  bottom: 2670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 38,
                  )),

              Positioned(
                  bottom: 2670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 39,
                  )),
              Positioned(
                  bottom: 2670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 40,
                  )),
              Positioned(
                  bottom: 2670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 41,
                  )),
              Positioned(
                  bottom: 2670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 42,
                  )),
              Positioned(
                  bottom: 2670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 43,
                  )),
              Positioned(
                  bottom: 2670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 44,
                  )),
              Positioned(
                  bottom: 2670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 45,
                  )),

              /// 4th

              Positioned(
                  bottom: 4000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 46,
                  )),
              Positioned(
                  bottom: 4000 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 47,
                  )),
              Positioned(
                  bottom: 4000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 48,
                  )),
              Positioned(
                  bottom: 4000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 49,
                  )),
              Positioned(
                  bottom: 4000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 50,
                  )),
              Positioned(
                  bottom: 4000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 51,
                  )),
              Positioned(
                  bottom: 4000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 52,
                  )),
              Positioned(
                  bottom: 4000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 53,
                  )),

              Positioned(
                  bottom: 4000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 54,
                  )),
              Positioned(
                  bottom: 4000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 55,
                  )),
              Positioned(
                  bottom: 4000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 56,
                  )),
              Positioned(
                  bottom: 4000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 57,
                  )),
              Positioned(
                  bottom: 4000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 58,
                  )),
              Positioned(
                  bottom: 4000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 59,
                  )),
              Positioned(
                  bottom: 4000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 60,
                  )),


              /// 5th


              Positioned(
                  bottom: 5330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 61,
                  )),
              Positioned(
                  bottom: 5330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 62,
                  )),
              Positioned(
                  bottom: 5330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 63,
                  )),
              Positioned(
                  bottom: 5330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 64,
                  )),
              Positioned(
                  bottom: 5330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 65,
                  )),
              Positioned(
                  bottom: 5330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 66,
                  )),
              Positioned(
                  bottom: 5330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 67,
                  )),
              Positioned(
                  bottom: 5330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 68,
                  )),

              Positioned(
                  bottom: 5330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 69,
                  )),
              Positioned(
                  bottom: 5330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 70,
                  )),
              Positioned(
                  bottom: 5330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 71,
                  )),
              Positioned(
                  bottom: 5330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 72,
                  )),
              Positioned(
                  bottom: 5330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 73,
                  )),
              Positioned(
                  bottom: 5330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 74,
                  )),
              Positioned(
                  bottom: 5330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 75,
                  )),

              /// 6th


              Positioned(
                  bottom: 6670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 76,
                  )),
              Positioned(
                  bottom: 6670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 77,
                  )),
              Positioned(
                  bottom: 6670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 78,
                  )),
              Positioned(
                  bottom: 6670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 79,
                  )),
              Positioned(
                  bottom: 6670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 80,
                  )),
              Positioned(
                  bottom: 6670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 81,
                  )),
              Positioned(
                  bottom: 6670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 82,
                  )),
              Positioned(
                  bottom: 6670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 83,
                  )),

              Positioned(
                  bottom: 6670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 84,
                  )),
              Positioned(
                  bottom: 6670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 85,
                  )),
              Positioned(
                  bottom: 6670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 86,
                  )),
              Positioned(
                  bottom: 6670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 87,
                  )),
              Positioned(
                  bottom: 6670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 88,
                  )),
              Positioned(
                  bottom: 6670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 89,
                  )),
              Positioned(
                  bottom: 6670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 90,
                  )),

              /// 7th


              Positioned(
                  bottom: 8000 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 91,
                  )),
              Positioned(
                  bottom: 8000 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 92,
                  )),
              Positioned(
                  bottom: 8000 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 93,
                  )),
              Positioned(
                  bottom: 8000 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 94,
                  )),
              Positioned(
                  bottom: 8000 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 95,
                  )),
              Positioned(
                  bottom: 8000 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 96,
                  )),
              Positioned(
                  bottom: 8000 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 97,
                  )),
              Positioned(
                  bottom: 8000 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 98,
                  )),

              Positioned(
                  bottom: 8000 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 99,
                  )),
              Positioned(
                  bottom: 8000 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 100,
                  )),
              Positioned(
                  bottom: 8000 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 101,
                  )),
              Positioned(
                  bottom: 8000 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 102,
                  )),
              Positioned(
                  bottom: 8000 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 103,
                  )),
              Positioned(
                  bottom: 8000 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 104,
                  )),
              Positioned(
                  bottom: 8000 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 105,
                  )),

              /// 8th


              Positioned(
                  bottom: 9330 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 106,
                  )),
              Positioned(
                  bottom: 9330 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 107,
                  )),
              Positioned(
                  bottom: 9330 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 108,
                  )),
              Positioned(
                  bottom: 9330 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 109,
                  )),
              Positioned(
                  bottom: 9330 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 110,
                  )),
              Positioned(
                  bottom: 9330 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 111,
                  )),
              Positioned(
                  bottom: 9330 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 112,
                  )),
              Positioned(
                  bottom: 9330 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 113,
                  )),

              Positioned(
                  bottom: 9330 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 114,
                  )),
              Positioned(
                  bottom: 9330 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 115,
                  )),
              Positioned(
                  bottom: 9330 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 116,
                  )),
              Positioned(
                  bottom: 9330 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 117,
                  )),
              Positioned(
                  bottom: 9330 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 118,
                  )),
              Positioned(
                  bottom: 9330 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 119,
                  )),
              Positioned(
                  bottom: 9330 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 120,
                  )),

              /// 9th


              Positioned(
                  bottom: 10670 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 121,
                  )),
              Positioned(
                  bottom: 10670 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 122,
                  )),
              Positioned(
                  bottom: 10670 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 123,
                  )),
              Positioned(
                  bottom: 10670 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 124,
                  )),
              Positioned(
                  bottom: 10670 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 125,
                  )),
              Positioned(
                  bottom: 10670 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 126,
                  )),
              Positioned(
                  bottom: 10670 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 127,
                  )),
              Positioned(
                  bottom: 10670 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 128,
                  )),

              Positioned(
                  bottom: 10670 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 129,
                  )),
              Positioned(
                  bottom: 10670 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 130,
                  )),
              Positioned(
                  bottom: 10670 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 131,
                  )),
              Positioned(
                  bottom: 10670 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 132,
                  )),
              Positioned(
                  bottom: 10670 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 133,
                  )),
              Positioned(
                  bottom: 10670 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 134,
                  )),
              Positioned(
                  bottom: 10670 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 135,
                  )),

              /// 10th


              Positioned(
                  bottom: 12010 + 80 /*height*0.085*/,
                  left: width*0.51/*width*0.507*/,
                  child: const LevelCircleWidget(
                    levelNumber: 136,
                  )),
              Positioned(
                  bottom: 12010 + 150/*height*0.175*/,
                  left: width*0.3/*width*0.305*/,
                  child: const LevelCircleWidget(
                    levelNumber: 137,
                  )),
              Positioned(
                  bottom: 12010 + 225/*height*0.252*/,
                  left: width*0.546,
                  child: const LevelCircleWidget(
                    levelNumber: 138,
                  )),
              Positioned(
                  bottom: 12010 + 280/*height*0.36*/,
                  left: width*0.3/*0.38*/,
                  child: const LevelCircleWidget(
                    levelNumber: 139,
                  )),
              Positioned(
                  bottom: 12010 + 350/*height*0.5*/,
                  left: width*0.5,
                  child: const LevelCircleWidget(
                    levelNumber: 140,
                  )),
              Positioned(
                  bottom: 12010 + 420/*height*0.625*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 141,
                  )),
              Positioned(
                  bottom: 12010 + 510/*height*0.76*/,
                  left: width*0.49,
                  child: const LevelCircleWidget(
                    levelNumber: 142,
                  )),
              Positioned(
                  bottom: 12010 + 600/*height*0.87*/,
                  left: width*0.3,
                  child: const LevelCircleWidget(
                    levelNumber: 143,
                  )),

              Positioned(
                  bottom: 12010 + 680/*height*0.97*/,
                  left: width*0.47,
                  child: const LevelCircleWidget(
                    levelNumber: 144,
                  )),
              Positioned(
                  bottom: 12010 + 750/*height*1.05*/,
                  left: width*0.27,
                  child: const LevelCircleWidget(
                    levelNumber: 145,
                  )),
              Positioned(
                  bottom: 12010 + 850/*height*1.145*/,
                  left: width*0.468,
                  child: const LevelCircleWidget(
                    levelNumber: 146,
                  )),
              Positioned(
                  bottom: 12010 + 950/*height*1.25*/,
                  left:width*0.32,
                  child: const LevelCircleWidget(
                    levelNumber: 147,
                  )),
              Positioned(
                  bottom: 12010 + 1080/*height*1.4*/,
                  left: width*0.25/*width*0.4*/,
                  child: const LevelCircleWidget(
                    levelNumber: 148,
                  )),
              Positioned(
                  bottom: 12010 + 1150/*height*1.505*/,
                  left: width*0.5/*width*0.3*/,
                  child: const LevelCircleWidget(
                    levelNumber: 149,
                  )),
              Positioned(
                  bottom: 12010 + 1260/*height*1.572*/,
                  left: width*0.46,
                  child: const LevelCircleWidget(
                    levelNumber: 150,
                  )),


              /// grasses

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
                  bottom: height*5.98,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //72
              Positioned(
                  bottom: 6300,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //60
              Positioned(
                  bottom: 5260,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //51
              Positioned(
                  bottom: 5000,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //45
              Positioned(
                  bottom: 3900,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //42
              Positioned(
                  bottom: 3550,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),
              //38
              Positioned(
                  bottom: 3250,
                  left: width*0.5,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //30
              Positioned(
                  bottom: 2600,
                  right: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),
              //27
              Positioned(
                  bottom: 2350,
                  left: width*0.47,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),

              //15
              Positioned(
                  bottom: 1260,
                  right: width*0.48,
                  child: Image.asset("assets/images/stone.png", width: 250, height: 250,)),

              //12
              Positioned(
                  bottom: 1010,
                  left: width*0.48,
                  child: Image.asset("assets/images/stone.png", width: 150, height: 150,)),


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
