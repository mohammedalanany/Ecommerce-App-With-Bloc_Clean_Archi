import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  late SharedPreferences sharedPreferences;

  Future<void> cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // methods
  // 1- set (save data)
  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    return false;
  }

  // 2- get (fetch data) => key
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  // 3- delete item => key
  void deleteItem({required String key}) {
    sharedPreferences.remove(key);
  }
}
