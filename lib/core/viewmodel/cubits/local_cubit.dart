import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';

class LocalCubit extends Cubit<Locale> {
  final MySharedPreferences _sharedPreferences;

  LocalCubit(this._sharedPreferences) : super(const Locale("ar")) {
    loadSavedLanguage();
  }

  Future<void> loadSavedLanguage() async {
    final savedLanguage = _sharedPreferences.getString("lang") ?? "ar";
    if (savedLanguage != state.languageCode) {
      emit(Locale(savedLanguage));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    if (languageCode != state.languageCode) {
      await _sharedPreferences.storeString("lang", languageCode);
      emit(Locale(languageCode));
    }
  }

  bool get isArabic => state.languageCode == "ar";
}
