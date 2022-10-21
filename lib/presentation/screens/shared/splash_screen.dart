import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/splash_shapes.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 1),
      ).then(
        (value) {
          final cubit = GlobalCubit.get(context);
          if (cubit.user == null) {
            Navigator.pushReplacementNamed(context, loginScreenRouteName);
          } else {
            Navigator.pushReplacementNamed(context, homeScreenRouteName);
          }
        },
      );
    });
    return BlocListener<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is CheckingSavedUserLoadedState) {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            final cubit = GlobalCubit.get(context);
            if (cubit.user == null) {
              Navigator.pushReplacementNamed(context, loginScreenRouteName);
            } else {
              Navigator.pushReplacementNamed(context, homeScreenRouteName);
            }
          });
        } else if (state is CheckingSavedUserLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: [
            const Positioned(
              child: SplashShapes(),
            ),
            Center(
              child: Image.asset(
                'assets/images/splash.png',
                width: 269,
                height: 208,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
