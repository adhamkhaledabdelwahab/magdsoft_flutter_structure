import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class ProductImageListView extends StatelessWidget {
  const ProductImageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsImages = [
      'assets/images/img_3.png',
      'assets/images/img_6.png',
      'assets/images/img_4.png',
      'assets/images/img_3.png',
    ];
    return Container(
      margin: const EdgeInsets.only(left: 36, bottom: 29),
      height: 120,
      width: context.screenWidth - 36,
      child: ListView.separated(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => Container(
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.white,
              boxShadow: const [
                BoxShadow(
                  color: AppColor.blackShadow,
                  spreadRadius: 5,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ]),
          child: Center(
            child: Image.asset(
              itemsImages[index],
              width: 71,
              height: 57,
            ),
          ),
        ),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 14,
        ),
      ),
    );
  }
}
