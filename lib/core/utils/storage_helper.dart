import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
