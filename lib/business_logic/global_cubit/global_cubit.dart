import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/cahe_keys.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/help_model.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/verify_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/help_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/products_response.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/verify_response.dart';
import 'package:translator/translator.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  List<ProductModel> products = [];
  List<ProductModel> selectedProductsCategory = [];
  List<ProductModel> chart = [];
  List<ProductModel> favourite = [];
  int selectedIndex = 0;
  List<HelpModel> help = [];
  AccountModel? user;
  ThemeMode mode = ThemeMode.system;
  Locale locale = Locale(
      Platform.localeName.split('_')[0], Platform.localeName.split('_')[1]);
  List<String> categories = [];

  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  Future checkSavedMode() async {
    try {
      final savedMode =
          CacheHelper.getDataFromSharedPreference(key: MODE_KEY) as String?;
      if (savedMode != null) {
        mode = savedMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
        emit(AppThemeModeUpdatedState());
      }
    } catch (e) {
      debugPrint('$e'.replaceAll('Exception:', ''));
    }
  }

  Future toggleMode() async {
    mode = mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await CacheHelper.saveDataSharedPreference(
      key: MODE_KEY,
      value: mode == ThemeMode.light ? 'light' : 'dark',
    );
    emit(AppThemeModeUpdatedState());
  }

  Future checkSavedLocale() async {
    try {
      final savedLocale =
          CacheHelper.getDataFromSharedPreference(key: LOCALE_KEY) as String?;
      if (savedLocale != null) {
        locale = savedLocale == 'en'
            ? const Locale('en', 'US')
            : const Locale('ar', 'EG');
        emit(AppLocaleUpdatedState());
      }
    } catch (e) {
      debugPrint('$e'.replaceAll('Exception:', ''));
    }
  }

  Future toggleLocale() async {
    locale = locale == const Locale('en', 'US')
        ? const Locale('ar', 'EG')
        : const Locale('en', 'US');
    await CacheHelper.saveDataSharedPreference(
      key: LOCALE_KEY,
      value: locale.languageCode,
    );
    await translateHelp();
    emit(AppLocaleUpdatedState());
  }

  Future translateHelp() async {
    for (int i = 0; i < help.length; i++) {
      try {
        final translator = GoogleTranslator();
        final q = (await translator.translate(
          help[i].question,
          to: locale.languageCode,
        ))
            .text;
        final a = (await translator.translate(
          help[i].answer,
          to: locale.languageCode,
        ))
            .text;
        help[i] = HelpModel(id: help[i].id, question: q, answer: a);
      } catch (e) {
        debugPrint('$e');
      }
    }
  }

  Future checkSavedUser() async {
    emit(CheckingSavedUserLoadingState());
    try {
      final savedUser =
          CacheHelper.getDataFromSharedPreference(key: USER_KEY) as String?;
      if (savedUser != null) {
        user = AccountModel.fromJson(
          jsonDecode(savedUser) as Map<String, dynamic>,
        );
      }
      emit(CheckingSavedUserLoadedState());
    } catch (e) {
      emit(CheckingSavedUserLoadingErrorState(
          '$e'.replaceAll('Exception:', '')));
    }
  }

  Future login(String name, String phone) async {
    emit(LoginLoadingState());
    try {
      final result = await DioHelper.postData(
        url: '$baseURL$urlVersion$loginEngPoint',
        body: LoginRequest(
          phone: phone,
          name: name,
        ).toJson(),
      );

      final response = LoginResponse.fromJson(result.data);
      if (response.code == null) {
        throw Exception(response.message);
      }
      emit(LoginLoadedState(response.message, phone));
    } catch (e) {
      emit(LoginLoadingErrorState('$e'.replaceAll('Exception:', '')));
    }
  }

  Future verifyUser(String code, String phone) async {
    emit(VerifyUserLoadingState());
    try {
      final result = await DioHelper.postData(
        url: '$baseURL$urlVersion$verifyEngPoint',
        body: VerifyRequest(
          phone: phone,
          code: code,
        ).toJson(),
      );

      final response = VerifyResponse.fromJson(result.data);
      if (response.accountModel == null) {
        throw Exception(response.message);
      }
      user = response.accountModel;
      await CacheHelper.saveDataSharedPreference(
        key: USER_KEY,
        value: jsonEncode(
          user!.toJson(),
        ),
      );
      emit(VerifyUserLoadedState(response.message));
    } catch (e) {
      emit(VerifyUserLoadingErrorState('$e'.replaceAll('Exception:', '')));
    }
  }

  Future logout() async {
    emit(LogoutLoadingState());
    try {
      await CacheHelper.removeData(key: USER_KEY);
      user = null;
      emit(LogoutLoadedState('Logged Out Successfully'));
    } catch (e) {
      emit(LogoutLoadingErrorState('$e'.replaceAll('Exception:', '')));
    }
  }

  void updateSelectedCategory(int index) {
    selectedProductsCategory.clear();
    if (index == 0) {
      selectedProductsCategory.addAll(products);
    } else {
      selectedProductsCategory.addAll(
        products.where(
          (element) => element.company == categories[index],
        ),
      );
    }
    selectedIndex = index;
    emit(SelectedProductsCategoryUpdatedState());
  }

  Future getProducts() async {
    emit(FetchingProductsLoadingState());
    try {
      final result = await DioHelper.getData(
        url: '$baseURL$urlVersion$getProductsEngPoint',
      );

      final response = ProductsResponse.fromJson(result.data);
      products.clear();
      products.addAll(response.products);
      categories.add('All');
      for (var e in products) {
        if (!categories.contains(e.company)) {
          categories.add(e.company);
        }
      }
      selectedProductsCategory.clear();
      selectedProductsCategory.addAll(products);
      emit(FetchingProductsLoadedState());
    } catch (e) {
      emit(
          FetchingProductsLoadingErrorState('$e'.replaceAll('Exception:', '')));
    }
  }

  Future getHelp() async {
    emit(FetchingHelpsLoadingState());
    try {
      final result = await DioHelper.getData(
        url: '$baseURL$urlVersion$getHelpEngPoint',
      );

      final response = HelpResponse.fromJson(result.data);
      help.clear();
      help.addAll(response.help);
      await translateHelp();
      emit(FetchingHelpsLoadedState());
    } catch (e) {
      emit(FetchingHelpsLoadingErrorState('$e'.replaceAll('Exception:', '')));
    }
  }

  Future checkSavedChart() async {
    try {
      final result =
          await CacheHelper.getDataFromSharedPreference(key: CHART_KEY);
      if (result != null) {
        chart.clear();
        for (var e in result) {
          final p = jsonDecode(e) as Map<String, dynamic>;
          final product = ProductModel.fromJson(p);
          chart.add(product);
        }
        emit(CheckingSavedChartLoadedState());
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future checkSavedFavourite() async {
    try {
      final result =
          await CacheHelper.getDataFromSharedPreference(key: FAVOURITE_KEY);
      if (result != null) {
        favourite.clear();
        for (var e in result) {
          final p = jsonDecode(e) as Map<String, dynamic>;
          final product = ProductModel.fromJson(p);
          favourite.add(product);
        }
        emit(CheckingSavedFavouriteLoadedState());
      }
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future toggleChart(ProductModel product) async {
    emit(ToggleProductToChartLoadingState());
    try {
      if (chart.any((element) => element.id == product.id)) {
        chart.removeWhere((element) => element.id == product.id);
      } else {
        chart.add(product);
      }
      final rChart = <String>[];
      for (var e in chart) {
        rChart.add(jsonEncode(e.toJson()));
      }
      await CacheHelper.saveDataSharedPreference(
        key: CHART_KEY,
        value: rChart,
      );
      emit(ToggleProductToChartLoadedState());
    } catch (e) {
      emit(ToggleProductToChartLoadingErrorState(
          '$e'.replaceAll('Exception:', '')));
    }
  }

  Future toggleFavourite(ProductModel product) async {
    emit(ToggleProductToFavouriteLoadingState());
    try {
      if (favourite.any((element) => element.id == product.id)) {
        favourite.removeWhere((element) => element.id == product.id);
      } else {
        favourite.add(product);
      }
      final rFavourite = <String>[];
      for (var e in favourite) {
        rFavourite.add(jsonEncode(e.toJson()));
      }
      await CacheHelper.saveDataSharedPreference(
        key: FAVOURITE_KEY,
        value: rFavourite,
      );
      emit(ToggleProductToFavouriteLoadedState());
    } catch (e) {
      emit(ToggleProductToFavouriteLoadingErrorState(
          '$e'.replaceAll('Exception:', '')));
    }
  }
}
