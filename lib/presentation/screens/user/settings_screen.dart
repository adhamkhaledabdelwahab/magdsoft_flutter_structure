import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/custom_back_button_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/settings_item_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        final isDark = cubit.mode == ThemeMode.dark;
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
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Stack(
                          children: const [
                            Positioned.fill(
                              child: Center(
                                child: CustomText(
                                  text: 'Settings',
                                  color: AppColor.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 23,
                              child: CustomBackButtonView(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: (75 / screenHeight) * context.screenHeight,
                      ),
                      SettingsItemView(
                        onTap: () => cubit.toggleMode(),
                        text: 'Dark Mode',
                        trailing: Switch(
                          activeColor: AppColor.white,
                          value: isDark,
                          onChanged: (val) => cubit.toggleMode(),
                        ),
                      ),
                      SettingsItemView(
                        onTap: () => cubit.toggleLocale(),
                        text: 'App Language',
                        trailing: const AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: Icon(
                            Icons.language,
                            color: AppColor.white,
                            size: 35,
                          ),
                        ),
                      ),
                      SettingsItemView(
                        onTap: () => Navigator.pushNamed(
                          context,
                          helpScreenRouteName,
                        ),
                        text: 'Help',
                        trailing: const AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: Icon(
                            Icons.help,
                            color: AppColor.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
