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
    haveClone[57] = 1;
    haveClone[48] = 1;
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
            Positioned(
                left: 0,
                top: 299,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        border:  Border(
                          left: BorderSide(color: Colors.black, width: 4.0),
                          right:  BorderSide(color: Colors.black, width: 4.0),
                          top: BorderSide(color: Colors.black, width: 4.0),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            border:  Border(
                              left: BorderSide(color: Colors.black, width: 4.0),
                              bottom:  BorderSide(color: Colors.black, width: 4.0),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            border:  Border(
                              right: BorderSide(color: Colors.black, width: 4.0),
                              bottom:  BorderSide(color: Colors.black, width: 4.0),
                              top: BorderSide(color: Colors.black, width: 4.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
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
        // if((index == 56 && haveClone[index] == 1)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //         border:  Border(
        //           left: BorderSide(color: Colors.black, width: 4.0),
        //           bottom:  BorderSide(color: Colors.black, width: 4.0),
        //         ),
        //     ),
        //     child: getCloneWithCircularAvatar(index),
        //   );
        // }
        // else if((index == 57 && haveClone[index] == 1)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //       border: Border(
        //         right: BorderSide(color: Colors.black, width: 4.0),
        //         bottom: BorderSide(color: Colors.black, width: 4.0),
        //         top: BorderSide(color: Colors.black, width: 4.0),
        //       ),
        //     ),
        //     child: getCloneWithCircularAvatar(index),
        //   );
        // }
        // else if((index == 48 && haveClone[index] == 1)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //       border:  Border(
        //         right: BorderSide(color: Colors.black, width: 4.0),
        //         left: BorderSide(color: Colors.black, width: 4.0),
        //         top: BorderSide(color: Colors.black, width: 4.0),
        //       ),
        //     ),
        //     child: getCloneWithCircularAvatar(index),
        //   );
        // }
        // else if((index == 56 && haveClone[index] == 0)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //       border:  Border(
        //         left: BorderSide(color: Colors.black, width: 4.0),
        //         bottom: BorderSide(color: Colors.black, width: 4.0),
        //       ),
        //     ),
        //   );
        // }
        // else if((index == 57 && haveClone[index] == 0)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //       border: Border(
        //         left: BorderSide(color: Colors.black, width: 4.0),
        //         bottom: BorderSide(color: Colors.black, width: 4.0),
        //       ),
        //     ),
        //   );
        // }
        // else if((index == 48 && haveClone[index] == 0)){
        //   return Container(
        //     decoration: const BoxDecoration(
        //       border: Border(
        //         left: BorderSide(color: Colors.black, width: 4.0),
        //         bottom: BorderSide(color: Colors.black, width: 4.0),
        //       ),
        //     ),
        //   );
        // }
        // else
          if (haveClone[index] == 1) {
          return  getCloneWithCircularAvatar(index);
        }
        else {
          return Container();
        }
      },
      itemCount: 64,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
  Widget getCloneWithCircularAvatar(int index){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.red[800],
          ),
          onTap: () {
            if (haveClone[index -8] == 0 && haveClone[index+1] == 0) {
              setState(() {
                if((index+1)%8 != 0 ){
                  print("Current index : ${index}");
                  print("upward index : ${index - 8} ");
                  print("right index : ${index + 1}");
                  haveClone[index] = 0;
                  haveClone[index - 8] = 1;
                  haveClone[index + 1] = 1;
                }
              });
            }
          }),
    );
  }
}
