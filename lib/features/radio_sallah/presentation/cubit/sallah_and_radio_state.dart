part of 'sallah_and_radio_cubit.dart';

@immutable
sealed class SallahAndRadioState {}

final class SallahAndRadioInitial extends SallahAndRadioState {}

final class FetchingPreyTimeState extends SallahAndRadioState {}

final class FetchingPreyTimeSuccessState extends SallahAndRadioState {}

final class FetchingPreyTimeErrorState extends SallahAndRadioState {
  final String error;

  FetchingPreyTimeErrorState({required this.error});
}

final class GettingRadioState extends SallahAndRadioState {}

final class RadioSuccessState extends SallahAndRadioState {}

final class RadioErrorState extends SallahAndRadioState {
  final String error;

  RadioErrorState({required this.error});
}

final class GettingPreyTimeAtSigleDayState extends SallahAndRadioState {}

final class GettingPreyTimeAtSigleDaySuccessState extends SallahAndRadioState {}

final class GettingPreyTimeAtSigleDayErrorState extends SallahAndRadioState {
  final String error;

  GettingPreyTimeAtSigleDayErrorState({required this.error});
}
