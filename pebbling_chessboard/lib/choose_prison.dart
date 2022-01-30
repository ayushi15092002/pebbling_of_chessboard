import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/ButtonWidget.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';

class ChoosePrisonScreen extends StatefulWidget {
  @override
  State<ChoosePrisonScreen> createState() => ChoosePrisonScreenState();
}

class ChoosePrisonScreenState extends State<ChoosePrisonScreen> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            textWidget("ChoosePrison", Color(0xff8D0404), Color(0xffE1B310),
                width * 0.1, 17, "Rye"),
          ],
        ),
      ),
    );
  }
}
