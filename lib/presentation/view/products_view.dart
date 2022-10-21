import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure/constants/app_screen_resolutions.dart';
import 'package:magdsoft_flutter_structure/constants/routes.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/presentation/view/product_card.dart';
import 'package:magdsoft_flutter_structure/utils/media_query.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    Key? key,
    required this.products,
    required this.cart,
    required this.favourite,
    required this.toggleChart,
    required this.toggleFavourite,
  }) : super(key: key);

  final List<ProductModel> products;
  final List<ProductModel> cart;
  final List<ProductModel> favourite;
  final Function(ProductModel product) toggleChart;
  final Function(ProductModel product) toggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 5,
      ),
      child: MasonryGridView.count(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        mainAxisSpacing: (27 / screenHeight) * context.screenHeight,
        crossAxisSpacing: (39 / screenWidth) * context.screenWidth,
        itemBuilder: (BuildContext context, int index) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: ProductCard(
              id: products[index].id,
              image: products[index].image,
              isFav:
                  favourite.any((element) => element.id == products[index].id),
              isChart: cart.any((element) => element.id == products[index].id),
              title: products[index].name,
              desc: products[index].type,
              price: '${products[index].price} EGP',
              onTap: () => Navigator.pushNamed(
                context,
                productScreenRouteName,
                arguments: products[index],
              ),
              onAddToChart: () => toggleChart(products[index]),
              onAddToFav: () => toggleFavourite(products[index]),
            ),
          );
        },
      ),
    );
  }
}
