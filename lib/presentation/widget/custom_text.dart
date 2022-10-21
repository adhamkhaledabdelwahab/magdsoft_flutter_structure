import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color = AppColor.black,
    this.decoration,
    this.textAlign,
    this.fontWeight = FontWeight.w400,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color color;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: 'Inter',
        color: color,
        decoration: decoration,
      ),
    ).tr();
  }
}
