import 'package:flutter/material.dart';

var size, height, width;

class PrisonWidget extends StatelessWidget {
  final Widget child;
  const PrisonWidget({Key? key, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Stack(
      children: [
        SizedBox(
          height: height * 0.17,
          width: width * 0.30,
          child: Image.asset("assets/images/prison.png"),
        ),
        Positioned(
          bottom: height * 0.01,
            left: 0.0,
            child: child
        )
      ],
    );
  }
}

