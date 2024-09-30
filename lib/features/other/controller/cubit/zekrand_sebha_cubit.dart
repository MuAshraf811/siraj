import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/asmaa_allah_model.dart';
import '../../model/azkar_model.dart';
import '../../model/doaa_model.dart';
part 'zekrand_sebha_state.dart';

class ZekrandSebhaCubit extends Cubit<ZekrandSebhaState> {
  late List<AzkarModel> azkrMOdel;
  List<InnerAzkar>? someZekr;
  late List<AzkarModel> filteredZekr;
  String? someZekrCategoryName;
  DoaaModel? somedoaa;
  AsmaaAllahModel? someName;
  late String randomZekeText;
  late List<AsmaaAllahModel> asmaaAllah;
  late List<DoaaModel> doaa;
  ZekrandSebhaCubit() : super(ZekrandSebhaInitial());

  void filterSurahsOnSearch(String query) {
    if (query.isEmpty) {
      filteredZekr = List.from(azkrMOdel);
    } else {
      filteredZekr = azkrMOdel.where(
        (zekr) {
          return zekr.category.contains(query);
        },
      ).toList();
    }
  }

  void getDoaa() async {
    try {
      emit(DoaaLoadingState());

      final data = await rootBundle.loadString("assets/jsons/doaa.json");

      final List<dynamic> res = jsonDecode(data);

      doaa = res
          .map(
            (e) => DoaaModel.fromJson(e),
          )
          .toList();

      emit(DoaaLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getAsmaaAllah() async {
    try {
      emit(AsmaaAllahLoadingState());
      final data = await rootBundle.loadString("assets/jsons/asmaa_allah.json");
      final List<dynamic> res = jsonDecode(data);
      asmaaAllah = res
          .map(
            (e) => AsmaaAllahModel.fromJson(e),
          )
          .toList();
      emit(AsmaaAllahLoadedState());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void initAzkarjson() async {
    try {
      emit(InitializingAzkarState());
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      azkrMOdel = response
          .map(
            (e) => AzkarModel.fromJson(e),
          )
          .toList();
      emit(InitializingAzkarSuccessState());
    } catch (e) {
      emit(
        InitializingAzkarErrorState(
          error: e.toString(),
        ),
      );
    }
  }

  void chooseSpacificZekr({required int index}) async {
    try {
      emit(DetailedAzkarState());
      if (someZekr != null) {
        someZekr!.clear();
      }
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      final List<dynamic> spacificList = response[index]['array'];
      someZekr = spacificList
          .map(
            (e) => InnerAzkar.fromJson(e),
          )
          .toList();
      emit(DetailedAzkarSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
  }
}
