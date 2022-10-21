import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_background_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_form_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Positioned.fill(
            child: LoginBackgroundView(),
          ),
          Positioned(
            top: (193 / screenHeight) * context.screenHeight,
            left: (29 / screenWidth) * context.screenWidth,
            right: (29 / screenWidth) * context.screenWidth,
            child: const LoginFormView(),
          ),
        ],
      ),
    );
  }
}
