import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceUtil {
  static const String keyLogin = "key_login";
  static const String keyTest = "key_test";

  static void setBoolean(String key, bool value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setBool(key, value);
  }

  static Future<bool> getBoolean(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    bool? value = share.getBool(key);
    if (value == null) {
      return false;
    }
    return value;
  }

  static void setString(String key, String value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    share.setString(key, value);
  }

  static Future<String> getString(String key) {
    return Future<String>(() async {
      SharedPreferences share = await SharedPreferences.getInstance();
      var value = share.getString(key);
      value ??= "";
      print("share getString = $value");
      return value;
    });
  }
}
