import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../data/hive_database.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const String _themeKey = 'isDarkMode';

  ThemeCubit() : super(ThemeMode.light) {
    _initTheme();
  }

  Future<void> _initTheme() async {
    try {
      Box box;
      if (!Hive.isBoxOpen(HiveDatabase.settingsBoxName)) {
        box = await Hive.openBox(HiveDatabase.settingsBoxName);
      } else {
        box = Hive.box(HiveDatabase.settingsBoxName);
      }

      final bool isDark = box.get(_themeKey, defaultValue: false);
      emit(isDark ? ThemeMode.dark : ThemeMode.light);
    } catch (e) {
      debugPrint("ThemeCubit Init Error: $e");
      emit(ThemeMode.light); // Fallback to light mode
    }
  }

  void toggleTheme(bool isDark) async {
    final mode = isDark ? ThemeMode.dark : ThemeMode.light;
    emit(mode);

    try {
      final box = Hive.isBoxOpen(HiveDatabase.settingsBoxName)
          ? Hive.box(HiveDatabase.settingsBoxName)
          : await Hive.openBox(HiveDatabase.settingsBoxName);
          
      await box.put(_themeKey, isDark);
    } catch (e) {
      debugPrint("Error saving theme: $e");
    }
  }
}