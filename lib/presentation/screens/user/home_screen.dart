import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_bottom_navigation_bar.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_categories_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_float_action_button_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_items_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_new_release_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/home_search_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    GlobalCubit.get(context)
      ..getProducts()
      ..getHelp()
      ..checkSavedChart()
      ..checkSavedFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is LogoutLoadedState) {
          showToast(
            text: state.message,
            state: ToastStates.SUCCESS,
            context: context,
          );
          Navigator.pushNamedAndRemoveUntil(
              context, loginScreenRouteName, (route) => false);
        } else if (state is LogoutLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        } else if (state is ToggleProductToFavouriteLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        } else if (state is ToggleProductToChartLoadingErrorState) {
          showToast(
            text: state.message,
            state: ToastStates.ERROR,
            context: context,
          );
        }
      },
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        return Scaffold(
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
              Positioned.fill(
                child: cubit.products.isNotEmpty
                    ? Column(
                        children: [
                          const HomeSearchView(),
                          const HomeNewReleaseView(),
                          HomeCategoriesView(
                            categories: cubit.categories,
                            onChange: (int index) =>
                                cubit.updateSelectedCategory(index),
                            selectedIndex: cubit.selectedIndex,
                          ),
                          HomeItemsView(
                            products: cubit.selectedProductsCategory,
                            chart: cubit.chart,
                            favourite: cubit.favourite,
                            toggleFavourite: cubit.toggleFavourite,
                            toggleChart: cubit.toggleChart,
                          ),
                        ],
                      )
                    : const Center(
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: CircularProgressIndicator(
                            color: AppColor.black,
                            strokeWidth: 7,
                          ),
                        ),
                      ),
              ),
            ],
          ),
          floatingActionButton: cubit.products.isNotEmpty
              ? const HomeFloatActionButtonView()
              : null,
          floatingActionButtonLocation: cubit.products.isNotEmpty
              ? FloatingActionButtonLocation.centerDocked
              : null,
          bottomNavigationBar: cubit.products.isNotEmpty
              ? const HomeBottomNavigationBar()
              : null,
        );
      },
    );
  }
}
