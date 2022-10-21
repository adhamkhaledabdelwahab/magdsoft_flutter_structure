import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'dart:ui' as ui;

class CustomBackButtonView extends StatelessWidget {
  const CustomBackButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.white,
          boxShadow: const [
            BoxShadow(
              color: AppColor.blackShadow,
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.center,
        child: Material(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: AppColor.lightGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
