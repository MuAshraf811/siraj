part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class RandomZekrState extends HomeState {}

final class RandomZekrSuccessState extends HomeState {}

final class RandomZekrErrorState extends HomeState {
  final String error;

  RandomZekrErrorState({required this.error});
}

final class ShareRandomZekrSuccessState extends HomeState {}

final class ShareRandomZekrState extends HomeState {}

final class RandomDoaaState extends HomeState {}

final class RandomDoaaSuccessState extends HomeState {}

final class RandomDoaaErrorState extends HomeState {
  final String error;

  RandomDoaaErrorState({required this.error});
}

final class RandomAsmState extends HomeState {}

final class RandomAsmSuccessState extends HomeState {}

final class RandomAsmErrorState extends HomeState {
  final String error;

  RandomAsmErrorState({required this.error});
}
