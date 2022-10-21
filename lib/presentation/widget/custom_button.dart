import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.margin = const EdgeInsets.only(left: 46, right: 44),
    this.height = 48.01,
    this.width = double.maxFinite,
    this.padding,
    this.borderRadius = 50,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final EdgeInsets margin;
  final double height;
  final double width;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (det) => setState(() {
        hover = true;
      }),
      onTapUp: (det) => setState(() {
        hover = false;
      }),
      onTapCancel: () => setState(() {
        hover = false;
      }),
      child: Container(
        height: widget.height,
        width: widget.width,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: widget.margin,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient:
               LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.primary,
                    AppColor.primary.withOpacity(0.5),
                    AppColor.primary.withOpacity(0.27),
                  ],
                  stops: const [
                    -1.06,
                    118.96,
                    118.97,
                  ],
                )
              ,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap:  widget.onTap,
            child: Center(
              child: CustomText(
                text: widget.text,
                color: AppColor.white,
                fontSize: 20,
                decoration:
                   hover ? TextDecoration.underline : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
