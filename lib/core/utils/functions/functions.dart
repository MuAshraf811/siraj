import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/features/radio_sallah/model/prey_times_model2.dart';

import '../../controllers/theme/theme_cubit.dart';
import '../constants/app_colors.dart';

int goToSpacificSurahDependOnItsOrder(int index) {
  return switch (index) {
    0 => 0,
    1 => 1,
    2 => 49,
    3 => 76,
    4 => 105,
    5 => 127,
    6 => 150,
    7 => 176,
    8 => 186,
    9 => 207,
    10 => 220,
    11 => 234,
    12 => 248,
    13 => 254,
    14 => 261,
    15 => 266,
    16 => 281,
    17 => 292,
    18 => 304,
    19 => 311,
    20 => 321,
    21 => 331,
    22 => 341,
    23 => 349,
    24 => 358,
    25 => 366,
    26 => 376,
    27 => 384,
    28 => 395,
    29 => 403,
    30 => 410,
    31 => 414,
    32 => 417,
    33 => 427,
    34 => 433,
    35 => 439,
    36 => 445,
    37 => 452,
    38 => 457,
    39 => 466,
    40 => 476,
    41 => 482,
    42 => 488,
    43 => 495,
    44 => 498,
    45 => 501,
    46 => 506,
    47 => 510,
    48 => 514,
    49 => 517,
    50 => 519,
    51 => 522,
    52 => 525,
    53 => 527,
    54 => 530,
    55 => 533,
    56 => 536,
    57 => 541,
    58 => 544,
    59 => 548,
    60 => 550,
    61 => 552,
    62 => 553,
    63 => 555,
    64 => 557,
    65 => 559,
    66 => 561,
    67 => 563,
    68 => 665,
    69 => 567,
    70 => 569,
    71 => 571,
    72 => 573,
    73 => 574,
    74 => 576,
    75 => 577,
    76 => 579,
    77 => 581,
    78 => 582,
    79 => 584,
    80 => 585,
    81 => 586,
    82 => 586,
    83 => 588,
    84 => 589,
    85 => 590,
    86 => 590,
    87 => 591,
    88 => 592,
    89 => 593,
    90 => 594,
    91 => 594,
    92 => 595,
    93 => 595,
    94 => 596,
    95 => 596,
    96 => 597,
    97 => 597,
    98 => 598,
    99 => 598,
    100 => 599,
    101 => 599,
    102 => 600,
    103 => 600,
    104 => 600,
    105 => 601,
    106 => 601,
    107 => 601,
    108 => 602,
    109 => 602,
    110 => 602,
    111 => 603,
    112 => 603,
    113 => 603,
    int() => 2,
  };
}

String getCurrentDate() {
  final date = DateTime.now();
  final String day = date.day.toString().padLeft(2, '0');
  final String month = date.month.toString().padLeft(2, '0');
  final String year = date.year.toString();
  return "$day-$month-$year";
}

Color getthemecolor(BuildContext context) {
  return context.read<ThemeCubit>().state == 0
      ? AppColors.primary
      : AppColors.white;
}

String getWeekDayByItsOrder(int weekDay) {
  switch (weekDay) {
    case 1:
      return "الأحد";
    case 2:
      return "الأثنين";
    case 3:
      return "الثلاثاء";
    case 4:
      return "الأربعاء";
    case 5:
      return "الخميس";
    case 6:
      return "الجمعة";
    case 7:
      return "السبت";

    default:
      return "حدث خطأ ما ";
  }
}

String getMonthByItsOrder(int month) {
  switch (month) {
    case 1:
      return "يناير";
    case 2:
      return "فبراير";
    case 3:
      return "مارس";
    case 4:
      return "أبريل";
    case 5:
      return "مايو";
    case 6:
      return "يونيو";
    case 7:
      return "يوليو";
    case 8:
      return "أغسطس";
    case 9:
      return "سبتمبر";
    case 10:
      return "أكتوبر";
    case 11:
      return "نوفمبر";
    case 12:
      return "ديسمبر";

    default:
      return "حدث خطأ ما ";
  }
}

String translateHadithName(String name) {
  switch (name) {
    case "abu-daud":
      return 'سنن أبي داود';
    case "ahmad":
      return 'سنن أحمد';
    case "bukhari":
      return 'سنن البخاري';
    case "darimi":
      return 'سنن الدرامي';
    case "ibnu-majah":
      return 'سنن ابن ماجه';
    case "malik":
      return 'سنن مالك';
    case "muslim":
      return 'سنن مسلم';
    case "nasai":
      return 'سنن النسائي';
    case "tirmidzi":
      return 'سنن الترمزي';
    default:
      return 'حدث خطأ ما';
  }
}

List<String> getCurrentAndNextPrey(
    int currenthour, PreyTimesModelTwo sallahTimings) {
  if (currenthour > 5 && currenthour < 12) {
    return [sallahTimings.dhuhr, sallahTimings.asr];
  }
  if (currenthour > 1 && currenthour < 16) {
    return [sallahTimings.asr, sallahTimings.maghrib];
  }
  if (currenthour > 16 && currenthour <= 18) {
    return [sallahTimings.maghrib, sallahTimings.isha];
  }
  if (currenthour > 18 && currenthour < 20) {
    return [sallahTimings.isha, sallahTimings.fajr];
  }

  return [sallahTimings.fajr, sallahTimings.dhuhr];
}
