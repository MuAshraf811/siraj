import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/core/utils/functions/functions.dart';
import 'package:siraj/features/radio_sallah/data/pray_time.dart';

import '../../data/radio.dart';
import '../../model/prey_times_model2.dart';
import '../../model/radio_model.dart';

part 'sallah_and_radio_state.dart';

class SallahAndRadioCubit extends Cubit<SallahAndRadioState> {
  late List<PreyTimesModelTwo> allPreyTimes;
  late List<String> preyTimeAtSingelDay;
  late List<String> listDateAtSingleDay;
  late List<RadioModel> radioChannels;
  SallahAndRadioCubit() : super(SallahAndRadioInitial());

  getPreyTimesAtCertinDay() async {
    try {
      emit(GettingPreyTimeAtSigleDayState());
      final result = await PrayTimesCall.getMonthPreyTimesByDateAndLocation(
          city: "cairo", country: "egypt");
      allPreyTimes = result
          .map(
            (e) => PreyTimesModelTwo.fromjson(e),
          )
          .toList();
      final res = allPreyTimes.firstWhere(
        (element) => element.date == getCurrentDate(),
      );
      preyTimeAtSingelDay = [
        res.fajr,
        res.dhuhr,
        res.asr,
        res.maghrib,
        res.isha
      ];
      listDateAtSingleDay = [
        res.hijiriDate.substring(0, 2),
        res.date,
        res.monthDay
      ];
      emit(GettingPreyTimeAtSigleDaySuccessState());
    } catch (e) {
      log(e.toString());
      emit(GettingPreyTimeAtSigleDayErrorState(error: e.toString()));
    }
  }

  void handleRadio() async {
    try {
      emit(GettingRadioState());
      final res = await RadioManager.getallRadioChannel();
      radioChannels = res
          .map(
            (e) => RadioModel.fromJson(e),
          )
          .toList();
      emit(RadioSuccessState());
    } catch (e) {
      emit(RadioErrorState(error: e.toString()));
    }
  }

  void getAllPreyTime() async {
    try {
      emit(FetchingPreyTimeState());
      // final myLocation = await LocationHandler.getuserCurrentLocation();
      final result = await PrayTimesCall.getMonthPreyTimesByDateAndLocation(
          city: "cairo", country: "egypt");
      allPreyTimes = result
          .map(
            (e) => PreyTimesModelTwo.fromjson(e),
          )
          .toList();
      emit(FetchingPreyTimeSuccessState());
    } catch (e) {
      emit(FetchingPreyTimeErrorState(error: e.toString()));
    }
  }
}
