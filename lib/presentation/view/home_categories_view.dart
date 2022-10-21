import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/presentation/view/products_category_item_view.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class HomeCategoriesView extends StatelessWidget {
  const HomeCategoriesView({
    Key? key,
    required this.categories,
    required this.onChange,
    required this.selectedIndex,
  }) : super(key: key);

  final List<String> categories;
  final Function(int index) onChange;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final categoriesImages = [
      Image.asset(
        'assets/images/all.png',
        width: 28,
        height: 28,
      ),
      Image.asset(
        'assets/images/acer.png',
        width: 21,
        height: 28,
      ),
      Image.asset(
        'assets/images/razer.png',
        width: 49,
        height: 28,
      ),
      Image.asset(
        'assets/images/apple.png',
        width: 23,
        height: 27,
      ),
    ];
    return Container(
      height: (92 / screenHeight) * context.screenHeight,
      margin: const EdgeInsets.only(
        left: 15,
        right: 11,
        bottom: 10,
      ),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => ProductsCategoryItemView(
          selected: selectedIndex == index,
          onChange: onChange,
          index: index,
          image: categoriesImages[index],
          text: categories[index],
        ),
        separatorBuilder: (_, index) => const SizedBox(
          width: 25,
        ),
        itemCount: 4,
      ),
    );
  }
}
