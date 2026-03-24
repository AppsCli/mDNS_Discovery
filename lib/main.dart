import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/app_localizations.dart';
import 'locale_settings.dart';
import 'mdns_home_page.dart';
import 'theme_settings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MdnsDiscoveryApp());
}

class MdnsDiscoveryApp extends StatefulWidget {
  const MdnsDiscoveryApp({super.key});

  @override
  State<MdnsDiscoveryApp> createState() => _MdnsDiscoveryAppState();
}

class _MdnsDiscoveryAppState extends State<MdnsDiscoveryApp> {
  Locale? _localeOverride;
  Color _seedColor = kDefaultThemeSeed;
  ThemeMode _themeMode = ThemeMode.system;
  bool _prefsReady = false;

  @override
  void initState() {
    super.initState();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final localeTag = await LocaleSettings.loadPreferredTag();
    final seed = await ThemeSettings.loadSeedColor();
    final mode = await ThemeSettings.loadThemeMode();
    if (!mounted) return;
    setState(() {
      _localeOverride = LocaleSettings.localeFromTag(localeTag);
      _seedColor = seed;
      _themeMode = mode;
      _prefsReady = true;
    });
  }

  Future<void> _applyLocaleTag(String tag) async {
    await LocaleSettings.savePreferredTag(tag);
    if (!mounted) return;
    setState(() {
      _localeOverride = LocaleSettings.localeFromTag(tag);
    });
  }

  Future<void> _applySeedColor(Color color) async {
    await ThemeSettings.saveSeedColor(color);
    if (!mounted) return;
    setState(() => _seedColor = color);
  }

  Future<void> _applyThemeMode(ThemeMode mode) async {
    await ThemeSettings.saveThemeMode(mode);
    if (!mounted) return;
    setState(() => _themeMode = mode);
  }

  void _showAppearanceDialog(BuildContext anchorContext) {
    final l10n = AppLocalizations.of(anchorContext)!;
    final selected = ThemeSettings.themeModeStorageValue(_themeMode);

    showDialog<void>(
      context: anchorContext,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.appearanceDialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: Text(l10n.appearanceFollowSystem),
                  value: 'system',
                  groupValue: selected,
                  onChanged: (v) async {
                    if (v == null) return;
                    Navigator.pop(dialogContext);
                    await _applyThemeMode(ThemeMode.system);
                  },
                ),
                RadioListTile<String>(
                  title: Text(l10n.appearanceLight),
                  value: 'light',
                  groupValue: selected,
                  onChanged: (v) async {
                    if (v == null) return;
                    Navigator.pop(dialogContext);
                    await _applyThemeMode(ThemeMode.light);
                  },
                ),
                RadioListTile<String>(
                  title: Text(l10n.appearanceDark),
                  value: 'dark',
                  groupValue: selected,
                  onChanged: (v) async {
                    if (v == null) return;
                    Navigator.pop(dialogContext);
                    await _applyThemeMode(ThemeMode.dark);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
          ],
        );
      },
    );
  }

  void _showLanguageDialog(BuildContext anchorContext) {
    final l10n = AppLocalizations.of(anchorContext)!;
    final selected = LocaleSettings.currentTagForUi(_localeOverride);

    showDialog<void>(
      context: anchorContext,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.languageDialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<String>(
                  title: Text(l10n.languageFollowSystem),
                  value: 'system',
                  groupValue: selected,
                  onChanged: (v) async {
                    if (v == null) return;
                    Navigator.pop(dialogContext);
                    await _applyLocaleTag('system');
                  },
                ),
                const Divider(height: 1),
                for (final (tag, endonym) in kLanguagePickerOptions)
                  RadioListTile<String>(
                    title: Text(endonym),
                    value: tag,
                    groupValue: selected,
                    onChanged: (v) async {
                      if (v == null) return;
                      Navigator.pop(dialogContext);
                      await _applyLocaleTag(v);
                    },
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
          ],
        );
      },
    );
  }

  void _showThemeDialog(BuildContext anchorContext) {
    final l10n = AppLocalizations.of(anchorContext)!;
    final theme = Theme.of(anchorContext);

    showDialog<void>(
      context: anchorContext,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.themeColorDialogTitle),
          content: SingleChildScrollView(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                for (final c in kThemeSeedChoices)
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () async {
                        Navigator.pop(dialogContext);
                        await _applySeedColor(c);
                      },
                      child: Ink(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: c,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: ThemeSettings.sameSeed(_seedColor, c)
                                ? 3
                                : 1,
                            color: ThemeSettings.sameSeed(_seedColor, c)
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.outline.withValues(
                                    alpha: 0.5,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(l10n.cancel),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeSettings.lightThemeFromSeed(_seedColor);
    final darkTheme = ThemeSettings.darkThemeFromSeed(_seedColor);

    if (!_prefsReady) {
      return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeMode,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return MaterialApp(
      locale: _localeOverride,
      localeListResolutionCallback: (deviceLocales, supported) {
        return LocaleSettings.resolveForDevice(deviceLocales, supported);
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: MdnsHomePage(
        onAppearanceTap: _showAppearanceDialog,
        onLanguageTap: _showLanguageDialog,
        onThemeTap: _showThemeDialog,
      ),
    );
  }
}
