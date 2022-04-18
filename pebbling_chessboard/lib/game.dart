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
              // print("greater than 10");
              if(position ==1){
                print("position $position");
                if (haveClone[index -15] == 0 && haveClone[index+1] == 0) {
                  // print("setting value");
                  setState(() {
                    // print("setState called");
                    // print("checkWinOrNot");
                    print(checkWinOrNot(widget.level));
                    if((index+1)%15 != 0  && checkWinOrNot(widget.level) == false){
                      // print("value set");
                      moves--;
                      ("right index : ${index + 1}");
                      // haveCprint("Current index : ${index}");
                      // print("upward index : ${index - 8} ");
                      // printlone[index] = 0;
                      haveClone[index - 15] = 1;
                      haveClone[index + 1] = 1;
                      checkWinOrNot(widget.level);
                      // print( checkWinOrNot(widget.level));
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
    if(level<15){
      return 0;
    }
    else if(level>=15 && level <= 104) {
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
    else if(level>=105 && level<107){
      return 0;
    }
    else if(level>=107 && level <= 196){
      if(level == 117 || level ==118 || level ==121 || level == 122 || level == 123 || level >= 125){
        if(level == 134 || level == 151 || level == 154 || level>=162){
          if(level ==166 || level == 170 || level == 173 ||level == 180 || level == 186){
            return 2;
          }
          return 3;
        }
        return 2;
      }
      return 1;
    }
    else if(level>=197 && level<199){
      return 0;
    }
    else if(level>=199 && level <= 288){
      if(level == 209 || level ==210 || level ==213 || level == 214 || level == 215 || level >= 217){
        if(level == 226 || level == 243 || level == 246 || level>=254){
          if(level ==258 || level == 262 || level == 265 ||level == 272 || level == 278){
            return 2;
          }
          return 3;
        }
        return 2;
      }
      return 1;
    }
    else if(level>=289 && level <= 324) {
      if(level == 298 || level ==299 || level ==302 || level == 303 || level == 304 || level >= 306){
        if(level == 315){
          return 3;
        }
        return 2;
      }
      return 1;
    }
    else if(level>=325 && level <= 360) {
      if(level == 334 || level ==335 || level ==338 || level == 339 || level == 340 || level >= 342){
        if(level == 351){
          return 3;
        }
        return 2;
      }
      return 1;
    }
    else if(level>=361 && level <= 379) {
      if(level == 370 || level ==371 || level == 374 || level == 375 || level == 376 || level >= 378){
        return 2;
      }
      return 1;
    }
    else if(level>=380 && level<=382){
      return 1;
    }
    else{
      return 0;
    }
    return 0;
    // if(level >= 15 ){
    //   if(level == 25 || level ==26 || level ==29 || level == 30 || level == 31 || level >= 33){
    //     if(level == 42 || level == 59 || level == 62 || level>=70){
    //       if(level ==74 || level == 78 || level == 81 ||level == 88 || level == 94){
    //         return 2;
    //       }
    //       else if(level>104){
    //         if(level ==105 || level ==106){
    //           return 0;
    //         }
    //         return 1;
    //       }
    //       return 3;
    //     }
    //     return 2;
    //   }
    //   return 1;
    // }
    // else {
    //   return 0;
    // }
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
  void getTwoCloneSideG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
  }
  void getTwoCloneAboveG10(){
    haveClone[112] = 1;
    haveClone[97] = 1;
  }
  void getThreeCloneAboveG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[97] = 1;
  }
  void getThreeCloneSideG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[111] = 1;
  }
  void getFourCloneG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[111] = 1;
    haveClone[97] = 1;
  }
  void getFive17CloneG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[111] = 1;
    haveClone[97] = 1;
    haveClone[114] = 1;

  }
  void getFive18CloneG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[111] = 1;
    haveClone[97] = 1;
    haveClone[82] = 1;

  }
  void getFive19CloneG10(){
    haveClone[112] = 1;
    haveClone[113] = 1;
    haveClone[111] = 1;
    haveClone[97] = 1;
    haveClone[96] = 1;

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
        return getOneCloneG10();
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165 :
      case 166 :
      case 167 :
      case 168 :
      case 169 :
      case 170 :
      case 171 :
      case 172 :
      case 173 :
      case 174 :
      case 175 :
      case 176 :
      case 177 :
      case 178 :
      case 179 :
      case 180 :
      case 181 :
      case 182 :
      case 183 :
      case 184 :
      case 185:
      case 186 :
      case 187 :
      case 188 :
      case 189 :
      case 190 :
      case 191 :
      case 192 :
      case 193 :
      case 194 :
      case 195 :
      case 196 :
        return getTwoCloneSideG10();
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 256:
      case 257 :
      case 258 :
      case 259 :
      case 260 :
      case 261 :
      case 262 :
      case 263 :
      case 264 :
      case 265 :
      case 266 :
      case 267 :
      case 268 :
      case 269 :
      case 270 :
      case 271 :
      case 272 :
      case 273 :
      case 274 :
      case 275 :
      case 276 :
      case 277:
      case 278 :
      case 279 :
      case 280 :
      case 281 :
      case 282 :
      case 283 :
      case 284 :
      case 285 :
      case 286 :
      case 287 :
      case 288 :
        return getTwoCloneSideG10();
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 301:
      case 302:
      case 303:
      case 304:
      case 305:
      case 306:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
        return getThreeCloneAboveG10();
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
        return getThreeCloneSideG10();
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
        return getFourCloneG10();
      case 380:
        return getFive17CloneG10();
      case 381:
        return getFive18CloneG10();
      case 382:
        return getFive19CloneG10();

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
    // print(haveClone[111]);
    // print(haveClone[112]);
    // print(haveClone[113]);
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
        case 105:
          return level12Cage();
        case 106:
          return level14Cage();
        case 107:
          return level15Cage();
        case 108:
          return level16Cage();
        case 109:
          return level17Cage();
        case 110:
          return level18Cage();
        case 111:
          return level19Cage();
        case 112:
          return level20Cage();
        case 113:
          return level21Cage();
        case 114:
          return level22Cage();
        case 115:
          return level23Cage();
        case 116:
          return level24Cage();
        case 117:
          return level25Cage();
        case 118:
          return level26Cage();
        case 119:
          return level27Cage();
        case 120:
          return level28Cage();
        case 121:
          return level29Cage();
        case 122:
          return level30Cage();
        case 123:
          return level31Cage();
        case 124:
          return level32Cage();
        case 125:
          return level33Cage();
        case 126:
          return level34Cage();
        case 127:
          return level35Cage();
        case 128:
          return level36Cage();
        case 129:
          return level37Cage();
        case 130:
          return level38Cage();
        case 131:
          return level39Cage();
        case 132:
          return level40Cage();
        case 133:
          return level41Cage();
        case 134:
          return level42Cage();
        case 135:
          return level43Cage();
        case 136:
          return level44Cage();
        case 137:
          return level45Cage();
        case 138:
          return level46Cage();
        case 139:
          return level47Cage();
        case 140:
          return level48Cage();
        case 141:
          return level49Cage();
        case 142:
          return level50Cage();
        case 143:
          return level51Cage();
        case 144:
          return level52Cage();
        case 145:
          return level53Cage();
        case 146:
          return level54Cage();
        case 147:
          return level55Cage();
        case 148:
          return level56Cage();
        case 149:
          return level57Cage();
        case 150:
          return level58Cage();
        case 151:
          return level59Cage();
        case 152:
          return level60Cage();
        case 153:
          return level61Cage();
        case 154:
          return level62Cage();
        case 155:
          return level63Cage();
        case 156:
          return level64Cage();
        case 157:
          return level65Cage();
        case 158:
          return level66Cage();
        case 159:
          return level67Cage();
        case 160:
          return level68Cage();
        case 161:
          return level69Cage();
        case 162:
          return level70Cage();
        case 163:
          return level71Cage();
        case 164:
          return level72Cage();
        case 165:
          return level73Cage();
        case 166:
          return level74Cage();
        case 167:
          return level75Cage();
        case 168:
          return level76Cage();
        case 169:
          return level77Cage();
        case 170:
          return level78Cage();
        case 171:
          return level79Cage();
        case 172:
          return level80Cage();
        case 173:
          return level81Cage();
        case 174:
          return level82Cage();
        case 175:
          return level83Cage();
        case 176:
          return level84Cage();
        case 177:
          return level85Cage();
        case 178:
          return level86Cage();
        case 179:
          return level87Cage();
        case 180:
          return level88Cage();
        case 181:
          return level89Cage();
        case 182:
          return level90Cage();
        case 183:
          return level91Cage();
        case 184:
          return level92Cage();
        case 185:
          return level93Cage();
        case 186:
          return level94Cage();
        case 187:
          return level95Cage();
        case 188:
          return level96Cage();
        case 189:
          return level97Cage();
        case 190:
          return level98Cage();
        case 191:
          return level99Cage();
        case 192:
          return level100Cage();
        case 193:
          return level101Cage();
        case 194:
          return level102Cage();
        case 195:
          return level103Cage();
        case 196:
          return level104Cage();
        case 197:
          return level13Cage();
        case 198:
          return level14Cage();
        case 199:
          return level15Cage();
        case 200:
          return level16Cage();
        case 201:
          return level17Cage();
        case 202:
          return level18Cage();
        case 203:
          return level19Cage();
        case 204:
          return level20Cage();
        case 205:
          return level21Cage();
        case 206:
          return level22Cage();
        case 207:
          return level23Cage();
        case 208:
          return level24Cage();
        case 209:
          return level25Cage();
        case 210:
          return level26Cage();
        case 211:
          return level27Cage();
        case 212:
          return level28Cage();
        case 213:
          return level29Cage();
        case 214:
          return level30Cage();
        case 215:
          return level31Cage();
        case 216:
          return level32Cage();
        case 217:
          return level33Cage();
        case 218:
          return level34Cage();
        case 219:
          return level35Cage();
        case 220:
          return level36Cage();
        case 221:
          return level37Cage();
        case 222:
          return level38Cage();
        case 223:
          return level39Cage();
        case 224:
          return level40Cage();
        case 225:
          return level41Cage();
        case 226:
          return level42Cage();
        case 227:
          return level43Cage();
        case 228:
          return level44Cage();
        case 229:
          return level45Cage();
        case 230:
          return level46Cage();
        case 231:
          return level47Cage();
        case 232:
          return level48Cage();
        case 233:
          return level49Cage();
        case 234:
          return level50Cage();
        case 235:
          return level51Cage();
        case 236:
          return level52Cage();
        case 237:
          return level53Cage();
        case 238:
          return level54Cage();
        case 239:
          return level55Cage();
        case 240:
          return level56Cage();
        case 241:
          return level57Cage();
        case 242:
          return level58Cage();
        case 243:
          return level59Cage();
        case 244:
          return level60Cage();
        case 245:
          return level61Cage();
        case 246:
          return level62Cage();
        case 247:
          return level63Cage();
        case 248:
          return level64Cage();
        case 249:
          return level65Cage();
        case 250:
          return level66Cage();
        case 251:
          return level67Cage();
        case 252:
          return level68Cage();
        case 253:
          return level69Cage();
        case 254:
          return level70Cage();
        case 255:
          return level71Cage();
        case 256:
          return level72Cage();
        case 257:
          return level73Cage();
        case 258:
          return level74Cage();
        case 259:
          return level75Cage();
        case 260:
          return level76Cage();
        case 261:
          return level77Cage();
        case 262:
          return level78Cage();
        case 263:
          return level79Cage();
        case 264:
          return level80Cage();
        case 265:
          return level81Cage();
        case 266:
          return level82Cage();
        case 267:
          return level83Cage();
        case 268:
          return level84Cage();
        case 269:
          return level85Cage();
        case 270:
          return level86Cage();
        case 271:
          return level87Cage();
        case 272:
          return level88Cage();
        case 273:
          return level89Cage();
        case 274:
          return level90Cage();
        case 275:
          return level91Cage();
        case 276:
          return level92Cage();
        case 277:
          return level93Cage();
        case 278:
          return level94Cage();
        case 279:
          return level95Cage();
        case 280:
          return level96Cage();
        case 281:
          return level97Cage();
        case 282:
          return level98Cage();
        case 283:
          return level99Cage();
        case 284:
          return level100Cage();
        case 285:
          return level101Cage();
        case 286:
          return level102Cage();
        case 287:
          return level103Cage();
        case 288:
          return level104Cage();
        case 289:
          return level16Cage();
        case 290:
          return level17Cage();
        case 291:
          return level18Cage();
        case 292:
          return level19Cage();
        case 293:
          return level20Cage();
        case 294:
          return level21Cage();
        case 295:
          return level22Cage();
        case 296:
          return level23Cage();
        case 297:
          return level24Cage();
        case 298:
          return level25Cage();
        case 299:
          return level26Cage();
        case 300:
          return level27Cage();
        case 301:
          return level28Cage();
        case 302:
          return level29Cage();
        case 303:
          return level30Cage();
        case 304:
          return level31Cage();
        case 305:
          return level32Cage();
        case 306:
          return level33Cage();
        case 307:
          return level34Cage();
        case 308:
          return level35Cage();
        case 309:
          return level36Cage();
        case 310:
          return level37Cage();
        case 311:
          return level38Cage();
        case 312:
          return level39Cage();
        case 313:
          return level40Cage();
        case 314:
          return level41Cage();
        case 315:
          return level42Cage();
        case 316:
          return level43Cage();
        case 317:
          return level44Cage();
        case 318:
          return level45Cage();
        case 319:
          return level46Cage();
        case 320:
          return level47Cage();
        case 321:
          return level48Cage();
        case 322:
          return level49Cage();
        case 323:
          return level50Cage();
        case 324:
          return level51Cage();
        case 325:
          return level16Cage();
        case 326:
          return level17Cage();
        case 327:
          return level18Cage();
        case 328:
          return level19Cage();
        case 329:
          return level20Cage();
        case 330:
          return level21Cage();
        case 331:
          return level22Cage();
        case 332:
          return level23Cage();
        case 333:
          return level24Cage();
        case 334:
          return level25Cage();
        case 335:
          return level26Cage();
        case 336:
          return level27Cage();
        case 337:
          return level28Cage();
        case 338:
          return level29Cage();
        case 339:
          return level30Cage();
        case 340:
          return level31Cage();
        case 341:
          return level32Cage();
        case 342:
          return level33Cage();
        case 343:
          return level34Cage();
        case 344:
          return level35Cage();
        case 345:
          return level36Cage();
        case 346:
          return level37Cage();
        case 347:
          return level38Cage();
        case 348:
          return level39Cage();
        case 349:
          return level40Cage();
        case 350:
          return level41Cage();
        case 351:
          return level42Cage();
        case 352:
          return level43Cage();
        case 353:
          return level44Cage();
        case 354:
          return level45Cage();
        case 355:
          return level46Cage();
        case 356:
          return level47Cage();
        case 357:
          return level48Cage();
        case 358:
          return level49Cage();
        case 359:
          return level50Cage();
        case 360:
          return level51Cage();
        case 361:
          return level16Cage();
        case 362:
          return level17Cage();
        case 363:
          return level18Cage();
        case 364:
          return level19Cage();
        case 365:
          return level20Cage();
        case 366:
          return level21Cage();
        case 367:
          return level22Cage();
        case 368:
          return level23Cage();
        case 369:
          return level24Cage();
        case 370:
          return level25Cage();
        case 371:
          return level26Cage();
        case 372:
          return level27Cage();
        case 373:
          return level28Cage();
        case 374:
          return level29Cage();
        case 375:
          return level30Cage();
        case 376:
          return level31Cage();
        case 377:
          return level32Cage();
        case 378:
          return level33Cage();
        case 379:
          return level34Cage();
        case 380:
          return level17Cage();
        case 381:
          return level18Cage();
        case 382:
          return level19Cage();
        default:
          return oneCage();
      }
    }
}
