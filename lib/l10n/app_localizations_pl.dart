// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Wykrywanie mDNS';

  @override
  String get homeTitle => 'Wykrywanie i ogłaszanie mDNS';

  @override
  String get tabDiscover => 'Odkrywaj';

  @override
  String get tabBroadcast => 'Ogłaszaj';

  @override
  String get tooltipHelp => 'Informacje';

  @override
  String get tooltipLanguage => 'Język';

  @override
  String get dialogAboutTitle => 'O mDNS';

  @override
  String get dialogAboutBody =>
      'Odkrywaj: przeglądaj usługi w LAN według typu DNS-SD. Jeśli host nie jest rozwiązany, stuknij «Rozwiąż host i TXT».\n\nOgłaszaj: publikuj usługę na tym urządzeniu (port musi być wolny, a system musi na to pozwalać).\n\nSkróty kopiowania przy elementach; w szczegółach skopiuj wiersz lub pełny JSON.\n\nNa iOS zadeklaruj typy w NSBonjourServices w Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Dodaj typ przeglądania';

  @override
  String get fabAddBroadcast => 'Dodaj ogłoszenie';

  @override
  String get filterLabel => 'Filtruj po nazwie / typie / hoście / porcie';

  @override
  String get discoveryEmptyBody =>
      'Stuknij «Dodaj typ przeglądania», aby zacząć.\nTypowe: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Skopiowano: $label';
  }

  @override
  String get alreadyBrowsingType => 'Ten typ jest już przeglądany';

  @override
  String get resolveFailedRetry => 'Nie udało się rozwiązać (spróbuj później)';

  @override
  String get copyTypeTooltip => 'Kopiuj typ';

  @override
  String get stop => 'Zatrzymaj';

  @override
  String errorWithMessage(Object message) {
    return 'Błąd: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown z $total usług';
  }

  @override
  String searchingForType(Object type) {
    return 'Szukanie «$type»…';
  }

  @override
  String get noMatchingServices => 'Brak usług pasujących do filtra';

  @override
  String get broadcastEmptyBody =>
      'Stuknij «Dodaj ogłoszenie», aby opublikować.\nUpewnij się, że port jest wolny.';

  @override
  String get stateInitializing => 'Inicjowanie…';

  @override
  String get stateBroadcasting => 'Ogłaszanie';

  @override
  String get stateStopped => 'Zatrzymano';

  @override
  String get stateStarting => 'Uruchamianie…';

  @override
  String get stopAndRemove => 'Zatrzymaj i usuń';

  @override
  String statusWithState(Object state) {
    return 'Stan: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Kopiuj nazwę usługi';

  @override
  String hostLineUnresolved(Object port) {
    return 'Port $port · host nierozwiązany';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Rozwiąż host i TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Wywołanie rozwiązania nie powiodło się: $error';
  }

  @override
  String get labelName => 'Nazwa';

  @override
  String get labelType => 'Typ';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(nierozwiązany)';

  @override
  String get labelPort => 'Port';

  @override
  String get txtAttributesHeader => 'Rekordy TXT';

  @override
  String get txtNone => '(brak)';

  @override
  String get copyFullJsonButton => 'Kopiuj pełny JSON';

  @override
  String copyFieldTooltip(Object field) {
    return 'Kopiuj $field';
  }

  @override
  String get discoveryDialogTitle => 'Dodaj typ przeglądania';

  @override
  String get quickSelect => 'Szybki wybór';

  @override
  String get typeNameFieldLabel => 'Nazwa typu (bez początkowego _)';

  @override
  String get typeNameFieldHint => 'np. http → _http._tcp';

  @override
  String get transportProtocol => 'Transport';

  @override
  String get cancel => 'Anuluj';

  @override
  String get startBrowsing => 'Rozpocznij przeglądanie';

  @override
  String get broadcastDialogTitle => 'Dodaj ogłoszenie';

  @override
  String get serviceNameFieldLabel => 'Wyświetlana nazwa usługi';

  @override
  String get broadcastTypeFieldLabel => 'Typ (np. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'Atrybuty TXT';

  @override
  String get add => 'Dodaj';

  @override
  String get keyFieldLabel => 'Klucz';

  @override
  String get valueFieldLabel => 'Wartość';

  @override
  String get startBroadcast => 'Rozpocznij ogłaszanie';

  @override
  String get invalidPortRange => 'Podaj prawidłowy port (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Nie można uruchomić ogłaszania: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Niepowodzenie: $error';
  }

  @override
  String get defaultHostLabel => 'Lokalny';

  @override
  String get defaultServiceName => 'Usługa';

  @override
  String get languageDialogTitle => 'Język';

  @override
  String get languageFollowSystem => 'Zgodnie z systemem';

  @override
  String get txtCopyKeyTooltip => 'Kopiuj klucz';

  @override
  String get txtCopyValueTooltip => 'Kopiuj wartość';

  @override
  String get txtCopyPairTooltip => 'Kopiuj klucz=wartość';

  @override
  String get copyLabelServiceType => 'typ usługi';

  @override
  String get copyLabelServiceName => 'nazwa usługi';

  @override
  String get copyLabelFullJson => 'pełny JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'klucz TXT $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'wartość TXT $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Kolor motywu';

  @override
  String get themeColorDialogTitle => 'Wybierz kolor akcentu';

  @override
  String get tooltipAppearance => 'Wygląd';

  @override
  String get appearanceDialogTitle => 'Wygląd';

  @override
  String get appearanceFollowSystem => 'Jak w systemie';

  @override
  String get appearanceLight => 'Jasny';

  @override
  String get appearanceDark => 'Ciemny';
}
