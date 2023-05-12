import 'package:shared_preferences/shared_preferences.dart';

import 'shared_prefs_ds.dart';

class SharedPrefsDSImpl extends SharedPrefsDS {
  static const String onBoarding = "on_boarding";

  final SharedPreferences preferences;

  SharedPrefsDSImpl({required this.preferences});

  @override
  Future<int> getIntValue({required String key, int? defaultValue}) async {
    return preferences.getInt(key) ?? defaultValue ?? -1;
  }

  @override
  Future<String?> getStringValue(
      {required String key, String? defaultValue}) async {
    return preferences.getString(key) ?? defaultValue;
  }

  @override
  bool isOnBoarded() {
    return preferences.getBool(onBoarding) ?? false;
  }

  @override
  Future<bool> setIntValue({required String key, required int value}) {
    return preferences.setInt(key, value);
  }

  @override
  Future<bool> setStringValue(
      {required String key, required String value}) async {
    return await preferences.setString(key, value);
  }

  @override
  Future<bool> setOnBoarded() async {
    return await preferences.setBool(onBoarding, true);
  }
}
