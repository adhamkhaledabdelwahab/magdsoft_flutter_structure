class HelpModel {
  final int id;
  final String question;
  final String answer;

  const HelpModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
    };
  }

  static List<HelpModel> fromJsonList(List<dynamic> list) {
    final result = <HelpModel>[];
    for (var e in list) {
      final element = e as Map<String, dynamic>;
      final product = HelpModel.fromJson(element);
      result.add(product);
    }
    return result;
  }

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }
}
