part of 'quran_cubit.dart';

@immutable
sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class ListingSurahsState extends QuranState {}

final class ListingSurahsErrorState extends QuranState {}

final class ListingSurahsSuccessState extends QuranState {}

final class FilteringSurah extends QuranState {}

final class FilteredSurah extends QuranState {}

final class LoadingAyahsState extends QuranState {}

final class LoadedAyahsState extends QuranState {}

final class ErrorAyahsState extends QuranState {
  final String error;

  ErrorAyahsState({required this.error});
}
