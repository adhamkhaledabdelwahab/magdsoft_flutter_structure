import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

class ProductsResponse {
  final int status;
  final String message;
  final List<ProductModel> products;

  const ProductsResponse({
    required this.status,
    required this.message,
    required this.products,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      status: json['status'],
      message: json['message'],
      products: ProductModel.fromJsonList(json['products']),
    );
  }
}
