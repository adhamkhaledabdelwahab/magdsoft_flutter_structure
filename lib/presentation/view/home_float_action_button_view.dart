import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class HomeFloatActionButtonView extends StatelessWidget {
  const HomeFloatActionButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColor.primary,
            AppColor.primary.withOpacity(0.715625),
            AppColor.primary.withOpacity(0),
          ],
          stops: const [
            5.42,
            100.58,
            184.06,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColor.blackShadow,
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: const Center(
            child: Icon(
              Icons.home,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
