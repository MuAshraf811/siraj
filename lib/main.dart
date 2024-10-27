import 'package:flutter/material.dart';
import 'package:siraj/core/services/storage/shared_preferences.dart';
import 'package:siraj/siraj.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.init();

  runApp(const Siraj());
}
