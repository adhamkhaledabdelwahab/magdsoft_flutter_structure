import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class GradientView extends StatelessWidget {
  const GradientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.primary.withOpacity(0.85),
            AppColor.primary.withOpacity(0),
          ],
          stops: const [
            0,
            100,
          ],
        ),
      ),
    );
  }
}
