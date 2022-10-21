import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoginCircledButton extends StatelessWidget {
  const LoginCircledButton({
    Key? key,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColor.blackShadow,
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(2, 5),
          ),
        ],
      ),
      child: Material(
        color: AppColor.white,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
            ),
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
