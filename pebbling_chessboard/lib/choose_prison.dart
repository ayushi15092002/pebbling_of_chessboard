// import 'package:flutter/material.dart';
// import 'package:pebbling_chessboard/prison/prison.dart';
// import 'package:pebbling_chessboard/widgets/ButtonWidget.dart';
// import 'package:pebbling_chessboard/widgets/CardWidget.dart';
// import 'package:pebbling_chessboard/widgets/TextWidget.dart';
// import 'package:pebbling_chessboard/widgets/background.dart';
// import 'package:pebbling_chessboard/widgets/prisonWidget.dart';
//
// import 'choose_no_of_clones.dart';
//
// class ChoosePrisonScreen extends StatefulWidget {
//   @override
//   State<ChoosePrisonScreen> createState() => ChoosePrisonScreenState();
// }
//
// class ChoosePrisonScreenState extends State<ChoosePrisonScreen> {
//   var size, height, width;
//
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery
//         .of(context)
//         .size;
//     height = size.height;
//     width = size.width;
//     return Scaffold(
//       body: BackgroundWidget(
//         child:
//         Column(
//           children: [
//             SizedBox(
//               height: height * 0.1,
//             ),
//             textWidget("ChoosePrison", Color(0xff8D0404), Color(0xffE1B310),
//                 width * 0.1, 17, "Rye"),
//             SizedBox(
//               height: height * 0.1,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: width * 0.075,
//                 ),
//                 CardWidget(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => NoOfClonesScreen( prisonSize: 1,)),
//                       );
//                     },
//                     // child: PrisonWidget(
//                     //   // child: Prison().prison1(
//                     //   //     width * 0.085, width * 0.08, Colors.yellowAccent),
//                     // )
//                 ),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 CardWidget(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NoOfClonesScreen( prisonSize: 2,)),
//                     );
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       PrisonWidget(
//                         child: Prison().prison2(
//                             width * 0.17, width * 0.08, Colors.yellowAccent),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: height * 0.1,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: width * 0.075,
//                 ),
//                 CardWidget(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => NoOfClonesScreen( prisonSize: 2,)),
//                       );
//                     },
//                     child: PrisonWidget(
//                       child: Prison().prison2(
//                           width * 0.085, width * 0.16, Colors.yellowAccent),
//                     )),
//                 SizedBox(
//                   width: width * 0.05,
//                 ),
//                 CardWidget(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NoOfClonesScreen( prisonSize: 3,)),
//                     );
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       PrisonWidget(
//                           child: Prison().prison3(500.0)
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
