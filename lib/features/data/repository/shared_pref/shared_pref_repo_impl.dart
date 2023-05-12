import 'package:jv_services/features/data/data_source/sharedPrefs/shared_prefs_ds.dart';
import 'package:jv_services/features/domain/repository/shared_pref/shared_pref_repo.dart';

class SharedPrefRepoImpl extends SharedPrefRepo {
  final SharedPrefsDS sharedPrefsDS;

  SharedPrefRepoImpl({required this.sharedPrefsDS});

  @override
  Future<int> getIntValue({required String key, int? defaultValue}) {
    return sharedPrefsDS.getIntValue(key: key, defaultValue: defaultValue);
  }

  @override
  Future<String?> getStringValue({required String key, String? defaultValue}) {
    return sharedPrefsDS.getStringValue(key: key, defaultValue: defaultValue);
  }

  @override
  bool isOnBoarded() {
    return sharedPrefsDS.isOnBoarded();
  }

  @override
  Future<bool> setIntValue({required String key, required int value}) {
    return sharedPrefsDS.setIntValue(key: key, value: value);
  }

  @override
  Future<bool> setOnBoarded() {
    return sharedPrefsDS.setOnBoarded();
  }

  @override
  Future<bool> setStringValue({required String key, required String value}) {
    return sharedPrefsDS.setStringValue(key: key, value: value);
  }
}
