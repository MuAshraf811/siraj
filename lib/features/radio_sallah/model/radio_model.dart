class RadioModel {
  final int id;
  final String name;
  final String image;
  final String url;

  RadioModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.url});
  factory RadioModel.fromJson(Map<String, dynamic> res) {
    return RadioModel(
      id: res['id'],
      name: res['name'],
      image: res['img'],
      url: res['url'],
    );
  }
}
