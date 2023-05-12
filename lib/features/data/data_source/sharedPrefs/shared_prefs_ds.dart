abstract class SharedPrefsDS {
  Future<bool> setStringValue({required String key, required String value});
  Future<bool> setIntValue({required String key, required int value});
  Future<String?> getStringValue({required String key, String? defaultValue});
  Future<int> getIntValue({required String key, int? defaultValue});
  bool isOnBoarded();
  Future<bool> setOnBoarded();
}
