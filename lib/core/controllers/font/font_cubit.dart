import 'package:flutter_bloc/flutter_bloc.dart';

class FontCubit extends Cubit<int> {
  FontCubit() : super(16);

  emitIneger(int number) {
    emit(number);
  }
}
