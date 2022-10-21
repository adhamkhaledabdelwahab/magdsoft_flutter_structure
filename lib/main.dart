import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/bloc_observer.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      fallbackLocale: Locale(
        Platform.localeName.split('_')[0],
        Platform.localeName.split('_')[1],
      ),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      path: 'assets/i18n',
      child: BlocProvider(
        create: (BuildContext context) => GlobalCubit()
          ..checkSavedLocale()
          ..checkSavedMode()
          ..checkSavedUser(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) async {
        if (state is AppLocaleUpdatedState) {
          final cubit = GlobalCubit.get(context);
          context.setLocale(cubit.locale);
        }
      },
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        if (context.locale != cubit.locale) {
          context.setLocale(cubit.locale);
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: cubit.mode,
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
