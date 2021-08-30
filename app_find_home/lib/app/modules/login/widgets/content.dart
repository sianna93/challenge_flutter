import 'package:app_find_home/app/core/theme/app_theme.dart';
import 'package:app_find_home/app/global_widgets/input-field.dart';
import 'package:app_find_home/app/global_widgets/label-field.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'content-form-login.dart';

class ContentLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        // height: 200.0,
        //color: Colors.white,
        /*child: CustomPaint(
            painter: _HeaderBezier(),
            //child: ContentFormLogin()
        ),*/


        child: ClipPath(
          clipper: _CustomClipper(),
          child: ContentFormLogin()
        )

      )
    );
  }

}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..moveTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..lineTo(0, size.height * .3)
    ..arcToPoint(
      Offset(size.width * .03, size.height * .25),
      radius: Radius.circular(40.0),
    )
    ..lineTo(size.width * .4, size.height * .03)
    ..quadraticBezierTo(size.width * .45, 0, size.width * .5, 0)
    ..quadraticBezierTo(size.width * .55, 0, size.width * .6, size.height * .03)
    ..lineTo(size.width * .97, size.height * .25)
    ..arcToPoint(
      Offset(size.width, size.height * .3),
      radius: Radius.circular(40.0),
    )
    ..lineTo(size.width, size.height)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _HeaderBezier extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = Colors.white;
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 30.0;

    print('size');
    print(size);
    //Definir pizarra
    final path = Path();

    //Dibujar en pizarra
    path.moveTo(0, 120);

    path.addArc(
        Rect.fromCircle(center: Offset(40, 120), radius: 22),
        math.pi*0.85, math.pi/2);

    //path.quadraticBezierTo(size.height *0.3, size.height, size.width, size.height *0.3);

    //path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4, size.height / 4, size.width, size.height);

    path.lineTo((size.width * 0.5) - 12.5, 10.15);
    path.addArc(
        Rect.fromCircle(center: Offset(size.width * 0.5, 30), radius: 25),
        -(1/4)*math.pi, -math.pi/2);
    path.lineTo(size.width, 120);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 120);
    /*path.lineTo(size.width * 0.5, 0);
    path.lineTo(size.width, 120);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 120);*/


    //path.lineTo(size.width, size.height * 0.35);
    //path.lineTo(0, 0);


    canvas.drawPath(path, lapiz);

    /*final path2 = Path();

    path2.moveTo(0, size.height * 0.15);
    path2.quadraticBezierTo(size.width *0.5, size.height * 0.4, size.width, size.height *0.3);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);
    lapiz.color = Colors.pink;
    canvas.drawPath(path2, lapiz);*/


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}



