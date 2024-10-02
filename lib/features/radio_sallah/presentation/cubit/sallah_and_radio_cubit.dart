import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/features/radio_sallah/data/pray_time.dart';

import '../../data/radio.dart';
import '../../model/prey_times_model2.dart';
import '../../model/radio_model.dart';

part 'sallah_and_radio_state.dart';

class SallahAndRadioCubit extends Cubit<SallahAndRadioState> {
  late List<PreyTimesModelTwo> allPreyTimes;
  late List<RadioModel> radioChannels;
  SallahAndRadioCubit() : super(SallahAndRadioInitial());
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
