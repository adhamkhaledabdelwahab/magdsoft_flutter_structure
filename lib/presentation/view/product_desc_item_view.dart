import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class ProductDescItemView extends StatelessWidget {
  const ProductDescItemView({
    Key? key,
    required this.current,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final bool current;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: CustomText(
            text: text,
            fontSize: 18,
            color: AppColor.subtitleColor,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current ? null : Colors.transparent,
            gradient: current
                ? LinearGradient(
                    colors: [
                      AppColor.primary,
                      AppColor.primary.withOpacity(0),
                    ],
                    stops: const [
                      5.42,
                      184.06,
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
