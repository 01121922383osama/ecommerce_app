import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubite extends Cubit<ThemeMode> {
  ThemeCubite() : super(ThemeMode.system);
  void chageTheme(ThemeRefrence themeRefrence) {
    switch (themeRefrence) {
      case ThemeRefrence.system:
        emit(ThemeMode.system);
        break;
      case ThemeRefrence.light:
        emit(ThemeMode.light);
        break;
      case ThemeRefrence.dark:
        emit(ThemeMode.dark);
        break;
      default:
        emit(ThemeMode.system);
    }
  }

  bool isDark(BuildContext context) {
    if (Brightness.dark == Theme.of(context).brightness) {
      return true;
    } else {
      return false;
    }
  }
}

enum ThemeRefrence { system, light, dark }
