import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siraj/core/services/storage/shared_preferences.dart';
import 'package:siraj/core/utils/cubits_observer.dart';
import 'package:siraj/siraj.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();
  Bloc.observer = AppCubitsObserver();
  runApp(const Siraj());
}
