import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PasswordStorage {
  static const storage = FlutterSecureStorage();
  static store(String password) async {
    await storage.write(
      key: 'password',
      value: password,
    );
  }

  static Future<String?> read() async {
    return await storage.read(
      key: 'password',
    );
  }
}
