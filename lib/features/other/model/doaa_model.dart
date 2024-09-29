class DoaaModel {
  final String text;

  DoaaModel({required this.text});

  factory DoaaModel.fromJson(Map<String, dynamic> res) {
    return DoaaModel(text: res["text"] ?? "");
  }
}
