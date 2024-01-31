import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


class AppPreference {
  static const String isRemember = 'isRemember';
  static const String accountNumber = 'accountNumber';
  static const String cashierCode = 'cashierCode';
  static const String password = 'password';
  static const String logo = 'store_logo';
  static const String authToken = 'token';
  static const String loginData = 'loginData';
  static const String mcLessonData = 'mcBookings';
  static const String languageCode = 'device_language';
  static const String deviceToken = 'fcmToken';
  static const String isScreenLogin = 'false';

  // Retrive users data
  // static Future<LoginData?> getLoginData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String loginDetails = prefs.getString(loginData) ?? "";
  //   try {
  //     return LoginData.fromJson(json.decode(loginDetails));
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // static Future<McBookings?> mcLessonDataDetails() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String mcLessonInfo = prefs.getString(mcLessonData) ?? "";
  //   try {
  //     return McBookings.fromJson(json.decode(mcLessonInfo));
  //   } catch (e) {
  //     return null;
  //   }
  // }



  // Do Not Change Below (Default methods) =========================================================
  static Future<String?> readString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> writeString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future<bool?> readBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  static Future<bool> writeBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  static Future<bool> clearPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
