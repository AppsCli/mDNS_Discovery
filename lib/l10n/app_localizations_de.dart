// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'mDNS-Erkennung';

  @override
  String get homeTitle => 'mDNS-Erkennung & -Ankündigung';

  @override
  String get tabDiscover => 'Entdecken';

  @override
  String get tabBroadcast => 'Ankündigen';

  @override
  String get tooltipHelp => 'Info';

  @override
  String get tooltipLanguage => 'Sprache';

  @override
  String get dialogAboutTitle => 'Über mDNS';

  @override
  String get dialogAboutBody =>
      'Entdecken: Durchsuchen Sie LAN-Dienste nach DNS-SD-Typ. Wenn der Host nicht aufgelöst ist, tippen Sie auf „Host & TXT auflösen“.\n\nAnkündigen: Veröffentlichen Sie einen Dienst auf diesem Gerät (Port muss frei sein und das OS muss es erlauben).\n\nKopier-Shortcuts neben Einträgen; in den Details eine Zeile oder vollständiges JSON kopieren.\n\nUnter iOS Typen in NSBonjourServices in der Info.plist angeben.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Suchtyp hinzufügen';

  @override
  String get fabAddBroadcast => 'Ankündigung hinzufügen';

  @override
  String get filterLabel => 'Filtern nach Name / Typ / Host / Port';

  @override
  String get discoveryEmptyBody =>
      'Tippen Sie auf „Suchtyp hinzufügen“, um zu starten.\nHäufig: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Kopiert: $label';
  }

  @override
  String get alreadyBrowsingType => 'Dieser Typ wird bereits durchsucht';

  @override
  String get resolveFailedRetry =>
      'Auflösung fehlgeschlagen (später erneut versuchen)';

  @override
  String get copyTypeTooltip => 'Typ kopieren';

  @override
  String get stop => 'Stoppen';

  @override
  String errorWithMessage(Object message) {
    return 'Fehler: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown von $total Diensten';
  }

  @override
  String searchingForType(Object type) {
    return 'Suche nach „$type“…';
  }

  @override
  String get noMatchingServices => 'Keine Dienste entsprechen dem Filter';

  @override
  String get broadcastEmptyBody =>
      'Tippen Sie auf „Ankündigung hinzufügen“, um zu veröffentlichen.\nStellen Sie sicher, dass der Port frei ist.';

  @override
  String get stateInitializing => 'Initialisierung…';

  @override
  String get stateBroadcasting => 'Wird angekündigt';

  @override
  String get stateStopped => 'Gestoppt';

  @override
  String get stateStarting => 'Startet…';

  @override
  String get stopAndRemove => 'Stoppen & entfernen';

  @override
  String statusWithState(Object state) {
    return 'Status: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Dienstnamen kopieren';

  @override
  String hostLineUnresolved(Object port) {
    return 'Port $port · Host nicht aufgelöst';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Host & TXT auflösen';

  @override
  String resolveCallFailed(Object error) {
    return 'Auflösungsaufruf fehlgeschlagen: $error';
  }

  @override
  String get labelName => 'Name';

  @override
  String get labelType => 'Typ';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(nicht aufgelöst)';

  @override
  String get labelPort => 'Port';

  @override
  String get txtAttributesHeader => 'TXT-Einträge';

  @override
  String get txtNone => '(keine)';

  @override
  String get copyFullJsonButton => 'Vollständiges JSON kopieren';

  @override
  String copyFieldTooltip(Object field) {
    return '$field kopieren';
  }

  @override
  String get discoveryDialogTitle => 'Suchtyp hinzufügen';

  @override
  String get quickSelect => 'Schnellauswahl';

  @override
  String get typeNameFieldLabel => 'Typname (ohne führendes _)';

  @override
  String get typeNameFieldHint => 'z. B. http → _http._tcp';

  @override
  String get transportProtocol => 'Transport';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get startBrowsing => 'Suche starten';

  @override
  String get broadcastDialogTitle => 'Ankündigung hinzufügen';

  @override
  String get serviceNameFieldLabel => 'Anzeigename des Dienstes';

  @override
  String get broadcastTypeFieldLabel => 'Typ (z. B. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT-Attribute';

  @override
  String get add => 'Hinzufügen';

  @override
  String get keyFieldLabel => 'Schlüssel';

  @override
  String get valueFieldLabel => 'Wert';

  @override
  String get startBroadcast => 'Ankündigung starten';

  @override
  String get invalidPortRange => 'Gültigen Port eingeben (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Ankündigung konnte nicht starten: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Fehlgeschlagen: $error';
  }

  @override
  String get defaultHostLabel => 'Lokal';

  @override
  String get defaultServiceName => 'Dienst';

  @override
  String get languageDialogTitle => 'Sprache';

  @override
  String get languageFollowSystem => 'System folgen';

  @override
  String get txtCopyKeyTooltip => 'Schlüssel kopieren';

  @override
  String get txtCopyValueTooltip => 'Wert kopieren';

  @override
  String get txtCopyPairTooltip => 'Schlüssel=Wert kopieren';

  @override
  String get copyLabelServiceType => 'Diensttyp';

  @override
  String get copyLabelServiceName => 'Dienstname';

  @override
  String get copyLabelFullJson => 'vollständiges JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT-Schlüssel $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT-Wert $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Themenfarbe';

  @override
  String get themeColorDialogTitle => 'Akzentfarbe wählen';

  @override
  String get tooltipAppearance => 'Erscheinungsbild';

  @override
  String get appearanceDialogTitle => 'Erscheinungsbild';

  @override
  String get appearanceFollowSystem => 'Wie das System';

  @override
  String get appearanceLight => 'Hell';

  @override
  String get appearanceDark => 'Dunkel';
}
