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
                    height: widget.level>10 ? height*0.005 : height*0.12,
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
                              left: widget.level>10
                                  ? cagePosition(widget.level) ==0
                                    ? MediaQuery.of(context).size.width*0.457
                                    : cagePosition(widget.level) ==1
                                      ? MediaQuery.of(context).size.width*0.39
                                      : cagePosition(widget.level) ==2
                                        ? MediaQuery.of(context).size.width*0.33
                                        :MediaQuery.of(context).size.width*0.26
                                    :0,
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
                      // height: widget.level> 10 ? MediaQuery.of(context).size.height*0.015 : MediaQuery.of(context).size.height*0.2
                    height: widget.level> 10 ? 0 : MediaQuery.of(context).size.height*0.07,
                  ),
                  if(widget.level>10)
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: RawMaterialButton(
                            padding: EdgeInsets.zero,
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
                              size: 30.0,
                            )
                            : Icon(
                              Icons.arrow_left ,
                              size: 30.0,
                            ),
                            // padding: EdgeInsets.all(1.0),
                            shape: const CircleBorder(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.03,
                        )
                      ],
                    ),
                  Container(
                    height: MediaQuery.of(context).size.width*0.2,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
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
                            // MediaQuery.of(context).size.width * 0.08, 1, "Sans Francisco"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                                Icons.sync_alt,
                                // size: MediaQuery.of(context).size.width*0.08,
                                size: MediaQuery.of(context).size.width*0.07,
                                color:  Colors.black
                            ),
                            textWidget( moves.toString(),  Colors.black, Colors.black,
                                // MediaQuery.of(context).size.width * 0.09, 1, "Sans Francisco",
                                MediaQuery.of(context).size.width * 0.08, 1, "Sans Francisco"
                            ),
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
    /// removed padding widget
    return Container(
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
              // print("less than level 10");
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
                    print("checkWinOrNot");
                    print(checkWinOrNot(widget.level));
                    if((index+1)%15 != 0  && checkWinOrNot(widget.level) == false){
                      print("value set");
                      moves--;
                      print("Current index : ${index}");
                      print("upward index : ${index - 8} ");
                      print("right index : ${index + 1}");
                      haveClone[index] = 0;
                      haveClone[index - 15] = 1;
                      haveClone[index + 1] = 1;
                      checkWinOrNot(widget.level);
                      print( checkWinOrNot(widget.level));
                    }
                  });
                }
              }
              else{
                if (haveClone[index -15] == 0 && haveClone[index-1] == 0) {
                  // print("setting value");
                  setState(() {
                    // print("setState called");
                    if((index+1)%15 != 0 && checkWinOrNot(widget.level) == false){
                      // print("value set");
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
          }
          ),
    );
  }

  int cagePosition(int level){
    if(level >= 15 ){
      if(level == 25 || level ==26 || level ==29 || level == 30 || level == 31 || level >= 33){
        if(level == 42 || level == 59 || level == 62 || level>=70){
          if(level ==74 || level == 78 || level == 81 ||level == 88 || level == 94){
            return 2;
          }
          return 3;
        }
        return 2;
      }
      return 1;
    }
    else {
      return 0;
    }
  }
  void getOneClone(){
    // print("get One Clone called");
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
  void getOneCloneG10(){
    haveClone[112] = 1;
  }
  // void level12Clone(){
  //   haveClone[112] = 1;
  //   haveClone[113] = 1;
  // }
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
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71 :
      case 72 :
      case 73 :
      case 74 :
      case 75 :
      case 76 :
      case 77 :
      case 78 :
      case 79 :
      case 80 :
      case 81 :
      case 82 :
      case 83 :
      case 84 :
      case 85 :
      case 86 :
      case 87 :
      case 88 :
      case 89 :
      case 90 :
      case 91:
      case 92 :
      case 93 :
      case 94 :
      case 95 :
      case 96 :
      case 97 :
      case 98 :
      case 99 :
      case 100 :
      case 101 :
      case 102 :
      case 103 :
      case 104 :
      case 105 :
      case 106 :
      case 107 :
      case 108 :
      case 109 :
      case 110 :
      case 111 :
      case 112 :
      case 113 :
      case 114 :
      case 115 :
      case 116 :
      case 117 :
      case 118 :
      case 119 :
      case 120 :
      case 121 :
      case 122 :
      case 123 :
      case 124 :
      case 125 :
      case 126 :
      case 127 :
      case 128 :
      case 129 :
      case 130 :
      case 131 :
      case 132 :
      case 133 :
      case 134 :
      case 135 :
      case 136 :
      case 137 :
      case 138 :
      case 139 :
      case 140 :
      case 141 :
      case 142 :
      case 143 :
      case 144 :
      case 145 :
      case 146 :
      case 147 :
      case 148 :
      case 149 :
      case 150 :
        return getOneCloneG10();
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
  bool level11Cage(){
    if(haveClone[112] == 0 ){
      return true;
    }
    return false;
  }
  bool level12Cage(){
    if(haveClone[112] == 0 && haveClone[113] == 0){
      return true;
    }
    return false;
  }
  bool level13Cage(){
    if(haveClone[112] == 0 && haveClone[97] == 0){
      return true;
    }
    return false;
  }
  bool level14Cage(){
    if(haveClone[97] == 0 && haveClone[112] == 0 && haveClone[113] == 0){
      return true;
    }
    return false;
  }
  bool level15Cage(){
    print(haveClone[111]);
    print(haveClone[112]);
    print(haveClone[113]);
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0){
      return true;
    }
    return false;
  }
  bool level16Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[97] == 0){
      return true;
    }
    return false;
  }
  bool level17Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0){
      return true;
    }
    return false;
  }
  bool level18Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level19Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[97] == 0 && haveClone[96] == 0){
      return true;
    }
    return false;
  }
  bool level20Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[98] == 0){
      return true;
    }
    return false;
  }
  bool level21Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level22Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[96] == 0){
      return true;
    }
    return false;
  }
  bool level23Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0){
      return true;
    }
    return false;
  }
  bool level24Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level25Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0  && haveClone[113] == 0 && haveClone[97] == 0 && haveClone[98] == 0){
      return true;
    }
    return false;
  }
  bool level26Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0  && haveClone[113] == 0 && haveClone[114] == 0 && haveClone[97] == 0){
      return true;
    }
    return false;
  }
  bool level27Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level28Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level29Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0  && haveClone[113] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0){
      return true;
    }
    return false;
  }
  bool level30Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0  && haveClone[113] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level31Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0  && haveClone[113] == 0 && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level32Cage(){
    if(haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level33Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level34Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0){
      return true;
    }
    return false;
  }
  bool level35Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level36Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level37Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[99] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level38Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level39Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  /// 2- 1/8

  bool level40Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 ){
      return true;
    }
    return false;
  }
  bool level41Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level42Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level43Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level44Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level45Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level46Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level47Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level48Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[81] == 0){
      return true;
    }
    return false;
  }
  bool level49Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level50Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }

  /// 3 - 1/8
  bool level51Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0 ){
      return true;
    }
    return false;
  }
  bool level52Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0 ){
      return true;
    }
    return false;
  }
  bool level53Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level54Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[81] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level55Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[95] == 0&& haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level56Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level57Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level58Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level59Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level60Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level61Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level62Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level63Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level64Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level65Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level66Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level67Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level68Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level69Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0  && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }

  /// 4- 1/8
  bool level70Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level71Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level72Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level73Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level74Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level75Cage(){
    if(haveClone[109] == 0 &&haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[81] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level76Cage(){
    if(haveClone[109] == 0 &&haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[67] == 0 ){
      return true;
    }
    return false;
  }
  bool level77Cage(){
    if(haveClone[109] == 0 &&haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0 ){
      return true;
    }
    return false;
  }
  bool level78Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0 ){
      return true;
    }
    return false;
  }
  bool level79Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0 ){
      return true;
    }
    return false;
  }
  bool level80Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0&& haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 ){
      return true;
    }
    return false;
  }
  bool level81Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0 &&  haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0&& haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 ){
      return true;
    }
    return false;
  }
  bool level82Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 &&  haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0 ){
      return true;
    }
    return false;
  }
  bool level83Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 &&  haveClone[95] == 0 &&  haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0){
      return true;
    }
    return false;
  }
  bool level84Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 &&  haveClone[95] == 0 &&  haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level85Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 &&  haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level86Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 &&  haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level87Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level88Cage(){
    if(haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }

  ///5-1/8
  bool level89Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level90Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level91Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[81] == 0 && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level92Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[95] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level93Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level94Cage(){
    if( haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0  && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level95Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[67] == 0){
      return true;
    }
    return false;
  }
  bool level96Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0){
      return true;
    }
    return false;
  }
  bool level97Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[82] == 0 && haveClone[83] == 0  && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }
  bool level98Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0 && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0  && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }
  bool level99Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[81] == 0  && haveClone[82] == 0  ){
      return true;
    }
    return false;
  }
  bool level100Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[115] == 0  && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[82] == 0  && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }

  ///6 - 1/8

  bool level101Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0  && haveClone[99] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }
  bool level102Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0 && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }
  bool level103Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[67] == 0  ){
      return true;
    }
    return false;
  }
  bool level104Cage(){
    if(haveClone[109] == 0 && haveClone[110] == 0 && haveClone[111] == 0 && haveClone[112] == 0 && haveClone[113] == 0  && haveClone[114] == 0  && haveClone[115] == 0 && haveClone[95] == 0  && haveClone[96] == 0 && haveClone[97] == 0 && haveClone[98] == 0 && haveClone[99] == 0 && haveClone[81] == 0  && haveClone[82] == 0 && haveClone[83] == 0  ){
      return true;
    }
    return false;
  }

///---------------------------------ONE PEBBLE ENDED-------------------------------------------------------------------------------




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
        case 11:
          return level11Cage();
        case 12:
          return level12Cage();
        case 13:
          return level13Cage();
        case 14:
          return level14Cage();
        case 15:
          return level15Cage();
        case 16:
          return level16Cage();
        case 17:
          return level17Cage();
        case 18:
          return level18Cage();
        case 19:
          return level19Cage();
        case 20:
          return level20Cage();
        case 21:
          return level21Cage();
        case 22:
          return level22Cage();
        case 23:
          return level23Cage();
        case 24:
          return level24Cage();
        case 25:
          return level25Cage();
        case 26:
          return level26Cage();
        case 27:
          return level27Cage();
        case 28:
          return level28Cage();
        case 29:
          return level29Cage();
        case 30:
          return level30Cage();
        case 31:
          return level31Cage();
        case 32:
          return level32Cage();
        case 33:
          return level33Cage();
        case 34:
          return level34Cage();
        case 35:
          return level35Cage();
        case 36:
          return level36Cage();
        case 37:
          return level37Cage();
        case 38:
          return level38Cage();
        case 39:
          return level39Cage();
        case 40:
          return level40Cage();
        case 41:
          return level41Cage();
        case 42:
          return level42Cage();
        case 43:
          return level43Cage();
        case 44:
          return level44Cage();
        case 45:
          return level45Cage();
        case 46:
          return level46Cage();
        case 47:
          return level47Cage();
        case 48:
          return level48Cage();
        case 49:
          return level49Cage();
        case 50:
          return level50Cage();
        case 51:
          return level51Cage();
        case 52:
          return level52Cage();
        case 53:
          return level53Cage();
        case 54:
          return level54Cage();
        case 55:
          return level55Cage();
        case 56:
          return level56Cage();
        case 57:
          return level57Cage();
        case 58:
          return level58Cage();
        case 59:
          return level59Cage();
        case 60:
          return level60Cage();
        case 61:
          return level61Cage();
        case 62:
          return level62Cage();
        case 63:
          return level63Cage();
        case 64:
          return level64Cage();
        case 65:
          return level65Cage();
        case 66:
          return level66Cage();
        case 67:
          return level67Cage();
        case 68:
          return level68Cage();
        case 69:
          return level69Cage();
        case 70:
          return level70Cage();
        case 71:
          return level71Cage();
        case 72:
          return level72Cage();
        case 73:
          return level73Cage();
        case 74:
          return level74Cage();
        case 75:
          return level75Cage();
        case 76:
          return level76Cage();
        case 77:
          return level77Cage();
        case 78:
          return level78Cage();
        case 79:
          return level79Cage();
        case 80:
          return level80Cage();
        case 81:
          return level81Cage();
        case 82:
          return level82Cage();
        case 83:
          return level83Cage();
        case 84:
          return level84Cage();
        case 85:
          return level85Cage();
        case 86:
          return level86Cage();
        case 87:
          return level87Cage();
        case 88:
          return level88Cage();
        case 89:
          return level89Cage();
        case 90:
          return level90Cage();
        case 91:
          return level91Cage();
        case 92:
          return level92Cage();
        case 93:
          return level93Cage();
        case 94:
          return level94Cage();
        case 95:
          return level95Cage();
        case 96:
          return level96Cage();
        case 97:
          return level97Cage();
        case 98:
          return level98Cage();
        case 99:
          return level99Cage();
        case 100:
          return level100Cage();
        case 101:
          return level101Cage();
        case 102:
          return level102Cage();
        case 103:
          return level103Cage();
        case 104:
          return level104Cage();
        default:
          return oneCage();
      }
    }
}
