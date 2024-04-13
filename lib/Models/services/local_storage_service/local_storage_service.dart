import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour_destiny/utils/localization/english_text.dart';

class LocalStorageKeys {
  static const accessToken = "AccessToken";
  static const language = "Language";
  static const registerToken = "RegisterToken";
  static const isFirstTime = "isFirstTime";
  static const userId = "userId";
  static const appTheme = "AppTheme"; // New key for storing app theme
}

class LocalStorageService {
  static late SharedPreferences _prefs;
  static Future init() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      print(_prefs);
    } catch (e) {
      // Handle error if initialization fails
      print('Failed to initialize SharedPreferences: $e');
    }
  }

  static String? read(String key) {
    print('Read gareko key $key');
    return _prefs.getString(key);
  }

  static bool? readBool(String key) {
    return _prefs.getBool(key);
  }

  static Future<void> write(String key, dynamic value) async {
    print('write method ma save vako data : $value');

    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    }
  }

  static Future<void> clear(String key) async {
    await _prefs.remove(key);
  }

  static bool isEmpty(String key) {
    return _prefs.getString(key) == null;
  }

  static bool isNotEmpty(String key) {
    return _prefs.getString(key) != null;
  }

  static Future<void> setTheme(String theme) async {
    await write(LocalStorageKeys.appTheme, theme);
  }

  static String? getTheme() {
    return read(LocalStorageKeys.appTheme);
  }

  static Future<void> setLanguage(String language) async {
    await write(LocalStorageKeys.language, language);
}
}
