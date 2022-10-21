import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/screens.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/cart_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/favourite_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/settings_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRouteName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homeScreenRouteName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreenRouteName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case verifyScreenRouteName:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => VerifyScreen(
            phone: args,
          ),
        );
      case productScreenRouteName:
        final args = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductScreen(
            product: args,
          ),
        );
      case helpScreenRouteName:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case settingsScreenRouteName:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case cartScreenRouteName:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case favouriteScreenRouteName:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      default:
        return null;
    }
  }
}
