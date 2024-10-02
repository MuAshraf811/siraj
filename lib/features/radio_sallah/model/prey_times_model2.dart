class PreyTimesModelTwo {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String date;
  final String hijiriDate;
  final String weekDay;

  PreyTimesModelTwo({
    required this.fajr,
    required this.weekDay,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.date,
    required this.hijiriDate,
  });

  factory PreyTimesModelTwo.fromjson(Map<String, dynamic> json) {
    return PreyTimesModelTwo(
      weekDay: json["date"]["hijri"]["weekday"]["ar"],
      fajr: json["timings"]["Fajr"],
      dhuhr: json["timings"]["Dhuhr"],
      asr: json["timings"]["Asr"],
      maghrib: json["timings"]["Maghrib"],
      isha: json["timings"]["Isha"],
      date: json["date"]["gregorian"]["date"],
      hijiriDate: json["date"]["hijri"]["date"],
    );
  }
}
