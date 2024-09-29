import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/core/utils/constants/app_colors.dart';
import 'package:siraj/core/widgets/snack_bar.dart';
import 'package:share_plus/share_plus.dart';
import '../../other/model/asmaa_allah_model.dart';
import '../../other/model/azkar_model.dart';
import '../../other/model/doaa_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  late List<AzkarModel> azkrMOdel;
  List<InnerAzkar>? someZekr;
  String? someZekrCategoryName;
  DoaaModel? somedoaa;
  AsmaaAllahModel? someName;

  late String randomZekeText;

  HomeCubit() : super(HomeInitial());

  generateCustomAllahName() async {
    try {
      emit(RandomAsmState());
      if (someName != null) {}
      final res = await rootBundle.loadString("assets/jsons/asmaa_allah.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      final Map<String, dynamic> spacificList = response[random];
      someName = AsmaaAllahModel.fromJson(spacificList);

      emit(RandomAsmSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomAsmErrorState(error: e.toString()));
    }
  }

  generateCustomDoaa() async {
    try {
      emit(RandomDoaaState());
      if (somedoaa != null) {}
      final res = await rootBundle.loadString("assets/jsons/doaa.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      final Map<String, dynamic> spacificList = response[random];
      somedoaa = DoaaModel.fromJson(spacificList);

      emit(RandomDoaaSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomDoaaErrorState(error: e.toString()));
    }
  }

  shareText() async {
    try {
      emit(ShareRandomZekrState());
      await Share.share(randomZekeText, subject: "share");
      emit(ShareRandomZekrSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  copyText(BuildContext context) {
    Clipboard.setData(ClipboardData(text: randomZekeText)).then(
      (_) {
        showCustomSnackBar(context, "تم نسخ النص بنجاح", AppColors.primary);
      },
    );
  }

  void generateCustomZekr() async {
    emit(RandomZekrState());
    try {
      emit(RandomZekrState());
      if (someZekr != null) {
        someZekr!.clear();
      }
      final res = await rootBundle.loadString("assets/jsons/adhkar.json");
      final List<dynamic> response = jsonDecode(res);
      final random = Random().nextInt(response.length - 1);
      someZekrCategoryName = response[random]["category"];
      final List<dynamic> spacificList = response[random]['array'];
      someZekr = spacificList
          .map(
            (e) => InnerAzkar.fromJson(e),
          )
          .toList();
      randomZekeText = someZekr![someZekr!.length - 1].text;
      emit(RandomZekrSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(RandomZekrErrorState(error: e.toString()));
    }
  }
}
