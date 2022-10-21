import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final Function() onTap;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (det) {
        setState(() {
          hover = true;
        });
      },
      onTapUp: (det) {
        setState(() {
          hover = false;
        });
      },
      onTapCancel: () {
        setState(() {
          hover = false;
        });
      },
      child: CustomText(
        text: widget.text,
        fontSize: widget.fontSize,
        color: widget.textColor,
        decoration: hover ? TextDecoration.underline : null,
      ),
    );
  }
}
