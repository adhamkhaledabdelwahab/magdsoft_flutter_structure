class LoginResponse {
  final int status;
  final String message;
  final String? code;

  const LoginResponse({
    required this.status,
    required this.message,
    required this.code,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      code: json['code'],
    );
  }
}
