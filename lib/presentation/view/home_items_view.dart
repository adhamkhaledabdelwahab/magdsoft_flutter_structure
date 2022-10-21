import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_text.dart';

class HomeItemsView extends StatelessWidget {
  const HomeItemsView({
    Key? key,
    required this.products,
    required this.chart,
    required this.favourite,
    required this.toggleFavourite,
    required this.toggleChart,
  }) : super(key: key);

  final List<ProductModel> products;
  final List<ProductModel> chart;
  final List<ProductModel> favourite;
  final Function(ProductModel product) toggleFavourite;
  final Function(ProductModel product) toggleChart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 5,
        ),
        child: MasonryGridView.count(
          physics: const BouncingScrollPhysics(),
          itemCount: products.length + 1,
          padding: const EdgeInsets.all(10),
          crossAxisCount: 2,
          mainAxisSpacing: (27 / screenHeight) * context.screenHeight,
          crossAxisSpacing: (39 / screenWidth) * context.screenWidth,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const CustomText(
                text: 'Recommended for You',
                fontSize: 28,
                color: Colors.black,
              );
            }
            return Directionality(
              textDirection: TextDirection.ltr,
              child: ProductCard(
                id: products[index - 1].id,
                image: products[index - 1].image,
                isFav: favourite
                    .any((element) => element.id == products[index - 1].id),
                isChart: chart
                    .any((element) => element.id == products[index - 1].id),
                title: products[index - 1].name,
                desc: products[index - 1].type,
                price: '${products[index - 1].price} EGP',
                onTap: () => Navigator.pushNamed(
                  context,
                  productScreenRouteName,
                  arguments: products[index - 1],
                ),
                onAddToChart: () => toggleChart(products[index - 1]),
                onAddToFav: () => toggleFavourite(products[index - 1]),
              ),
            );
          },
        ),
      ),
    );
  }
}
