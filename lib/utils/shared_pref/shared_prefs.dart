import 'dart:convert';

import 'package:fello/models/login/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefConsts {
  static const String authToken = 'authToken';
  static const String userData = 'userData';
}

class SharedPrefs {
  static late SharedPreferences _prefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> remove(String key) async => await _prefs.remove(key);

  Future<void> clear() async => await _prefs.clear();

  String get authToken => _prefs.getString(PrefConsts.authToken) ?? "";

  set authToken(String value) => _prefs.setString(PrefConsts.authToken, value);

  UserDataModel get userData {
    try {
      return UserDataModel.fromJson(
          jsonDecode(_prefs.getString(PrefConsts.userData) ?? ""));
    } catch (e) {
      return UserDataModel();
    }
  }

  set userData(UserDataModel value) {
    _prefs.setString(PrefConsts.userData, jsonEncode(value.toJson()));
  }
}
