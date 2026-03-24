import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('zh'),
    Locale('zh', 'TW'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'mDNS Discovery'**
  String get appTitle;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'mDNS discovery & broadcast'**
  String get homeTitle;

  /// No description provided for @tabDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get tabDiscover;

  /// No description provided for @tabBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Broadcast'**
  String get tabBroadcast;

  /// No description provided for @tooltipHelp.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get tooltipHelp;

  /// No description provided for @tooltipLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get tooltipLanguage;

  /// No description provided for @dialogAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About mDNS'**
  String get dialogAboutTitle;

  /// No description provided for @dialogAboutBody.
  ///
  /// In en, this message translates to:
  /// **'Discover: browse LAN services by DNS-SD type. If the host is unresolved, tap “Resolve host & TXT”.\n\nBroadcast: publish a service on this device (port must be free and the OS must allow it).\n\nCopy shortcuts appear next to items; in details you can copy a line or full JSON.\n\nOn iOS, declare browsed types under NSBonjourServices in Info.plist.'**
  String get dialogAboutBody;

  /// No description provided for @dialogGotIt.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get dialogGotIt;

  /// No description provided for @fabAddDiscoveryType.
  ///
  /// In en, this message translates to:
  /// **'Add browse type'**
  String get fabAddDiscoveryType;

  /// No description provided for @fabAddBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Add broadcast'**
  String get fabAddBroadcast;

  /// No description provided for @filterLabel.
  ///
  /// In en, this message translates to:
  /// **'Filter by name / type / host / port'**
  String get filterLabel;

  /// No description provided for @discoveryEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap “Add browse type” to start.\nCommon: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp'**
  String get discoveryEmptyBody;

  /// No description provided for @copiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Copied: {label}'**
  String copiedMessage(Object label);

  /// No description provided for @alreadyBrowsingType.
  ///
  /// In en, this message translates to:
  /// **'Already browsing this type'**
  String get alreadyBrowsingType;

  /// No description provided for @resolveFailedRetry.
  ///
  /// In en, this message translates to:
  /// **'Resolve failed (try again later)'**
  String get resolveFailedRetry;

  /// No description provided for @copyTypeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy type'**
  String get copyTypeTooltip;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @errorWithMessage.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorWithMessage(Object message);

  /// No description provided for @discoveredCount.
  ///
  /// In en, this message translates to:
  /// **'{shown} of {total} services'**
  String discoveredCount(Object shown, Object total);

  /// No description provided for @searchingForType.
  ///
  /// In en, this message translates to:
  /// **'Searching for “{type}”…'**
  String searchingForType(Object type);

  /// No description provided for @noMatchingServices.
  ///
  /// In en, this message translates to:
  /// **'No services match the filter'**
  String get noMatchingServices;

  /// No description provided for @broadcastEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap “Add broadcast” to publish.\nMake sure the port is not in use.'**
  String get broadcastEmptyBody;

  /// No description provided for @stateInitializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing…'**
  String get stateInitializing;

  /// No description provided for @stateBroadcasting.
  ///
  /// In en, this message translates to:
  /// **'Broadcasting'**
  String get stateBroadcasting;

  /// No description provided for @stateStopped.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get stateStopped;

  /// No description provided for @stateStarting.
  ///
  /// In en, this message translates to:
  /// **'Starting…'**
  String get stateStarting;

  /// No description provided for @stopAndRemove.
  ///
  /// In en, this message translates to:
  /// **'Stop & remove'**
  String get stopAndRemove;

  /// No description provided for @statusWithState.
  ///
  /// In en, this message translates to:
  /// **'Status: {state}'**
  String statusWithState(Object state);

  /// No description provided for @copyServiceNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy service name'**
  String get copyServiceNameTooltip;

  /// No description provided for @hostLineUnresolved.
  ///
  /// In en, this message translates to:
  /// **'Port {port} · host not resolved'**
  String hostLineUnresolved(Object port);

  /// No description provided for @hostLineResolved.
  ///
  /// In en, this message translates to:
  /// **'{host}:{port}'**
  String hostLineResolved(Object host, Object port);

  /// No description provided for @resolveHostTxt.
  ///
  /// In en, this message translates to:
  /// **'Resolve host & TXT'**
  String get resolveHostTxt;

  /// No description provided for @resolveCallFailed.
  ///
  /// In en, this message translates to:
  /// **'Resolve call failed: {error}'**
  String resolveCallFailed(Object error);

  /// No description provided for @labelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelName;

  /// No description provided for @labelType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get labelType;

  /// No description provided for @labelHost.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get labelHost;

  /// No description provided for @hostUnresolvedValue.
  ///
  /// In en, this message translates to:
  /// **'(unresolved)'**
  String get hostUnresolvedValue;

  /// No description provided for @labelPort.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get labelPort;

  /// No description provided for @txtAttributesHeader.
  ///
  /// In en, this message translates to:
  /// **'TXT records'**
  String get txtAttributesHeader;

  /// No description provided for @txtNone.
  ///
  /// In en, this message translates to:
  /// **'(none)'**
  String get txtNone;

  /// No description provided for @copyFullJsonButton.
  ///
  /// In en, this message translates to:
  /// **'Copy full JSON'**
  String get copyFullJsonButton;

  /// No description provided for @copyFieldTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy {field}'**
  String copyFieldTooltip(Object field);

  /// No description provided for @discoveryDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add browse type'**
  String get discoveryDialogTitle;

  /// No description provided for @quickSelect.
  ///
  /// In en, this message translates to:
  /// **'Quick pick'**
  String get quickSelect;

  /// No description provided for @typeNameFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Type name (without leading _)'**
  String get typeNameFieldLabel;

  /// No description provided for @typeNameFieldHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. http → _http._tcp'**
  String get typeNameFieldHint;

  /// No description provided for @transportProtocol.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get transportProtocol;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @startBrowsing.
  ///
  /// In en, this message translates to:
  /// **'Start browsing'**
  String get startBrowsing;

  /// No description provided for @broadcastDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Add broadcast'**
  String get broadcastDialogTitle;

  /// No description provided for @serviceNameFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Service display name'**
  String get serviceNameFieldLabel;

  /// No description provided for @broadcastTypeFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Type (e.g. http → _http._tcp)'**
  String get broadcastTypeFieldLabel;

  /// No description provided for @txtAttrsSection.
  ///
  /// In en, this message translates to:
  /// **'TXT attributes'**
  String get txtAttrsSection;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @keyFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Key'**
  String get keyFieldLabel;

  /// No description provided for @valueFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get valueFieldLabel;

  /// No description provided for @startBroadcast.
  ///
  /// In en, this message translates to:
  /// **'Start broadcast'**
  String get startBroadcast;

  /// No description provided for @invalidPortRange.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid port (1–65535)'**
  String get invalidPortRange;

  /// No description provided for @broadcastStartFailed.
  ///
  /// In en, this message translates to:
  /// **'Broadcast failed to start: {error}'**
  String broadcastStartFailed(Object error);

  /// No description provided for @stateFailedWithError.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String stateFailedWithError(Object error);

  /// No description provided for @defaultHostLabel.
  ///
  /// In en, this message translates to:
  /// **'Local'**
  String get defaultHostLabel;

  /// No description provided for @defaultServiceName.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get defaultServiceName;

  /// No description provided for @languageDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageDialogTitle;

  /// No description provided for @languageFollowSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get languageFollowSystem;

  /// No description provided for @txtCopyKeyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy key'**
  String get txtCopyKeyTooltip;

  /// No description provided for @txtCopyValueTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy value'**
  String get txtCopyValueTooltip;

  /// No description provided for @txtCopyPairTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy key=value'**
  String get txtCopyPairTooltip;

  /// No description provided for @copyLabelServiceType.
  ///
  /// In en, this message translates to:
  /// **'service type'**
  String get copyLabelServiceType;

  /// No description provided for @copyLabelServiceName.
  ///
  /// In en, this message translates to:
  /// **'service name'**
  String get copyLabelServiceName;

  /// No description provided for @copyLabelFullJson.
  ///
  /// In en, this message translates to:
  /// **'full JSON'**
  String get copyLabelFullJson;

  /// No description provided for @copyLabelTxtKey.
  ///
  /// In en, this message translates to:
  /// **'TXT key {key}'**
  String copyLabelTxtKey(Object key);

  /// No description provided for @copyLabelTxtValue.
  ///
  /// In en, this message translates to:
  /// **'TXT value {key}'**
  String copyLabelTxtValue(Object key);

  /// No description provided for @copyLabelTxtPair.
  ///
  /// In en, this message translates to:
  /// **'TXT {pair}'**
  String copyLabelTxtPair(Object pair);

  /// No description provided for @tooltipThemeColor.
  ///
  /// In en, this message translates to:
  /// **'Theme color'**
  String get tooltipThemeColor;

  /// No description provided for @themeColorDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose accent color'**
  String get themeColorDialogTitle;

  /// No description provided for @tooltipAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get tooltipAppearance;

  /// No description provided for @appearanceDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceDialogTitle;

  /// No description provided for @appearanceFollowSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow system'**
  String get appearanceFollowSystem;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ru',
    'tr',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
