import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.isFav,
    required this.title,
    required this.desc,
    required this.price,
    required this.onTap,
    required this.onAddToChart,
    required this.onAddToFav,
    required this.id,
    required this.isChart,
  }) : super(key: key);

  final int id;
  final String image;
  final bool isFav;
  final String title;
  final String desc;
  final String price;
  final Function() onTap;
  final Function() onAddToChart;
  final Function() onAddToFav;
  final bool isChart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 239,
      width: 168,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColor.blackShadow,
            spreadRadius: 5,
            blurRadius: 8,
            offset: Offset(2, 2),
          )
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 9),
                      child: Ink(
                        width: double.infinity,
                        height: 142,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColor.blackShadow,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            )
                          ],
                        ),
                        child: Center(
                          child: Hero(
                            tag: 'product_tag_$id',
                            child: Image.network(
                              image,
                              fit: BoxFit.cover,
                              width: 144,
                              height: 114,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12.23,
                      right: 13.78,
                      child: InkWell(
                        onTap: onAddToFav,
                        child: Image.asset(
                          'assets/images/fav_$isFav.png',
                          width: 19.86,
                          height: 18.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    bottom: 3,
                  ),
                  child: CustomText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: title,
                    fontSize: 18,
                    textAlign: TextAlign.start,
                    color: AppColor.primary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9, bottom: 8),
                  child: CustomText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: desc,
                    fontSize: 12,
                    textAlign: TextAlign.start,
                    color: AppColor.subtitleColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: price,
                        fontSize: 10,
                        color: AppColor.subtitleColor,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(0, 98, 189, 1),
                              Color.fromRGBO(0, 98, 189, 0),
                            ],
                            stops: [
                              5.42,
                              184.06,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.zero,
                            bottomLeft: Radius.zero,
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: onAddToChart,
                            child: Center(
                              child: Icon(
                                isChart ? Icons.remove : Icons.add,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
