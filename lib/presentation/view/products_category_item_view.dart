import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class ProductsCategoryItemView extends StatelessWidget {
  const ProductsCategoryItemView({
    Key? key,
    required this.selected,
    required this.onChange,
    required this.index,
    required this.image,
    required this.text,
  }) : super(key: key);

  final bool selected;
  final Function(int index) onChange;
  final int index;
  final Widget image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: (129 / screenWidth) * screenWidth,
      height: 52,
      decoration: BoxDecoration(
        color: selected ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: AppColor.blackShadow,
            spreadRadius: 4,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onChange(index),
          child: Center(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.only(
                    left: 12,
                    top: 6,
                    bottom: 6,
                    right: 13,
                  ),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.blackShadow,
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: Offset(2, 2),
                        )
                      ]),
                  child: Center(
                    child: image,
                  ),
                ),
                CustomText(
                  text: text,
                  textAlign: TextAlign.start,
                  fontSize: 22,
                  color: selected ? AppColor.white : AppColor.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
