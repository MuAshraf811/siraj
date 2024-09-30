// ignore_for_file: non_constant_identifier_names

class NawawyModel {
  final String text;
  final String id_ar;
  final String topic;
  final String rawi;
  final String description;

  NawawyModel({
    required this.text,
    required this.id_ar,
    required this.topic,
    required this.rawi,
    required this.description,
  });
  factory NawawyModel.fromJson(Map<String, dynamic> res) {
    return NawawyModel(
      text: res["text"],
      id_ar: res["id_ar"],
      topic: res["topic"],
      rawi: res["rawi"],
      description: res["description"],
    );
  }
}
