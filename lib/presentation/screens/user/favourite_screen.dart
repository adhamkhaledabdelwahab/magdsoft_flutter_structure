import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/custom_back_button_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/products_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

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
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                bottom: 0,
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
                                text: 'My Favourite',
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
                    Expanded(
                      child: cubit.favourite.isNotEmpty
                          ? ProductsView(
                              products: cubit.favourite,
                              cart: cubit.chart,
                              favourite: cubit.favourite,
                              toggleChart: cubit.toggleChart,
                              toggleFavourite: cubit.toggleFavourite,
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 50,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.primary,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.favorite,
                                          size: 100,
                                          color: AppColor.white,
                                        ),
                                        CustomText(
                                          text:
                                              'No Favourite Products Yet, Start Add Now.',
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                          color: AppColor.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
