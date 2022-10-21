import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/view/custom_back_button_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_desc_item_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_image_view.dart';
import 'package:magdsoft_flutter_structure/presentation/view/products_image_list_view.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/gradient_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/gradient_icon.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = GlobalCubit.get(context);
        final isChart =
            cubit.chart.any((element) => element.id == widget.product.id);
        return Scaffold(
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
              const Positioned(
                top: 50,
                left: 23,
                child: CustomBackButtonView(),
              ),
              Positioned(
                top: 116,
                bottom: 0,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                          bottom: 6,
                          right: 23,
                        ),
                        child: CustomText(
                          text: widget.product.name,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                          bottom: 16,
                          right: 23,
                        ),
                        child: CustomText(
                          text: 'Type:${widget.product.type}',
                          fontSize: 15,
                          color: AppColor.white,
                        ),
                      ),
                      ProductImageView(
                        image: widget.product.image,
                        tag: 'product_tag_${widget.product.id}',
                      ),
                      const ProductImageListView(),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 33,
                          right: 33,
                          bottom: 34,
                        ),
                        width: context.screenWidth - 66,
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.blackShadow,
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white2,
                              ),
                              padding: const EdgeInsets.only(
                                left: 6,
                                top: 5,
                                bottom: 5,
                              ),
                              child: Image.asset('assets/images/pro_acer.png'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CustomText(
                                  text: 'Acer Official Store',
                                  fontSize: 17,
                                  color: AppColor.subtitleColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  text: 'View Store',
                                  fontSize: 12,
                                  color: AppColor.lightGrey,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.white2,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColor.blackShadow,
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: GradientIcon(
                                    icon: Icons.arrow_forward_ios,
                                    size: 20,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColor.primary,
                                        AppColor.primary.withOpacity(0),
                                      ],
                                      stops: const [
                                        5.42,
                                        184.06,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 21,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 33,
                          right: 33,
                          bottom: (37 / screenHeight) * context.screenHeight,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Price',
                                  fontSize: 16,
                                  color: AppColor.lightGrey,
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                CustomText(
                                  text: '${widget.product.price} EGP',
                                  fontSize: 18,
                                  color: AppColor.subtitleColor,
                                ),
                              ],
                            ),
                            CustomButton(
                              text:
                                  isChart ? 'Remove From Cart' : 'Add To Cart',
                              onTap: () => cubit.toggleChart(widget.product),
                              height: 44,
                              width: (208 / screenWidth) * screenWidth,
                              borderRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          right: 58,
                          left: 57,
                        ),
                        margin: EdgeInsets.only(
                          bottom: (30 / screenHeight) * context.screenHeight,
                        ),
                        width: context.screenWidth,
                        child: const Divider(
                          thickness: 1,
                          color: AppColor.lightGrey,
                        ),
                      ),
                      Container(
                        width: context.screenWidth,
                        padding: const EdgeInsets.symmetric(horizontal: 33),
                        margin: EdgeInsets.only(
                          bottom: (50 / screenHeight) * context.screenHeight,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ProductDescItemView(
                              current: selectedIndex == 0,
                              text: 'Overview',
                              onTap: () => setState(() {
                                selectedIndex = 0;
                              }),
                            ),
                            ProductDescItemView(
                              current: selectedIndex == 1,
                              text: 'Specification',
                              onTap: () => setState(() {
                                selectedIndex = 1;
                              }),
                            ),
                            ProductDescItemView(
                              current: selectedIndex == 2,
                              text: 'Review',
                              onTap: () => setState(() {
                                selectedIndex = 2;
                              }),
                            ),
                          ],
                        ),
                      ),
                      if (selectedIndex == 0)
                        Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.only(
                            left: 33,
                            right: 36,
                          ),
                          child: CustomText(
                            text: widget.product.desc,
                            textAlign: TextAlign.start,
                            fontSize: 16,
                            color: AppColor.lightGrey,
                          ),
                        ),
                      if (selectedIndex == 1)
                        Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.only(
                            left: 33,
                            right: 36,
                          ),
                        ),
                      if (selectedIndex == 2)
                        Container(
                          width: context.screenWidth,
                          padding: const EdgeInsets.only(
                            left: 33,
                            right: 36,
                          ),
                        ),
                      SizedBox(
                        height: (408 / screenWidth) * context.screenWidth,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
