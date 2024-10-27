import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/core/services/storage/shared_preferences.dart';

class ThemeCubit extends Cubit<int> {
  ThemeCubit() : super(0);

  emitIneger(int number) {
    SharedPreferencesManager.storeBool(
        key: "theme", value: state == 0 ? false : true);
    emit(number);
  }
}
