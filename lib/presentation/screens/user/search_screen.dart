import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/custom_back_button_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/products_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text_form_field.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final search = TextEditingController();
  bool clear = false;
  List<ProductModel> searchResult = [];

  @override
  void initState() {
    super.initState();
    searchResult.addAll(GlobalCubit.get(context).products);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (_, state) {
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
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            const CustomBackButtonView(),
                            Expanded(
                              child: CustomTextFormField(
                                onChanged: (val) {
                                  setState(() {
                                    searchResult.clear();
                                    searchResult.addAll(
                                      cubit.products.where(
                                        (element) =>
                                            element.name.toLowerCase().contains(
                                                  val.toLowerCase(),
                                                ),
                                      ),
                                    );
                                    if (val.isNotEmpty) {
                                      clear = true;
                                    } else {
                                      clear = false;
                                    }
                                  });
                                },
                                height: 50,
                                hint: 'Search',
                                fontSize: 17,
                                textAlignVertical: TextAlignVertical.center,
                                suffix: clear
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            search.clear();
                                            clear = false;
                                            searchResult.clear();
                                            searchResult.addAll(cubit.products);
                                          });
                                        },
                                        icon: const Icon(Icons.close),
                                        iconSize: 25,
                                        color: AppColor.black,
                                      )
                                    : null,
                                prefix: const Icon(
                                  Icons.search,
                                  size: 25,
                                  color: AppColor.black,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                controller: search,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (75 / screenHeight) * context.screenHeight,
                    ),
                    Expanded(
                      child: searchResult.isNotEmpty
                          ? ProductsView(
                              products: searchResult,
                              cart: cubit.chart,
                              favourite: cubit.favourite,
                              toggleChart: cubit.toggleChart,
                              toggleFavourite: cubit.toggleFavourite,
                            )
                          : Column(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.search_off,
                                        size: 100,
                                        color: AppColor.white,
                                      ),
                                      CustomText(
                                        text:
                                            'No Products With Specified Name.',
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
