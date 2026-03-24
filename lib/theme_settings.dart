import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kThemeSeedKey = 'app_theme_seed_argb';
const _kThemeModeKey = 'app_theme_mode';

/// Default seed (Material Teal), matches the app’s original look.
const Color kDefaultThemeSeed = Color(0xFF009688);

/// Preset seeds for [ColorScheme.fromSeed].
const List<Color> kThemeSeedChoices = <Color>[
  Color(0xFF009688), // teal
  Color(0xFF00695C), // teal darker
  Color(0xFF2196F3), // blue
  Color(0xFF3F51B5), // indigo
  Color(0xFF673AB7), // deepPurple
  Color(0xFF9C27B0), // purple
  Color(0xFFE91E63), // pink
  Color(0xFFF44336), // red
  Color(0xFFFF5722), // deepOrange
  Color(0xFFFF9800), // orange
  Color(0xFFFFC107), // amber
  Color(0xFF4CAF50), // green
  Color(0xFF8BC34A), // lightGreen
  Color(0xFF00BCD4), // cyan
  Color(0xFF795548), // brown
  Color(0xFF607D8B), // blueGrey
];

class ThemeSettings {
  ThemeSettings._();

  static Future<Color> loadSeedColor() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getInt(_kThemeSeedKey);
    if (raw == null) return kDefaultThemeSeed;
    return Color(raw);
  }

  static Future<void> saveSeedColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kThemeSeedKey, color.toARGB32());
  }

  static Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kThemeModeKey);
    if (raw == null || raw.isEmpty || raw == 'system') {
      return ThemeMode.system;
    }
    if (raw == 'light') return ThemeMode.light;
    if (raw == 'dark') return ThemeMode.dark;
    return ThemeMode.system;
  }

  static Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    switch (mode) {
      case ThemeMode.system:
        await prefs.remove(_kThemeModeKey);
      case ThemeMode.light:
        await prefs.setString(_kThemeModeKey, 'light');
      case ThemeMode.dark:
        await prefs.setString(_kThemeModeKey, 'dark');
    }
  }

  static String themeModeStorageValue(ThemeMode mode) {
    return switch (mode) {
      ThemeMode.system => 'system',
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
    };
  }

  static ThemeData lightThemeFromSeed(Color seed) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
    );
  }

  static ThemeData darkThemeFromSeed(Color seed) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
  }

  static bool sameSeed(Color a, Color b) => a.toARGB32() == b.toARGB32();
}
