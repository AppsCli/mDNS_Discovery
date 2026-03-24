import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocalePrefKey = 'app_locale_tag';

class LocaleSettings {
  LocaleSettings._();

  /// `null` / empty / `system` in storage means follow the OS.
  static Future<String?> loadPreferredTag() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_kLocalePrefKey);
    if (raw == null || raw.isEmpty || raw == 'system') return null;
    return raw;
  }

  static Future<void> savePreferredTag(String? tag) async {
    final prefs = await SharedPreferences.getInstance();
    if (tag == null || tag.isEmpty || tag == 'system') {
      await prefs.remove(_kLocalePrefKey);
    } else {
      await prefs.setString(_kLocalePrefKey, tag);
    }
  }

  /// `null` → MaterialApp should use `locale: null` (follow system).
  static Locale? localeFromTag(String? tag) {
    if (tag == null || tag.isEmpty || tag == 'system') return null;
    if (tag == 'zh_TW') return const Locale('zh', 'TW');
    return Locale(tag);
  }

  static String currentTagForUi(Locale? override) {
    if (override == null) return 'system';
    if (override.languageCode == 'zh' && override.countryCode == 'TW') {
      return 'zh_TW';
    }
    return override.languageCode;
  }

  /// Picks the best supported locale for [deviceLocales], else [Locale('en')].
  ///
  /// On some platforms (e.g. macOS), [deviceLocales] can be empty if the app
  /// bundle does not declare [CFBundleLocalizations]. We then fall back to
  /// [PlatformDispatcher.instance.locale], which still reflects the user locale.
  static Locale resolveForDevice(
    List<Locale>? deviceLocales,
    Iterable<Locale> supported,
  ) {
    final supportedList = supported.toList(growable: false);
    const fallback = Locale('en');

    final fromList = deviceLocales ?? const <Locale>[];
    final orderedDevices = <Locale>[
      ...fromList,
      if (fromList.isEmpty) PlatformDispatcher.instance.locale,
    ];

    for (final device in orderedDevices) {
      for (final s in supportedList) {
        if (s.languageCode == device.languageCode &&
            s.countryCode == device.countryCode) {
          return s;
        }
      }
      for (final s in supportedList) {
        if (s.languageCode == device.languageCode && s.countryCode == null) {
          return s;
        }
      }
      for (final s in supportedList) {
        if (s.languageCode == device.languageCode) {
          return s;
        }
      }
    }

    for (final s in supportedList) {
      if (s.languageCode == fallback.languageCode &&
          s.countryCode == fallback.countryCode) {
        return s;
      }
    }
    for (final s in supportedList) {
      if (s.languageCode == fallback.languageCode) {
        return s;
      }
    }
    return supportedList.isNotEmpty ? supportedList.first : fallback;
  }
}

/// UI list: (tag, endonym). `system` uses [AppLocalizations.languageFollowSystem].
const kLanguagePickerOptions = <(String, String)>[
  ('en', 'English'),
  ('zh', '中文（简体）'),
  ('zh_TW', '中文（繁體）'),
  ('es', 'Español'),
  ('fr', 'Français'),
  ('de', 'Deutsch'),
  ('ja', '日本語'),
  ('ko', '한국어'),
  ('pt', 'Português'),
  ('ru', 'Русский'),
  ('ar', 'العربية'),
  ('it', 'Italiano'),
  ('nl', 'Nederlands'),
  ('pl', 'Polski'),
  ('tr', 'Türkçe'),
];
