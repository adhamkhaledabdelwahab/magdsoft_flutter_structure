import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.image,
    required this.tag,
  }) : super(key: key);

  final String image;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: (33 / screenWidth) * context.screenWidth,
        right: (33 / screenWidth) * context.screenWidth,
        bottom: 29,
      ),
      width: (364 / screenWidth) * context.screenWidth,
      height: (300 / screenHeight) * context.screenHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.white,
        boxShadow: const [
          BoxShadow(
            color: AppColor.blackShadow,
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Center(
        child: Hero(
          tag: tag,
          child: Image.network(
            image,
            width: 277,
            height: 220,
          ),
        ),
      ),
    );
  }
}
