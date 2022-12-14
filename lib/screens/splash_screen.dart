import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:otusfood/utils/app_colors.dart';
import 'main_screen.dart';

class SplashScreenWidget extends StatelessWidget {
  static String splashScreenName = "/splashScreenName";

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 2),
      () => Navigator.popAndPushNamed(context, MainScreen.mainScreenName),
    );

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: CustomPaint(
              painter: _GradientStartPainter(),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: SizedBox(
              width: 283.0,
              height: 283.0,
              child: Image.asset("assets/images/back_img.png"),
            ),
          )
        ],
      ),
    );
  }
}

class _GradientStartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(
        Offset(0.0, 0.0),
        Offset(size.width, size.height),
        [
          AppColors.mainAccent,
          AppColors.main,
        ],
        [0.19, 1],
      );
    final rect = Offset.zero & size;
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
