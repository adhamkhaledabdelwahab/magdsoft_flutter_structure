class VerifyRequest {
  final String code;
  final String phone;

  const VerifyRequest({
    required this.code,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'phone': phone,
    };
  }
}
