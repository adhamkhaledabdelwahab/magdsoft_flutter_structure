class AccountModel {
  final int id;
  final String name;
  final String phone;

  const AccountModel({
    required this.id,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
