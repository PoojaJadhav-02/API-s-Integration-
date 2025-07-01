/*
import 'package:get_storage/get_storage.dart';

class AuthStorage{
 static final storage = GetStorage();


 static const String userIdKey = "_id";
 static const String emailKey = 'email';
 static const String usernameKey = 'username';
 static const String nameKey = 'name';
 static const String passwordKey = 'password';
 static const String tokenKey = 'token';

 static Future<void> saveUserDetails({
   required String userId,
   required String email,
   required String username,
   required String name,
   required String password,
   required String token,
})async{
  await storage.write(userIdKey, userId);
  await storage.write(emailKey, email);
  await storage.write(usernameKey, username);
  await storage.write(nameKey, name);
  await storage.write(tokenKey, token);
  await storage.write(passwordKey, password);
 }

 static Map<String, String?> getUserDetails() {
   return {
     "token": storage.read(tokenKey),
     "email": storage.read(emailKey),
     "name": storage.read(nameKey),
     "username": storage.read(usernameKey),
     "_id": storage.read(userIdKey),
   };
 }

 static String? getName() => storage.read<String>('name');
 static String? getEmail() => storage.read<String>('username');
 static String? getUserName() => storage.read<String>('email');
 static String? getFName() => storage.read<String>('token');


 /// 📌 Store Email
 static Future<void> setEmail(String email) async {
   await storage.write(emailKey, email);
 }
 static String? getEmailId() {
   return storage.read(emailKey);
 }


 /// 📌 Store Username
 static Future<void> setUsername(String username) async {
   await storage.write(usernameKey, username);
 }
 static String? getUsername() {
   return storage.read(usernameKey);
 }


 /// 📌 Store Name
 static Future<void> setName(String name) async {
   await storage.write(usernameKey, nameKey);
 }
 static String? getNamee() {
   return storage.read(nameKey);
 }


 /// 📌 Store Token
 static Future<void> setToken(String token) async {
   await storage.write(usernameKey, tokenKey);
 }
 static String? getToken() {
   return storage.read(tokenKey);
 }

 /// 📌 Storage Erase
 static Future<void> clearStorage() async {
   await storage.erase();
 }

 static Future<void> saveUserId(String id) async {
   storage.write('userId', id);
 }

}*/




import 'package:get_storage/get_storage.dart';

class AuthStorage {
  static final storage = GetStorage();

  static const String userIdKey = "_id";
  static const String emailKey = 'email';
  static const String usernameKey = 'username';
  static const String nameKey = 'name';
  static const String passwordKey = 'password';
  static const String tokenKey = 'token';

  static Future<void> saveUserDetails({
    required String userId,
    required String email,
    required String username,
    required String name,
    required String password,
    required String token,
  }) async {
    await storage.write(userIdKey, userId);
    await storage.write(emailKey, email);
    await storage.write(usernameKey, username);
    await storage.write(nameKey, name);
    await storage.write(tokenKey, token);
    await storage.write(passwordKey, password);
  }

  static Future<void> setToken(String token) async {
    await storage.write(tokenKey, token);
  }

  static String? getToken() {
    return storage.read(tokenKey);
  }

  static Future<void> clearStorage() async {
    await storage.erase();
  }

  static Map<String, String?> getUserDetails()   {
    return {
      "token": storage.read(tokenKey),
      "email": storage.read(emailKey),
      "name": storage.read(nameKey),
      "username": storage.read(usernameKey),
      "_id": storage.read(userIdKey),
    };
  }
}
