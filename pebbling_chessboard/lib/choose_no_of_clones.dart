
import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';

class NoOfClonesScreen extends StatefulWidget{
  final int prisonSize;
  const NoOfClonesScreen({Key? key, required this.prisonSize}) : super(key: key);
  @override
  State<NoOfClonesScreen> createState() => _NoOfClonesScreenState();

}

class _NoOfClonesScreenState extends State<NoOfClonesScreen>{
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: BackgroundWidget(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            textWidget("Choose", Color(0xff8D0404), Color(0xffE1B310),
                width * 0.1, 17, "Rye"),
            textWidget("NoOfPebbles", Color(0xff8D0404), Color(0xffE1B310),
                width * 0.1, 17, "Rye"),
            SizedBox(
              height: widget.prisonSize==1? height * 0.2 :widget.prisonSize==3 ? height*0.05: height * 0.12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.prisonSize,
                  itemBuilder: (BuildContext context, index){
                  return Column(
                    children: [
                      GestureDetector(
                        child: Material(
                          borderRadius: BorderRadius.circular(width*0.175),
                          elevation: 15,
                          child: CircleAvatar(
                            radius: width*0.175,
                            backgroundColor: Color(0xffE1B310),
                            child: Text(
                              "${index+1}",
                              style: TextStyle(
                                fontFamily: "Rye",
                                fontSize: width*0.15,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )
                          ),
                        ),
                        onTap: (){

                        },
                      ),
                      SizedBox(
                        height: height*0.02,
                      )
                    ],
                  );
                  }
              ),
            )


          ],
        ),
      ),
    );
  }
}