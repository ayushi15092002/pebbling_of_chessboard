import 'package:flutter/material.dart';

class Prison{

  Widget getPrison(int level){
    switch(level){
      case 1 :
        // return prison(52.0, 52.0, Color.fromARGB(255, 33, 150, 243));
        return prison(50.0, 50.0, Color.fromARGB(255, 33, 150, 243));
      case 2 :
        // return prison(53.0, 103.0, Color.fromARGB(255, 33, 150, 243));
        return prison(50.0, 95.0, Color.fromARGB(255, 33, 150, 243));
      case 3 :
        // return prison3(800.0);
        return levelprisons(720.0,3);
      case 4 :
        // return prison(103.0, 103.0, Color.fromARGB(255, 33, 150, 243));
        return prison(95.0, 95.0, Color.fromARGB(255, 33, 150, 243));
      case 5 :
        // return prison5(800.0);
        return levelprisons(720.0,5);
      case 6 :
        // return prison6(775.0);
        return levelprisons(710.0,6);
      case 7 :
        // return prison3(800.0);
        return levelprisons(720.0,3);
      case 8 :
        // return prison6(775.0);
        return levelprisons(710.0,6);
      case 9 :
        // return prison(53.0, 103.0, Color.fromARGB(255, 33, 150, 243));
        return prison(50.0, 95.0, Color.fromARGB(255, 33, 150, 243));
      case 10 :
        // return prison(103.0, 53.0, Color.fromARGB(255, 33, 150, 243));
        return prison(95.0, 50.0, Color.fromARGB(255, 33, 150, 243));

      case 11 :
        // return prison(57.0, 36.0, Color.fromARGB(255, 33, 150, 243));
        return prison(48.0, 30.0, Color.fromARGB(255, 33, 150, 243));

      case 12 :
        return prison(48.0, 55.0, Color.fromARGB(255, 33, 150, 243));

      case 13 :
        return prison(94.0, 30.0, Color.fromARGB(255, 33, 150, 243));

      case 14:
        return levelprisons(720.0, 14);
      case 15 :
        return prison(48.0, 80.0, Color.fromARGB(255, 33, 150, 243));

      case 16 :
        return levelprisons(720.0,16);
      case 17 :
        return levelprisons(720.0,17);
      case 18 :
        return levelprisons(720.0,18);
      case 19 :
        return levelprisons(720.0,19);
      case 20 :
        return levelprisons(720.0,20);
      case 21 :
        return levelprisons(720.0,21);
      case 22 :
        return levelprisons(720.0,22);
      case 23 :
        return prison(93.0, 77.0, Color.fromARGB(255, 33, 150, 243));
      case 24 :
        return levelprisons(720.0,24);
      case 25 :
        return levelprisons(720.0,25);
      case 26 :
        return levelprisons(720.0,26);
      case 27 :
        return levelprisons(720.0,27);
      case 28 :
        return levelprisons(720.0,28);
      case 30 :
        return levelprisons(720.0,30);
      case 31 :
        return levelprisons(720.0,31);
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
}
Widget levelprisons(double width, int level){
  return Padding(
    padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
    child: CustomPaint(
      size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: levelPainter(level),
    ),
  );
}
// Widget level14prison(double width){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
//     child: CustomPaint(
//       size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//       painter: level14CagePainter(),
//     ),
//   );
// }
// Widget level16prison(double width){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
//     child: CustomPaint(
//       size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//       painter: level16CagePainter(),
//     ),
//   );
// }
// Widget level17prison(double width){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
//     child: CustomPaint(
//       size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//       painter: level17CagePainter(),
//     ),
//   );
// }
// Widget level18prison(double width){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
//     child: CustomPaint(
//       size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//       painter: level18CagePainter(),
//     ),
//   );
// }
// Widget level19prison(double width){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 2.0, left: 2.0),
//     child: CustomPaint(
//       size: Size(width ,(width *0.625).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//       painter: level19CagePainter(),
//     ),
//   );
// }
CustomPainter levelPainter(int level){
  switch(level){
    case 3:
      return Prison3Painter();
    case 5:
      return Prison5Painter();
    case 6:
      return Prison6Painter();
    case 14:
      return level14CagePainter();
    case 16:
      return level16CagePainter();
    case 17:
      return level17CagePainter();
    case 18:
      return level18CagePainter();
    case 19:
      return level19CagePainter();
    case 20:
      return level20CagePainter();
    case 21:
      return level21CagePainter();
    case 22:
      return level22CagePainter();
    case 24:
      return level24CagePainter();
    case 25:
      return level25CagePainter();
    case 26:
      return level26CagePainter();
    case 27:
      return level27CagePainter();
    case 28:
      return level28CagePainter();
    case 29:
      return level29CagePainter();
    case 30:
      return level30CagePainter();
    case 31:
      return level31CagePainter();
      default:
        return level14CagePainter();

  }
}
class level14CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0675000,size.height*0.9);
    path0.lineTo(size.width*0.0675000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class level16CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class level17CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class level18CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.7);
    path0.lineTo(size.width*0.0675000,size.height*0.7);
    path0.lineTo(size.width*0.0675000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class level19CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.8);
    path0.lineTo(size.width*0.0675000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1000000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level20CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level21CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level22CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    // path0.lineTo(size.width*0.0340000,size.height*0.7);
    // path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level24CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level25CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level26CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1670000,size.height*0.9);
    path0.lineTo(size.width*0.1670000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level27CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.0340000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level28CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.0670000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height*0.9);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level29CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.9);
    path0.lineTo(size.width*0.0340000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level30CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.1000000,size.height*0.7);
    path0.lineTo(size.width*0.1000000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height*0.8);
    // path0.lineTo(size.width*0.0340000,size.height*0.8);
    // path0.lineTo(size.width*0.1340000,size.height*0.8);
    path0.lineTo(size.width*0.1340000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class level31CagePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.9);
    path0.lineTo(size.width*0.0670000,size.height*0.7);
    path0.lineTo(size.width*0.1000000,size.height*0.7);
    path0.lineTo(size.width*0.1000000,size.height*0.9);
    path0.lineTo(size.width*0.1670000,size.height*0.9);
    // path0.lineTo(size.width*0.0340000,size.height*0.8);
    // path0.lineTo(size.width*0.1340000,size.height*0.8);
    path0.lineTo(size.width*0.1670000,size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
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
