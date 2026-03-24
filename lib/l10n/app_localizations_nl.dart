// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'mDNS-detectie';

  @override
  String get homeTitle => 'mDNS-detectie en -aankondiging';

  @override
  String get tabDiscover => 'Ontdekken';

  @override
  String get tabBroadcast => 'Aankondigen';

  @override
  String get tooltipHelp => 'Info';

  @override
  String get tooltipLanguage => 'Taal';

  @override
  String get dialogAboutTitle => 'Over mDNS';

  @override
  String get dialogAboutBody =>
      'Ontdekken: blader LAN-services op DNS-SD-type. Als de host niet is opgelost, tik op «Host en TXT oplossen».\n\nAankondigen: publiceer een service op dit apparaat (poort moet vrij zijn en het OS moet het toestaan).\n\nKopieersnelkoppelingen naast items; in details één regel of volledige JSON kopiëren.\n\nOp iOS: typen declareren in NSBonjourServices in Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Bladertype toevoegen';

  @override
  String get fabAddBroadcast => 'Aankondiging toevoegen';

  @override
  String get filterLabel => 'Filteren op naam / type / host / poort';

  @override
  String get discoveryEmptyBody =>
      'Tik op «Bladertype toevoegen» om te beginnen.\nGangbaar: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Gekopieerd: $label';
  }

  @override
  String get alreadyBrowsingType => 'Dit type wordt al doorzocht';

  @override
  String get resolveFailedRetry => 'Oplossen mislukt (probeer later opnieuw)';

  @override
  String get copyTypeTooltip => 'Type kopiëren';

  @override
  String get stop => 'Stoppen';

  @override
  String errorWithMessage(Object message) {
    return 'Fout: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown van $total services';
  }

  @override
  String searchingForType(Object type) {
    return 'Zoeken naar «$type»…';
  }

  @override
  String get noMatchingServices => 'Geen services komen overeen met het filter';

  @override
  String get broadcastEmptyBody =>
      'Tik op «Aankondiging toevoegen» om te publiceren.\nZorg dat de poort niet in gebruik is.';

  @override
  String get stateInitializing => 'Initialiseren…';

  @override
  String get stateBroadcasting => 'Bezig met aankondigen';

  @override
  String get stateStopped => 'Gestopt';

  @override
  String get stateStarting => 'Starten…';

  @override
  String get stopAndRemove => 'Stoppen en verwijderen';

  @override
  String statusWithState(Object state) {
    return 'Status: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Servicenaam kopiëren';

  @override
  String hostLineUnresolved(Object port) {
    return 'Poort $port · host niet opgelost';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Host en TXT oplossen';

  @override
  String resolveCallFailed(Object error) {
    return 'Oplossingsaanroep mislukt: $error';
  }

  @override
  String get labelName => 'Naam';

  @override
  String get labelType => 'Type';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(niet opgelost)';

  @override
  String get labelPort => 'Poort';

  @override
  String get txtAttributesHeader => 'TXT-records';

  @override
  String get txtNone => '(geen)';

  @override
  String get copyFullJsonButton => 'Volledige JSON kopiëren';

  @override
  String copyFieldTooltip(Object field) {
    return '$field kopiëren';
  }

  @override
  String get discoveryDialogTitle => 'Bladertype toevoegen';

  @override
  String get quickSelect => 'Snelle keuze';

  @override
  String get typeNameFieldLabel => 'Typenaam (zonder voorloop _)';

  @override
  String get typeNameFieldHint => 'bijv. http → _http._tcp';

  @override
  String get transportProtocol => 'Transport';

  @override
  String get cancel => 'Annuleren';

  @override
  String get startBrowsing => 'Bladeren starten';

  @override
  String get broadcastDialogTitle => 'Aankondiging toevoegen';

  @override
  String get serviceNameFieldLabel => 'Weergavenaam van service';

  @override
  String get broadcastTypeFieldLabel => 'Type (bijv. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT-attributen';

  @override
  String get add => 'Toevoegen';

  @override
  String get keyFieldLabel => 'Sleutel';

  @override
  String get valueFieldLabel => 'Waarde';

  @override
  String get startBroadcast => 'Aankondiging starten';

  @override
  String get invalidPortRange => 'Voer een geldige poort in (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Aankondiging starten mislukt: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Mislukt: $error';
  }

  @override
  String get defaultHostLabel => 'Lokaal';

  @override
  String get defaultServiceName => 'Service';

  @override
  String get languageDialogTitle => 'Taal';

  @override
  String get languageFollowSystem => 'Systeem volgen';

  @override
  String get txtCopyKeyTooltip => 'Sleutel kopiëren';

  @override
  String get txtCopyValueTooltip => 'Waarde kopiëren';

  @override
  String get txtCopyPairTooltip => 'sleutel=waarde kopiëren';

  @override
  String get copyLabelServiceType => 'servicetype';

  @override
  String get copyLabelServiceName => 'servicenaam';

  @override
  String get copyLabelFullJson => 'volledige JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT-sleutel $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT-waarde $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Themakleur';

  @override
  String get themeColorDialogTitle => 'Accentkleur kiezen';

  @override
  String get tooltipAppearance => 'Weergave';

  @override
  String get appearanceDialogTitle => 'Weergave';

  @override
  String get appearanceFollowSystem => 'Zoals systeem';

  @override
  String get appearanceLight => 'Licht';

  @override
  String get appearanceDark => 'Donker';
}
