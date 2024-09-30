class HadithBooksModel {
  final String name;
  final String id;
  final int available;

  HadithBooksModel({
    required this.name,
    required this.id,
    required this.available,
  });

  factory HadithBooksModel.fromJson(Map<String, dynamic> json) {
    return HadithBooksModel(
      name: json["name"],
      id: json["id"],
      available: json["available"],
    );
  }
}

class HadithModel {
  final int number;
  final String arab;

  HadithModel({required this.number, required this.arab});

  factory HadithModel.fromJson(Map<String, dynamic> res) {
    return HadithModel(
      number: res["number"],
      arab: res["arab"],
    );
  }
}
