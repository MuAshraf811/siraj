import 'package:flutter_bloc/flutter_bloc.dart';

class NavBArCubit extends Cubit<int> {
  NavBArCubit() : super(0);

  changeIndex(int currentIndex) => emit(currentIndex);
}
