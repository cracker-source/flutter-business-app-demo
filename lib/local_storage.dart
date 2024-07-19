import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<String> getToken() async {
    try {
      final key = await _secureStorage.read(key: "secureKey");

      if (key != null) {
        final encryptedKey = base64Url.decode(key);
        final keyBox = await Hive.openBox("key",
            encryptionCipher: HiveAesCipher(encryptedKey));

        return keyBox.get("token");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return "";
  }

  static Future<void> setToken(String token) async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();

    final secureKey = Hive.generateSecureKey();

    final encryptedBox = await Hive.openBox(
      "key",
      encryptionCipher: HiveAesCipher(secureKey),
    );

    await encryptedBox.put('token', token);

    //SECURE_STORAGE_KEY is any string key.
    await secureStorage.write(
      key: "secureKey",
      value: base64Encode(secureKey),
    );
    encryptedBox.close();
  }
}
