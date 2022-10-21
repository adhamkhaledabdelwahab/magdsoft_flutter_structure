import 'package:magdsoft_flutter_structure/data/models/account_model.dart';

class VerifyResponse {
  final int status;
  final String message;
  final AccountModel? accountModel;

  const VerifyResponse({
    required this.status,
    required this.message,
    required this.accountModel,
  });

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      status: json['status'],
      message: json['message'],
      accountModel: json['account'] != null
          ? AccountModel.fromJson(json['account'])
          : null,
    );
  }
}
