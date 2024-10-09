class QuranModel {
  final String ayahText;
  final int numberInSurah;
  final int page;
  final int juzaa;

  QuranModel(
      {required this.ayahText,
      required this.numberInSurah,
      required this.page,
      required this.juzaa});

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      ayahText: json["text"],
      numberInSurah: json["numberInSurah"],
      page: json["page"],
      juzaa: json["juz"],
    );
  }
}

class SurahJsonModel {
  final String name;
  final List<QuranModel> allAyahInSurah;

  SurahJsonModel({required this.name, required this.allAyahInSurah});
  factory SurahJsonModel.fromJson(Map<String, dynamic> res) {
    return SurahJsonModel(
        name: res["name"],
        allAyahInSurah:
            (res["ayahs"] as List).map((e) => QuranModel.fromJson(e)).toList());
  }
}
