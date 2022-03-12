import 'package:flutter/material.dart';

var size, height, width;

class CardWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CardWidget({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return GestureDetector(
      child: SizedBox(
        height: height * 0.2,
        width: width * 0.40,
        child: Card(
          color: Colors.white,
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Color(0xffE1B310), width: 5.0),
            ),
          child: Center(child: child),
        ),
      ),
      onTap: onPressed,
    );
  }
}
