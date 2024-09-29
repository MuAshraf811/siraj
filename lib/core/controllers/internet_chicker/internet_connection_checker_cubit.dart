import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'internet_connection_checker_state.dart';

class InternetConnectionCheckerCubit
    extends Cubit<InternetConnectionCheckerState> {
  InternetConnectionCheckerCubit() : super(InternetConnectionCheckerInitial());
  late StreamSubscription<List<ConnectivityResult>> subscription;
  void checkInternetConnection() async {
    final obj = Connectivity();
    subscription = obj.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          emit(NoInternetConnectionState());
        }
        if (event.contains(ConnectivityResult.wifi)) {
          emit(InternetConnectionState());
        }
        if (event.contains(ConnectivityResult.mobile)) {
          emit(InternetConnectionState());
        }
      },
    );
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
