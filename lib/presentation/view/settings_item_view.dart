import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class SettingsItemView extends StatelessWidget {
  const SettingsItemView({
    Key? key,
    required this.onTap,
    required this.text,
    required this.trailing,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 25,
      ),
      child: ListTile(
        onTap: onTap,
        tileColor: AppColor.lightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: CustomText(
          text: text,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColor.white,
        ),
        trailing: trailing,
      ),
    );
  }
}
