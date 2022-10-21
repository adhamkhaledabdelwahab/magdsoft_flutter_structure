// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is LoginLoadedState) {
          showToast(
            text: state.message,
            state: ToastStates.SUCCESS,
            context: context,
          );
          Navigator.pushReplacementNamed(
            context,
            verifyScreenRouteName,
            arguments: state.phone,
          );
        } else if (state is LoginLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        }
      },
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        return Container(
          width: 372,
          height: 345,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppColor.white,
            boxShadow: const [
              BoxShadow(
                color: AppColor.blackShadow,
                spreadRadius: 5,
                blurRadius: 20,
                offset: Offset(2, 5),
              )
            ],
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 27.88, bottom: 15.66),
                child: CustomText(
                  text: 'Welcome',
                  fontSize: 30,
                ),
              ),
              Container(
                width: 143,
                height: 3.13,
                margin: const EdgeInsets.only(bottom: 42.79),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromRGBO(0, 98, 189, 0.72),
                ),
              ),
              CustomTextFormField(
                type: TextInputType.text,
                hint: 'Enter Your Full Name',
                controller: fullNameController,
                fontSize: 15,
                textAlignVertical: TextAlignVertical.center,
              ),
              const SizedBox(
                height: 16.96,
              ),
              CustomTextFormField(
                type: TextInputType.number,
                hint: 'Enter Your Phone Number',
                controller: phoneNumberController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                fontSize: 15,
                textAlignVertical: TextAlignVertical.center,
              ),
              const SizedBox(
                height: 31.99,
              ),
              state is LoginLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      text: 'Login',
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        final phone = phoneNumberController.text;
                        final name = fullNameController.text;
                        if (phone.isEmpty || name.isEmpty) {
                          showToast(
                            text: 'Phone Number And Name cannot be empty!'.tr(),
                            state: ToastStates.ERROR,
                            context: context,
                          );
                        } else {
                          cubit.login(name, phone);
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
