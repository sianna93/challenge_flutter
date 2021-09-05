import 'dart:convert';

import 'package:app_find_home/app/core/config/config.dart';
import 'package:app_find_home/app/data/model/request_token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageProvider {
// Create storage
  final FlutterSecureStorage _storage = new FlutterSecureStorage();

  Future<void> setSession({required RequestToken requestToken}) async{
    await _storage.write(key: KEY_SESSION, value: jsonEncode(requestToken.toJson()));
    return null;
  }

  Future<RequestToken> getSession() async {
    String? value = await _storage.read(key: KEY_SESSION);

    return RequestToken.fromJson(jsonDecode(value ?? ""));
  }

  Future<void> deleteSession() async {
    await _storage.delete(key: KEY_SESSION);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

}