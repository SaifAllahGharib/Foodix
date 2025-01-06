import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static final MySharedPreferences _instance = MySharedPreferences._internal();

  factory MySharedPreferences() => _instance;

  MySharedPreferences._internal();

  Future<void> storeUser(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();

    user.forEach(
      (key, value) async {
        try {
          await prefs.setString(key, value.toString());
        } catch (e) {
          print('Error storing user data: $e');
        }
      },
    );
  }

  Future<Map<String, String>> getUser(List<String> keys) async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, String> user = {};

    for (String key in keys) {
      final String? value = prefs.getString(key);
      if (value != null) {
        user[key] = value;
      }
    }

    return user;
  }

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
