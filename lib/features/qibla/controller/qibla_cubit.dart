import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/location_service.dart';

part 'qibla_state.dart';

class QiblaCubit extends Cubit<QiblaState> {
  QiblaCubit() : super(QiblaInitial());
  LocationModel? currentLocation;
  gitLocation() async {
    try {
      emit(LoadingQiblaInfoState());
      await LocationService.handlePermission();
      LocationService.locationStream.listen((location) {
        currentLocation = location;
      });
      emit(LoadedQiblaInfoState());
    } catch (e) {
      log("*************");
      log(e.toString());
      emit(
        QiblaInfoErrorState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
