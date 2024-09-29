class SurahModel {
  final int surahOrder;
  final String surahArabicName;
  final String surahEnglishName;
  final int ayahsNumber;
  final String englishTranslationName;
  final String type;

  SurahModel({
    required this.surahOrder,
    required this.surahArabicName,
    required this.surahEnglishName,
    required this.ayahsNumber,
    required this.englishTranslationName,
    required this.type,
  });

  factory SurahModel.fromJson(Map<String, dynamic> response) {
    return SurahModel(
      surahOrder: response["number"],
      surahArabicName: response["name"] ?? "غير معروف",
      surahEnglishName: response["englishName"] ?? "UnKnown",
      ayahsNumber: response["numberOfAyahs"],
      englishTranslationName: response['englishNameTranslation'] ?? "UnKnown",
      type: response["revelationType"] ?? "UnKnown",
    );
  }
}
