import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hint,
    required this.controller,
    this.type = TextInputType.text,
    this.height = 48.01,
    this.width = double.infinity,
    this.margin = const EdgeInsets.only(left: 46, right: 44),
    this.boxShadow = const [
      BoxShadow(
        color: AppColor.blackShadow,
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(2, 2),
      )
    ],
    this.borderRadius = 10,
    this.fontSize = 10,
    this.maxLength,
    this.suffix,
    this.focusBorder,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 15),
    this.textAlign,
    this.textAlignVertical,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  final String? hint;
  final TextInputType type;
  final TextEditingController controller;
  final double height;
  final double width;
  final EdgeInsets margin;
  final List<BoxShadow> boxShadow;
  final double borderRadius;
  final double fontSize;
  final int? maxLength;
  final Widget? suffix;
  final InputBorder? focusBorder;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
      ),
      height: height,
      margin: margin,
      child: TextFormField(
        onChanged: onChanged,
        maxLength: maxLength,
        controller: controller,
        keyboardType: type,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColor.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        expands: true,
        minLines: null,
        maxLines: null,
        inputFormatters: inputFormatters,
        textAlignVertical: textAlignVertical,
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding,
          isCollapsed: false,
          suffixIcon: suffix,
          hintText: hint?.tr(),
          hintStyle: TextStyle(
            fontSize: fontSize,
            color: AppColor.lightGrey,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          counterText: '',
          filled: true,
          fillColor: AppColor.white,
          border: InputBorder.none,
          focusedBorder: focusBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColor.primary,
                ),
              ),
        ),
      ),
    );
  }
}
