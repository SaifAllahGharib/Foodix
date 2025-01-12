import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';

class LocalCubit extends Cubit<Locale> {
  LocalCubit() : super(Locale("ar"));

  Future<void> loadSavedLanguage() async {
    var prefs = MySharedPreferences();
    final String? savedLanguage = await prefs.getString("lang");
    if (savedLanguage != null) {
      emit(Locale(savedLanguage));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    var prefs = MySharedPreferences();
    await prefs.storeString("lang", languageCode);
    emit(Locale(languageCode));
  }
}
