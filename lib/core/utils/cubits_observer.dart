import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class AppCubitsObserver extends BlocObserver {
  final log = Logger();

  ///We can run something, when we create our Bloc
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    if (bloc is Cubit) {
      log.d("$bloc cubit has been created");
    } else {
      log.d("$bloc Bloc has been created");
    }
  }

  ///We can react to events
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log.e("an event Happened in $bloc the event is $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    log.d(
        "There was a transition in $bloc from ${transition.currentState} to ${transition.nextState}");
  }

  ///We can react to errors, and we will know the error and the StackTrace
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log.d(
        "Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  ///We can even run something, when we close our Bloc
  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log.d("$bloc  has been Closed");
  }
}
