import 'package:magdsoft_flutter_structure/data/models/help_model.dart';

class HelpResponse {
  final int status;
  final String message;
  final List<HelpModel> help;

  const HelpResponse({
    required this.status,
    required this.message,
    required this.help,
  });

  factory HelpResponse.fromJson(Map<String, dynamic> json) {
    return HelpResponse(
      status: json['status'],
      message: json['message'],
      help: HelpModel.fromJsonList(json['help']),
    );
  }
}
