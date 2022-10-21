import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: (58 / screenHeight) * context.screenHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => GlobalCubit.get(context).logout(),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.logout,
                    color: AppColor.lightGrey,
                  ),
                ),
              ),
            ),
            Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  favouriteScreenRouteName,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.lightGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  cartScreenRouteName,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: AppColor.lightGrey,
                  ),
                ),
              ),
            ),
            Material(
              type: MaterialType.circle,
              color: Colors.transparent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => Navigator.pushNamed(
                  context,
                  settingsScreenRouteName,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.settings,
                    color: AppColor.lightGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
