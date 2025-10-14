import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static const String userTokenKey = 'token';

  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> saveUserToken(String token) async {
    await secureStorage.write(key: userTokenKey, value: token);
  }

  Future<String?> getUserToken() async {
    return await secureStorage.read(key: userTokenKey);
  }

  Future<void> deleteUserToken() async {
    await secureStorage.delete(key: userTokenKey);
  }
}

class SharedPrefsService {
  static SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }
}
