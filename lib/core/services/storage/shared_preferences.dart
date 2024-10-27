import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferences? _obj;
  SharedPreferencesManager._();

  static init() async {
    _obj ??= await SharedPreferences.getInstance();
  }

  static storeBool({required String key, required bool value}) {
    _obj?.setBool(key, value);
  }

  static getBool({required String key}) {
    return _obj?.getBool(key) ?? false;
  }

  static storeInt({required String key, required int value}) async {
    await _obj?.setInt(key, value);
  }

  static int getInt({required String key}) {
    return _obj?.getInt(key) ?? 0;
  }

  static storeString({required String key, required String value}) async {
    await _obj?.setString(key, value);
  }

  static String getString({required String key}) {
    return _obj?.getString(key) ?? "";
  }
}
