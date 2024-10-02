import '../../../core/networking/dio_intializer.dart';

class PrayTimesCall {
  PrayTimesCall._();

  static Future<List<dynamic>> getMonthPreyTimesByDateAndLocation(
      {required String city, required String country}) async {
    final obj = DioIntializer.init();
    final res = await obj.get(
      'https://api.aladhan.com/v1/calendarByCity/2024/10',
      queryParameters: {"city": city, "country": country},
    );
    if (res.statusCode == 200) {
      return res.data["data"];
    }
    throw Exception('Something went wrong while fetching pray times');
  }
}
