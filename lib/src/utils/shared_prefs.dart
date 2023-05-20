import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static void setUserName(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getUserName(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    log(value);
    return value;
  }

  static void setUserAge(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getUserAge(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? "";
    log(value);
    return value;
  }

  static void setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(key) ?? false;
    log("USER LOGGED IN?\n$value");
    return value;
  }

  static void removePrefs(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static void clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
