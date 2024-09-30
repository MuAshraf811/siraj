import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/hadith.dart';
import '../../model/hadith_books_model.dart';
import '../../model/nawawy_model.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  late List<HadithModel> hadith;
  late List<HadithBooksModel> hadithBooks;
  late List<NawawyModel> nawawy;
  int from = 1;
  bool isLoading = false;
  int to = 15;
  final ScrollController scrollController = ScrollController();
  HadithCubit() : super(HadithInitial());

  void watchHadithPagination(String book) {
    scrollController.addListener(
      () async {
        try {
          if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
            isLoading = true;
            emit(PaginationState());
            from = to + 1;
            to += 15;
            final res = await HadithBooksFetcher.fetchHadithBook(
                book: book, from: from, to: to);
            final data = res
                .map(
                  (e) => HadithModel.fromJson(e),
                )
                .toList();

            hadith = [...hadith, ...data];
            emit(ReadyPaginationState());
          }
        } catch (e) {
          emit(ErrorPaginationState());
        } finally {
          isLoading = false;
        }
      },
    );
  }

  void getNaway() async {
    try {
      emit(NawawyLoadingState());

      final data = await rootBundle.loadString("assets/jsons/hadith_40.json");

      final List<dynamic> res = jsonDecode(data);

      nawawy = res
          .map(
            (e) => NawawyModel.fromJson(e),
          )
          .toList();

      emit(NawawyLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getHadiths(String book) async {
    try {
      emit(LoadingHadithState());
      final res = await HadithBooksFetcher.fetchHadithBook(
        book: book,
        from: from,
        to: to,
      );
      hadith = res
          .map(
            (e) => HadithModel.fromJson(e),
          )
          .toList();

      emit(HadithSuccessState());
    } catch (e) {
      emit(HadithErrorState(error: e.toString()));
    }
  }

  void getAllHAdithBooks() async {
    try {
      emit(FetchingHadithBooksState());
      final res = await HadithBooksFetcher.fetchAllHadithBooks();
      hadithBooks = res
          .map(
            (e) => HadithBooksModel.fromJson(e),
          )
          .toList();

      emit(FetchingHadithBooksSuccessState());
    } catch (e) {
      emit(FetchingHadithBooksErrorState(error: e.toString()));
    }
  }
}
