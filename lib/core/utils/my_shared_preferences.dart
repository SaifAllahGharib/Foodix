import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy_home/features/choose_type/presentation/view/choose_type_view.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';

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

  Future<String?> getIdUser() async {
    return getString("id");
  }

  Future<String?> getNameUser() async {
    return getString("name");
  }

  Future<String?> getEmailUser() async {
    return getString("email");
  }

  Future<String?> getPhoneUser() async {
    return getString("phone_number");
  }

  Future<String?> getTypeUser() async {
    return getString("type");
  }

  Future<void> clearAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> storeString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(key, value);
    } catch (e) {
      print('Error storing string: $e');
    }
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<String> getInitRoute() async {
    final lang = await getString('lang');
    final id = await getIdUser();

    if (lang != null && id == null) {
      return ChooseTypeView.id;
    } else if (lang != null && id != null) {
      return HomeView.id;
    }
    return '/';
  }
}
