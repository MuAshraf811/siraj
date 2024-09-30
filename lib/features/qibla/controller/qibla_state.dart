part of 'qibla_cubit.dart';

@immutable
sealed class QiblaState {}

final class QiblaInitial extends QiblaState {}

final class LoadingQiblaInfoState extends QiblaState {}

final class LoadedQiblaInfoState extends QiblaState {}

final class QiblaInfoErrorState extends QiblaState {
  final String errorMessage;

  QiblaInfoErrorState({required this.errorMessage});
}
