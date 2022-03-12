import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:pebbling_chessboard/prison/prison.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Can You Escape?',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
//

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//     Container(
//       height: 50.0,
//       width: 50.0,
//       decoration: const BoxDecoration(
//         border:  Border(
//           left: BorderSide(color: Colors.black, width: 4.0),
//           right:  BorderSide(color: Colors.black, width: 4.0),
//           top: BorderSide(color: Colors.black, width: 4.0),
//         ),
//       ),
//     ),
//     Row(
//       children: [
//         Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//             border:  Border(
//               left: BorderSide(color: Colors.black, width: 4.0),
//               bottom:  BorderSide(color: Colors.black, width: 4.0),
//             ),
//           ),
//         ),
//         Container(
//           height: 50.0,
//           width: 50.0,
//           decoration: const BoxDecoration(
//             border:  Border(
//               right: BorderSide(color: Colors.black, width: 4.0),
//               bottom:  BorderSide(color: Colors.black, width: 4.0),
//               top: BorderSide(color: Colors.black, width: 4.0),
//             ),
//           ),
//         )
//       ],
//     )
//   ],
// )