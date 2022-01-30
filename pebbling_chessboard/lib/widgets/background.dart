import 'package:flutter/cupertino.dart';

class BackgroundWidget extends StatelessWidget{
  final double height;
  final double width;
  final Widget child;
  const BackgroundWidget({Key? key, required this.height, required this.width, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.2, 0.5, 0.7, 1.0],
          colors: [
            Color.fromRGBO(0,0,0,1.0),
            Color.fromRGBO(28,6,1, 1.0),
            Color.fromRGBO(81,16,2,9.0),
            Color.fromRGBO(170,34,4,8.0),
            Color.fromRGBO(66,20,20,1.0),
          ], // red to yellow
        ),
      ),
      child: child,
    );
  }

}
