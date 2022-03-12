import 'package:flutter/material.dart';

class Prison{

  Widget getPrison(int level){
    switch(level){
      case 1 :
        return prison(52.0, 52.0, Color.fromARGB(255, 33, 150, 243));
      case 2 :
        return prison(53.0, 103.0, Color.fromARGB(255, 33, 150, 243));
      case 3 :
        return prison3(800.0);
      case 4 :
        return prison(103.0, 103.0, Color.fromARGB(255, 33, 150, 243));
      case 5 :
        return prison5(800.0);
      case 6 :
        return prison6(775.0);
      case 7 :
        return prison3(800.0);
      case 8 :
        return prison6(775.0);
      case 9 :
        return prison(53.0, 103.0, Color.fromARGB(255, 33, 150, 243));
      case 10 :
        return prison(103.0, 53.0, Color.fromARGB(255, 33, 150, 243));
      case 11 :
        return prison(57.0, 36.0, Color.fromARGB(255, 33, 150, 243));
    }
    return prison(50.0, 50.0, Color.fromARGB(255, 33, 150, 243));

  }
  Widget prison(double height, double width, Color boxColor){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: boxColor,
          width: 4.0,
        ),
      ),
    );
  }
  Widget prison3(double width){
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
      child: CustomPaint(
        size: Size(width ,(width *0.625).toDouble()),
        painter: Prison3Painter(),
      ),
    );
  }
  Widget prison5(double width){
    return Padding(
      padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
      child: CustomPaint(
        size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: Prison5Painter(),
      ),
    );
  }
  Widget prison6(double width){
     return Padding(
      padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
      child: CustomPaint(
        size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
        painter: Prison6Painter(),
      ),
    );
  }
}
class Prison3Painter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color =  const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path0 = Path();
    path0.moveTo(0,size.height*0.8010000);
    path0.lineTo(size.width*0.0628125,size.height*0.8005000);
    path0.lineTo(size.width*0.0625000,size.height*0.9000000);
    path0.lineTo(size.width*0.1250000,size.height*0.9000000);
    path0.lineTo(size.width*0.1256250,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.9000000);
    path0.lineTo(0,size.height*0.8010000);
    path0.close();
    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Prison5Painter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Path path0 = Path();
    path0.moveTo(size.width*0.0625000,size.height*0.7000000);
    path0.lineTo(size.width*0.0625000,size.height*0.9000000);
    path0.lineTo(size.width*0.1250000,size.height*0.9000000);
    path0.lineTo(size.width*0.1250000,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,size.height*0.7000000);
    path0.lineTo(size.width*0.0625000,size.height*0.7000000);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class Prison6Painter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    
    Path path0 = Path();
    path0.moveTo(size.width*0.0012625,size.height*0.6960200);
    path0.lineTo(size.width*0.0012625,size.height*0.9960200);
    path0.lineTo(size.width*0.1887625,size.height*0.9960200);
    path0.lineTo(size.width*0.1887625,size.height*0.8960200);
    path0.lineTo(size.width*0.0637625,size.height*0.8960200);
    path0.lineTo(size.width*0.0637625,size.height*0.6960200);
    path0.lineTo(size.width*0.0012625,size.height*0.6960200);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
