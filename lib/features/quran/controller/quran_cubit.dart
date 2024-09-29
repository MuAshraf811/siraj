import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/features/quran/data/surah_model.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  late List<SurahModel> allSurahs;
  List<SurahModel> filteredSurahs = [];
  QuranCubit() : super(QuranInitial());
  String removeArabicDiacritics(String text) {
    final diacriticRegex = RegExp(
      r'[\u064B-\u0652]',
      multiLine: true,
    );
    return text.replaceAll(diacriticRegex, '');
  }

  void filterSurahsOnSearch(String query) {
    if (query.isEmpty) {
      filteredSurahs = List.from(allSurahs);
    } else {
      filteredSurahs = allSurahs.where((surah) {
        final normalizedSurahName =
            removeArabicDiacritics(surah.surahArabicName);
        final normalizedQuery = removeArabicDiacritics(query);

        return normalizedSurahName.contains(normalizedQuery);
      }).toList();
    }
  }

  void loadSurah() async {
    try {
      emit(ListingSurahsState());
      final res = await rootBundle.loadString("assets/jsons/surah.json");
      final response = jsonDecode(res);
      final List beforeMapping = response["data"];
      allSurahs = beforeMapping
          .map(
            (e) => SurahModel.fromJson(e),
          )
          .toList();
      emit(ListingSurahsSuccessState());
    } catch (e) {
      debugPrint(e.toString());
      emit(ListingSurahsErrorState());
    }
  }
}
