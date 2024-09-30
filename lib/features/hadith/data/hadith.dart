import 'dart:developer';

import '../../../core/networking/dio_intializer.dart';
import '../../../core/networking/endpoints_constants.dart';

class HadithBooksFetcher {
  HadithBooksFetcher._();

  static Future<List<dynamic>> fetchAllHadithBooks() async {
    final instance = DioIntializer.init();
    final response = await instance.get(EndPoinds.allHadithBooks);

    if (response.statusCode == 200) {
      try {
        final res = response.data;

        return res["data"];
      } catch (e) {
        log("message");
        log(e.toString());
      }
    }
    throw Exception("Some thing went wrong in hadith fetcher");
  }

  static Future<List<dynamic>> fetchHadithBook({
    required String book,
    required int from,
    required int to,
  }) async {
    final instance = DioIntializer.init();
    final response = await instance
        .get('https://api.hadith.gading.dev/books/$book?range=$from-$to');

    if (response.statusCode == 200) {
      return response.data["data"]["hadiths"];
    }
    throw Exception("Some thing went wrong in hadith fetcher");
  }
}
