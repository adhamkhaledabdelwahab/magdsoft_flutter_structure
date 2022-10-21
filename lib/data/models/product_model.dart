class ProductModel {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String desc;

  const ProductModel({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.desc,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company': company,
      'name': name,
      'type': type,
      'price': price,
      'image': image,
      'description': desc,
    };
  }

  static List<ProductModel> fromJsonList(List<dynamic> list) {
    final result = <ProductModel>[];
    for (var e in list) {
      final element = e as Map<String, dynamic>;
      final product = ProductModel.fromJson(element);
      result.add(product);
    }
    return result;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      company: json['company'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      image: json['image'],
      desc: json['description'],
    );
  }
}
