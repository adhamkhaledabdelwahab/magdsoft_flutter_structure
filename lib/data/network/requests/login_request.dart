class LoginRequest {
  final String phone;
  final String name;

  const LoginRequest({
    required this.phone,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
    };
  }
}
