import 'package:shared_preferences/shared_preferences.dart';

class PrefConsts {
  static const String isLogin = "isLogin";
}

class SharedPrefs {
  static late SharedPreferences _prefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  Future<void> remove(String key) async => await _prefs.remove(key);

  Future<void> clear() async => await _prefs.clear();

  bool get isLogin => _prefs.getBool(PrefConsts.isLogin) ?? false;

  set isLogin(bool value) => _prefs.setBool(PrefConsts.isLogin, value);
}
