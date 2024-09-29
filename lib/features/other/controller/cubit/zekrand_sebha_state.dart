part of 'zekrand_sebha_cubit.dart';

@immutable
sealed class ZekrandSebhaState {}

final class ZekrandSebhaInitial extends ZekrandSebhaState {}

final class InitializingAzkarState extends ZekrandSebhaState {}

final class InitializingAzkarSuccessState extends ZekrandSebhaState {}

final class InitializingAzkarErrorState extends ZekrandSebhaState {
  final String error;

  InitializingAzkarErrorState({required this.error});
}

final class DetailedAzkarState extends ZekrandSebhaState {}

final class DetailedAzkarSuccessState extends ZekrandSebhaState {}

final class AsmaaAllahLoadedState extends ZekrandSebhaState {}

final class AsmaaAllahLoadingState extends ZekrandSebhaState {}

final class DoaaLoadingState extends ZekrandSebhaState {}

final class DoaaLoadedState extends ZekrandSebhaState {}
