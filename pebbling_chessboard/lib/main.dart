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
  final haveClone = List.generate(64, (index) => 0);

  @override
  void initState() {
    haveClone[56] = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SizedBox(
        width: 400,
        height: 400,
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
              child: getClone(),
            ),
          ],
        ),
      )),
    );
  }

  Widget getClone() {
    print("getclone called");
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
      itemBuilder: (context, index) {
        var row = index ~/ 8;
        var column = index % 8;
        if (haveClone[index] == 1) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.red[800],
                ),
                onTap: () {
                  if (haveClone[index -8] == 0 && haveClone[index+1] == 0) {
                    setState(() {
                      print("upward index : ${index - 8} ");
                      print("right index : ${index + 1}");
                      haveClone[index - 8] = 1;
                      haveClone[index + 1] = 1;
                      getClone();
                    });
                  }
                }),
          );
        } else {
          return Container();
        }
      },
      itemCount: 64,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
