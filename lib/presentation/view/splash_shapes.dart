import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashShapes extends StatelessWidget {
  const SplashShapes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: (567 / screenHeight) * context.screenHeight,
          left: -(146.99 / screenWidth) * context.screenWidth,
          child: Container(
            width: 246,
            height: 246,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.34),
                  Color.fromRGBO(255, 255, 255, 0),
                ],
                stops: [
                  0,
                  155.23,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: (577 / screenHeight) * context.screenHeight,
          left: -(154.64 / screenWidth) * context.screenWidth,
          child: Container(
            width: 246,
            height: 271,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary,
            ),
          ),
        ),
        Positioned(
          top: (177 / screenHeight) * context.screenHeight,
          left: (282 / screenWidth) * context.screenWidth,
          child: Container(
            width: 246,
            height: 246,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.34),
                  Color.fromRGBO(255, 255, 255, 0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: (200 / screenHeight) * context.screenHeight,
          left: (268 / screenWidth) * context.screenWidth,
          child: Container(
            width: 246,
            height: 271,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary,
            ),
          ),
        ),
        Positioned(
          top: (490 / screenHeight) * context.screenHeight,
          left: (340 / screenWidth) * context.screenWidth,
          child: Transform.rotate(
            angle: 50.27 * pi / 180,
            child: Container(
              width: 95,
              height: 389,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF0059AB),
              ),
            ),
          ),
        ),
        Positioned(
          top: (40 / screenHeight) * context.screenHeight,
          left: -(30 / screenWidth) * context.screenWidth,
          child: Transform.rotate(
            angle: 50.27 * pi / 180,
            child: Container(
              width: 95,
              height: 389,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFF0059AB),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
