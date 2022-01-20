import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ChessBoardController controller = ChessBoardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height:400,
          child: Stack(
            children: [
              AspectRatio(
                child: Image.asset(
                  "images/orange_board.png",
                  package: 'flutter_chess_board',
                  fit: BoxFit.cover,
                ),
                aspectRatio: 1.0,
              ),
              AspectRatio(
                aspectRatio: 1.0,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 8),
                  itemBuilder: (context, index) {
                    var row = index ~/ 8;
                    var column = index % 8;
                    var boardRank = '${(7 - row) + 1}';
                    var boardFile = '${files[column]}';
                    return index == 56 
                    ? Container(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.red[800],
                        ),
                      )
                    )
                        : Container();

                    // var squareName = '$boardFile$boardRank';
                    // var pieceOnSquare = game.get(squareName);

                    // var piece = BoardPiece(
                    //   squareName: squareName,
                    //   game: game,
                    // );

                    // var draggable = game.get(squareName) != null
                    //     ? Draggable<PieceMoveData>(
                    //   child: piece,
                    //   feedback: piece,
                    //   childWhenDragging: SizedBox(),
                    //   data: PieceMoveData(
                    //     squareName: squareName,
                    //     pieceType:
                    //     pieceOnSquare?.type.toUpperCase() ?? 'P',
                    //     pieceColor: pieceOnSquare?.color ?? Color.WHITE,
                    //   ),
                    // )
                    //     : Container();

                    // var dragTarget =
                    // DragTarget<PieceMoveData>(builder: (context, list, _) {
                    //   return draggable;
                    // }, onWillAccept: (pieceMoveData) {
                    //   return widget.enableUserMoves ? true : false;
                    // }, onAccept: (PieceMoveData pieceMoveData) async {
                    //   // A way to check if move occurred.
                    //   Color moveColor = game.turn;
                    //
                    //   if (pieceMoveData.pieceType == "P" &&
                    //       ((pieceMoveData.squareName[1] == "7" &&
                    //           squareName[1] == "8" &&
                    //           pieceMoveData.pieceColor == Color.WHITE) ||
                    //           (pieceMoveData.squareName[1] == "2" &&
                    //               squareName[1] == "1" &&
                    //               pieceMoveData.pieceColor == Color.BLACK))) {
                    //     var val = await _promotionDialog(context);
                    //
                    //     if (val != null) {
                    //       widget.controller.makeMoveWithPromotion(
                    //         from: pieceMoveData.squareName,
                    //         to: squareName,
                    //         pieceToPromoteTo: val,
                    //       );
                    //     } else {
                    //       return;
                    //     }
                    //   } else {
                    //     widget.controller.makeMove(
                    //       from: pieceMoveData.squareName,
                    //       to: squareName,
                    //     );
                    //   }
                    //   if (game.turn != moveColor) {
                    //     widget.onMove?.call();
                    //   }
                    // });

                    // return dragTarget;
                  },
                  itemCount: 64,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
