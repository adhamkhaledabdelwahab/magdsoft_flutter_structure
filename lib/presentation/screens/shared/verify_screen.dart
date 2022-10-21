// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_button.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final verifyPhone1 = TextEditingController();
    final verifyPhone2 = TextEditingController();
    final verifyPhone3 = TextEditingController();
    final verifyPhone4 = TextEditingController();
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is VerifyUserLoadedState) {
          showToast(
            text: state.message,
            state: ToastStates.SUCCESS,
            context: context,
          );
          Navigator.pushReplacementNamed(
            context,
            homeScreenRouteName,
          );
        } else if (state is VerifyUserLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        }
      },
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColor.white,
            body: Stack(
              children: [
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 420,
                  child: GradientView(),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: (62 / screenHeight) * context.screenHeight,
                    ),
                    const CustomText(
                      text: 'Verify Phone',
                      color: AppColor.white,
                      fontSize: 30,
                    ),
                    SizedBox(
                      height: (138 / screenHeight) * context.screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(
                          focusBorder: InputBorder.none,
                          type: TextInputType.number,
                          width: 70,
                          height: 80,
                          maxLength: 1,
                          margin: EdgeInsets.zero,
                          borderRadius: 15,
                          fontSize: 30,
                          controller: verifyPhone1,
                          contentPadding: EdgeInsets.zero,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomTextFormField(
                          focusBorder: InputBorder.none,
                          type: TextInputType.number,
                          width: 70,
                          height: 80,
                          maxLength: 1,
                          margin: EdgeInsets.zero,
                          borderRadius: 15,
                          fontSize: 30,
                          controller: verifyPhone2,
                          contentPadding: EdgeInsets.zero,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomTextFormField(
                          focusBorder: InputBorder.none,
                          type: TextInputType.number,
                          width: 70,
                          height: 80,
                          maxLength: 1,
                          margin: EdgeInsets.zero,
                          borderRadius: 15,
                          fontSize: 30,
                          controller: verifyPhone3,
                          contentPadding: EdgeInsets.zero,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (val) {
                            if (val.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                        ),
                        CustomTextFormField(
                          focusBorder: InputBorder.none,
                          type: TextInputType.number,
                          width: 70,
                          height: 80,
                          maxLength: 1,
                          margin: EdgeInsets.zero,
                          borderRadius: 15,
                          fontSize: 30,
                          controller: verifyPhone4,
                          contentPadding: EdgeInsets.zero,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: (90 / screenHeight) * context.screenHeight,
                    ),
                    CustomTextButton(
                      text: 'Resend Code',
                      fontSize: 20,
                      textColor: AppColor.primary,
                      onTap: () {
                        showToast(
                          text: 'Code has been sent',
                          state: ToastStates.SUCCESS,
                          context: context,
                        );
                      },
                    ),
                    SizedBox(
                      height: (78 / screenHeight) * context.screenHeight,
                    ),
                    state is VerifyUserLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            text: 'Verify',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              final code1 = verifyPhone1.text;
                              final code2 = verifyPhone2.text;
                              final code3 = verifyPhone3.text;
                              final code4 = verifyPhone4.text;
                              if (code1.isEmpty ||
                                  code2.isEmpty ||
                                  code3.isEmpty ||
                                  code4.isEmpty) {
                                showToast(
                                  text: 'Incorrect Code!',
                                  state: ToastStates.ERROR,
                                  context: context,
                                );
                              } else {
                                final code = '$code1$code2$code3$code4'.trim();
                                cubit.verifyUser(code, phone);
                              }
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
