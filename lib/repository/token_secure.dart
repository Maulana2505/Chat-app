

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class tokensecure {
  
  final securestorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> writeToken(String key ,String value)async{
   return await securestorage.write(key: key, value: value);
  }
  Future readToken(String key) async{
   return await securestorage.read(key: key);
  }
  
  Future<void> deleteToken(String key)async{
   return await securestorage.delete(key: key);
  }
  Future<bool> containsData(String key) async {
    return await securestorage.containsKey(key: key);
  }

}