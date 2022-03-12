import 'package:flutter/material.dart';
import 'package:pebbling_chessboard/prison/prison.dart';
import 'package:pebbling_chessboard/widgets/TextWidget.dart';
import 'package:pebbling_chessboard/widgets/background.dart';

class GamePage extends StatefulWidget {
  final int level;
  const GamePage({Key? key, required this.level, }) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var haveClone;
  var size,height,width;
  int moves =0;
  int position = 1;

  @override
  void initState() {
  //   haveClone[56] = 1;
  //   haveClone[57] = 1;
  //   haveClone[48] = 1;
  haveClone = widget.level>10 ? List.generate(120, (index) => 0):List.generate(64, (index) => 0);
  getCloneByLevel(widget.level);
  moves = 20;
  position=1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    
    return Scaffold(
        appBar: AppBar(
          title:  textWidget( "Level ${widget.level}",  Colors.white, Colors.white,
              MediaQuery.of(context).size.width * 0.09, 1, "Sans Francisco"),
          backgroundColor: Colors.black,
          elevation: 0,
          bottomOpacity: 0.0,
          automaticallyImplyLeading: false,
        ),
        // extendBodyBehindAppBar: true,
        body: SizedBox(
          height: height, width: width,
          child: BackgroundWidget(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: widget.level>10 ? height*0.075 : height*0.15,
                  ),
                  SizedBox(
                      width: widget.level > 10 ? 900 :400,
                      height:  widget.level > 10 ? 500 :400,
                    // width: 400,
                    //   height: 400,
                      child: Center(
                        child: Stack(
                          children: [
                            AspectRatio(
                              child: widget.level>10
                                  ?
                              Image.asset(
                                'assets/images/board3.jpeg',
                                fit: BoxFit.fill,
                              )
                                  : Image.asset(
                                "images/orange_board.png",
                                package: 'flutter_chess_board',
                                fit: BoxFit.cover,
                              ),
                              aspectRatio: 1.0,
                            ),
                            Positioned(
                              left: widget.level>10 ?MediaQuery.of(context).size.width*0.39 :0,
                              bottom: 0,
                              child: Prison().getPrison(widget.level),
                            ),
                            AspectRatio(
                              aspectRatio: 1.0,
                                  child: getClone(),
                            ),

                          ],
                        ),
                      )),
                  SizedBox(
                    height: widget.level> 10 ? MediaQuery.of(context).size.height*0.015 : MediaQuery.of(context).size.height*0.2,
                  ),
                  if(widget.level>10)
                    Column(
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            print("position >> $position");
                            setState(() {
                              if(position ==1){
                                position =2;
                              }
                              else{
                                position =1;
                              }
                            });
                          },
                          elevation: 2.0,
                          fillColor: Colors.white,
                          child: position ==1
                              ? Icon(
                            Icons.arrow_right ,
                            size: 50.0,
                          )
                          : Icon(
                            Icons.arrow_left ,
                            size: 50.0,
                          ),
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        )
                      ],
                    ),
                  Container(
                    height: MediaQuery.of(context).size.width*0.2,
                    width: MediaQuery.of(context).size.width*0.5,
                    // color: Color(0xffC4C4C4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        textWidget( "Moves",  Colors.black, Colors.black,
                            MediaQuery.of(context).size.width * 0.09, 1, "Sans Francisco"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.sync_alt,
                                size: MediaQuery.of(context).size.width*0.08,
                                color:  Colors.black
                            ),
                            textWidget( moves.toString(),  Colors.black, Colors.black,
                                MediaQuery.of(context).size.width * 0.09, 1, "Sans Francisco"),
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget getClone() {
    // print("getclone called");
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Container(
        // decoration: BoxDecoration(
        //   border: Border.all(color:Colors.white)
        // ),
        child: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.level>10 ? 15: 8,childAspectRatio: widget.level>10 ?  0.535 : 1),
          // padding: EdgeInsets.only(bottom: 0.1),
          itemBuilder: (context, index) {
              return Container(
                // height: 0,
                // width: 0,
                // color: index%2==0 ? Color(0xffFA5D04) : Color(0xffFFD37D),
                // decoration: BoxDecoration(
                //   border:Border.all(color: Colors.black)
                // ),
                  child: haveClone[index] == 1
                    ? getCloneWithCircularAvatar(index)
                      : null,
              );
          },
          itemCount: widget.level>10 ?120: 64,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
  Widget getCloneWithCircularAvatar(int index){
    print("getCloneWithCircularAvatar calling");
    print(haveClone);
    return Padding(
      padding: EdgeInsets.all(widget.level>10 ? 2.0 : 7.0),
      child: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.red[800],
          ),
          onTap: () {
            if(widget.level<=10){
              print("less than level 10");
              if (haveClone[index -8] == 0 && haveClone[index+1] == 0) {
                setState(() {
                  if((index+1)%8 != 0 && checkWinOrNot(widget.level) == false){
                    moves--;
                    // print("Current index : ${index}");
                    // print("upward index : ${index - 8} ");
                    // print("right index : ${index + 1}");
                    haveClone[index] = 0;
                    haveClone[index - 8] = 1;
                    haveClone[index + 1] = 1;
                    // checkWinOrNot(widget.level);
                    // print( checkWinOrNot(widget.level));
                  }
                });
              }
            }
            else{
              print("greater than 10");
              if(position ==1){
                print("position $position");
                if (haveClone[index -15] == 0 && haveClone[index+1] == 0) {
                  print("setting value");
                  setState(() {
                    print("setState called");
                    if((index+1)%15 != 0 ){
                      print("value set");
                      moves--;
                      print("Current index : ${index}");
                      print("upward index : ${index - 8} ");
                      print("right index : ${index + 1}");
                      haveClone[index] = 0;
                      haveClone[index - 15] = 1;
                      haveClone[index + 1] = 1;
                      // checkWinOrNot(widget.level);
                      // print( checkWinOrNot(widget.level));
                    }
                  });
                }
              }
              else{
                if (haveClone[index -15] == 0 && haveClone[index-1] == 0) {
                  print("setting value");
                  setState(() {
                    print("setState called");
                    if((index+1)%15 != 0 ){
                      print("value set");
                      moves--;
                      // print("Current index : ${index}");
                      // print("upward index : ${index - 8} ");
                      // print("right index : ${index + 1}");
                      haveClone[index] = 0;
                      haveClone[index - 15] = 1;
                      haveClone[index - 1] = 1;
                      // checkWinOrNot(widget.level);
                      // print( checkWinOrNot(widget.level));
                    }
                  });
                }
              }

            }

          }),
    );
  }


  void getOneClone(){
    print("get One Clone called");
    haveClone[56] =1;
  }
  void getTwoCloneHor(){
    haveClone[56] = 1;
    haveClone[57] = 1;
  }
  void getTwoCloneVer(){
    haveClone[56] = 1;
    haveClone[48] = 1;
  }
  void getTwoCloneDia(){
    haveClone[57] = 1;
    haveClone[48] = 1;
  }
  void level11clone(){
    haveClone[111] = 1;
  }
  void getCloneByLevel(int level) {
    switch (level) {
      case 1:
        return getOneClone();
      case 2:
        return getOneClone();
      case 3:
        return getOneClone();
      case 4:
        return getOneClone();
      case 5:
        return getOneClone();
      case 6:
        return getOneClone();
      case 7:
        return getTwoCloneDia();
      case 8:
        return getTwoCloneDia();
      case 9:
        return getTwoCloneHor();
      case 10:
        return getTwoCloneVer();
      case 11:
        return level11clone();
    }
  }

  bool oneCage(){
    // print("oneCage called");
    if(haveClone[56] == 0){
      // print(haveClone[56]);
      return true;
    }
    return false;
  }
  bool twoCageHor(){
    if(haveClone[56] == 0 &&haveClone[57] == 0 ){
      return true;
    }
    return false;
  }
  bool twoCageVer(){
    if(haveClone[56] == 0 &&haveClone[48] == 0 ){
      return true;
    }
    return false;
  }
  bool threeCage(){
    if(haveClone[56] == 0 &&haveClone[48] == 0 &&haveClone[57] == 0 ){
      return true;
    }
    return false;
  }
  bool fourCage(){
    if(haveClone[56] == 0 &&haveClone[48] == 0 &&haveClone[49] == 0 &&haveClone[57] == 0 ){
      return true;
    }
    return false;
  }
  bool fiveCage(){
    if(haveClone[56] == 0 &&haveClone[48] == 0 &&haveClone[42] == 0 &&haveClone[57] == 0 ){
      return true;
    }
    return false;
  }
  bool sixCage(){
    if(haveClone[56] == 0 &&haveClone[48] == 0 &&haveClone[42] == 0 &&haveClone[57] == 0  &&haveClone[58] == 0 ){
      return true;
    }
    return false;
  }
    bool checkWinOrNot(int level){
      switch(level){
        case 1:
          return oneCage();
        case 2:
          return twoCageHor();
        case 3:
          return threeCage();
        case 4:
          return fourCage();
        case 5:
          return fiveCage();
        case 6:
          return sixCage();
        case 7:
          return twoCageHor();
        case 8:
          return twoCageVer();
        case 9:
          return threeCage();
        case 10:
          return fiveCage();
        default:
          return oneCage();
      }
    }
}
