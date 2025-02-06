import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yummy_home/features/home/presentation/view/home_view.dart';
import 'package:yummy_home/features/login/presentation/view/login_view.dart';

class MySharedPreferences {
  static final MySharedPreferences _instance = MySharedPreferences._internal();

  factory MySharedPreferences() => _instance;

  MySharedPreferences._internal();

  final Logger _logger = Logger();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> storeUser(Map<String, dynamic> user) async {
    for (var entry in user.entries) {
      await _safeWrite(
        () async => _prefs?.setString(entry.key, entry.value.toString()),
        'Error storing user data',
      );
    }
  }

  String? getIdUser() => getString("id");

  String? getNameUser() => getString("name");

  String? getEmailUser() => getString("email");

  String? getPhoneUser() => getString("phone_number");

  String? getTypeUser() => getString("type");

  Future<void> clearAllData() async {
    await _safeWrite(() async => _prefs?.clear(), 'Error clearing data');
  }

  Future<void> storeString(String key, String value) async {
    await _safeWrite(
        () async => _prefs?.setString(key, value), 'Error storing string');
  }

  String? getString(String key) => _prefs?.getString(key);

  String getInitRoute() {
    final lang = getString('lang');
    final id = getIdUser();
    if (lang != null) {
      return id == null ? LoginView.id : HomeView.id;
    }
    return '/';
  }

  Future<void> _safeWrite(
      Future<void> Function() operation, String errorMessage) async {
    try {
      await operation();
    } catch (e, stacktrace) {
      _logger.e(errorMessage, error: e, stackTrace: stacktrace);
    }
  }
}
