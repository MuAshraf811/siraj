class AzkarModel {
  final int id;
  final String category;

  AzkarModel({
    required this.id,
    required this.category,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> res) {
    return AzkarModel(id: res["id"], category: res["category"]);
  }
}

class InnerAzkar {
  final int count;
  final String text;

  InnerAzkar({
    required this.count,
    required this.text,
  });

  factory InnerAzkar.fromJson(Map<String, dynamic> res) {
    return InnerAzkar(count: res["count"], text: res["text"]);
  }
}
