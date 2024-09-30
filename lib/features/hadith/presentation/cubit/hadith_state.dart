part of 'hadith_cubit.dart';

@immutable
sealed class HadithState {}

final class HadithInitial extends HadithState {}

final class NawawyLoadingState extends HadithState {}

final class NawawyLoadedState extends HadithState {}

final class LoadingHadithState extends HadithState {}

final class HadithSuccessState extends HadithState {}

final class HadithErrorState extends HadithState {
  final String error;

  HadithErrorState({required this.error});
}

final class FetchingHadithBooksState extends HadithState {}

final class FetchingHadithBooksSuccessState extends HadithState {}

final class FetchingHadithBooksErrorState extends HadithState {
  final String error;

  FetchingHadithBooksErrorState({required this.error});
}

final class PaginationState extends HadithState {}

final class ReadyPaginationState extends HadithState {}

final class ErrorPaginationState extends HadithState {}
