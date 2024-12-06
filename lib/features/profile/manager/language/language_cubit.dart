import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  final _prefs = SharedPreferences.getInstance();
  static const _languageKey = 'selected_language';

  LanguageCubit() : super('en') {
    _initLanguage();
  }

  Future<void> _initLanguage() async {
    final prefs = await _prefs;
    final savedLang = prefs.getString(_languageKey);
    if (savedLang != null) {
      emit(savedLang);
    }
  }

  Future<void> changeLanguage(String lang) async {
    final prefs = await _prefs;
    await prefs.setString(_languageKey, lang);
    emit(lang);
  }
}
