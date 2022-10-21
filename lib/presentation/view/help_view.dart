import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class HelpView extends StatefulWidget {
  const HelpView({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String title;
  final String desc;

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  bool show = false;
  String icon = _arrowDown;
  static const _arrowDown = 'assets/images/arrow_down.png';
  static const _arrowUp = 'assets/images/arrow_up.png';

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 17),
        padding: const EdgeInsets.only(
          left: 15,
          right: 14,
          top: 13,
          bottom: 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
          boxShadow: const [
            BoxShadow(
              color: AppColor.blackShadow,
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: 17,
                  color: AppColor.primary,
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: InkWell(
                    key: UniqueKey(),
                    onTap: () {
                      setState(() {
                        show = !show;
                        icon = show ? _arrowUp : _arrowDown;
                      });
                    },
                    child: Image.asset(
                      icon,
                      width: 19,
                      height: 12,
                    ),
                  ),
                ),
              ],
            ),
            if (show)
              Column(
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomText(
                      text: widget.desc,
                      fontSize: 17,
                      color: AppColor.subtitleColor,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
