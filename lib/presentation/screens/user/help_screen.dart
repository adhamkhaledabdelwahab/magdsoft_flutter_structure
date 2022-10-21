import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/view/help_list_view.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 420,
                child: GradientView(),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(
                      height: (50 / screenHeight) * context.screenHeight,
                    ),
                    const CustomText(
                      text: 'Help',
                      color: AppColor.white,
                      fontSize: 30,
                    ),
                    SizedBox(
                      height: (65 / screenHeight) * context.screenHeight,
                    ),
                    Expanded(
                      child: HelpListView(
                        help: cubit.help,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: (859 / screenHeight) * context.screenHeight,
                child: CustomButton(
                  text: 'Continue',
                  onTap: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
