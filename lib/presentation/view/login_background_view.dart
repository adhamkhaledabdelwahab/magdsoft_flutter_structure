import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_circled_button.dart';

class LoginBackgroundView extends StatelessWidget {
  const LoginBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const containerHeight = 617;
    final actualContainerHeight =
        (context.screenHeight - ((316 / screenHeight) * context.screenHeight));
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/login.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: (316 / screenHeight) * context.screenHeight,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
              color: AppColor.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: (349 / containerHeight) * actualContainerHeight,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 28.0,
                    right: 30.0,
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.dividerColor,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: 'OR',
                        fontSize: 15,
                        color: AppColor.dividerColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColor.dividerColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: (87 / containerHeight) * actualContainerHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LoginCircledButton(
                      imagePath: 'assets/images/f.png',
                      onTap: () {},
                    ),
                    LoginCircledButton(
                      imagePath: 'assets/images/g.png',
                      onTap: () {},
                    ),
                    LoginCircledButton(
                      imagePath: 'assets/images/apple.png',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
