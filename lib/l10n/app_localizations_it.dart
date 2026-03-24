// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Rilevamento mDNS';

  @override
  String get homeTitle => 'Rilevamento e annuncio mDNS';

  @override
  String get tabDiscover => 'Rileva';

  @override
  String get tabBroadcast => 'Annuncia';

  @override
  String get tooltipHelp => 'Info';

  @override
  String get tooltipLanguage => 'Lingua';

  @override
  String get dialogAboutTitle => 'Informazioni su mDNS';

  @override
  String get dialogAboutBody =>
      'Rileva: esplora i servizi sulla LAN per tipo DNS-SD. Se l’host non è risolto, tocca «Risolvi host e TXT».\n\nAnnuncia: pubblica un servizio su questo dispositivo (la porta deve essere libera e il SO deve consentirlo).\n\nScorciatoie di copia accanto agli elementi; nei dettagli copia una riga o il JSON completo.\n\nSu iOS dichiara i tipi in NSBonjourServices in Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Aggiungi tipo di ricerca';

  @override
  String get fabAddBroadcast => 'Aggiungi annuncio';

  @override
  String get filterLabel => 'Filtra per nome / tipo / host / porta';

  @override
  String get discoveryEmptyBody =>
      'Tocca «Aggiungi tipo di ricerca» per iniziare.\nComuni: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Copiato: $label';
  }

  @override
  String get alreadyBrowsingType => 'Questo tipo è già in ricerca';

  @override
  String get resolveFailedRetry =>
      'Risoluzione non riuscita (riprova più tardi)';

  @override
  String get copyTypeTooltip => 'Copia tipo';

  @override
  String get stop => 'Stop';

  @override
  String errorWithMessage(Object message) {
    return 'Errore: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown di $total servizi';
  }

  @override
  String searchingForType(Object type) {
    return 'Ricerca di «$type»…';
  }

  @override
  String get noMatchingServices => 'Nessun servizio corrisponde al filtro';

  @override
  String get broadcastEmptyBody =>
      'Tocca «Aggiungi annuncio» per pubblicare.\nAssicurati che la porta non sia in uso.';

  @override
  String get stateInitializing => 'Inizializzazione…';

  @override
  String get stateBroadcasting => 'In annuncio';

  @override
  String get stateStopped => 'Fermato';

  @override
  String get stateStarting => 'Avvio…';

  @override
  String get stopAndRemove => 'Ferma e rimuovi';

  @override
  String statusWithState(Object state) {
    return 'Stato: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Copia nome servizio';

  @override
  String hostLineUnresolved(Object port) {
    return 'Porta $port · host non risolto';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Risolvi host e TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Chiamata di risoluzione non riuscita: $error';
  }

  @override
  String get labelName => 'Nome';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(non risolto)';

  @override
  String get labelPort => 'Porta';

  @override
  String get txtAttributesHeader => 'Record TXT';

  @override
  String get txtNone => '(nessuno)';

  @override
  String get copyFullJsonButton => 'Copia JSON completo';

  @override
  String copyFieldTooltip(Object field) {
    return 'Copia $field';
  }

  @override
  String get discoveryDialogTitle => 'Aggiungi tipo di ricerca';

  @override
  String get quickSelect => 'Scelta rapida';

  @override
  String get typeNameFieldLabel => 'Nome tipo (senza _ iniziale)';

  @override
  String get typeNameFieldHint => 'es. http → _http._tcp';

  @override
  String get transportProtocol => 'Trasporto';

  @override
  String get cancel => 'Annulla';

  @override
  String get startBrowsing => 'Inizia ricerca';

  @override
  String get broadcastDialogTitle => 'Aggiungi annuncio';

  @override
  String get serviceNameFieldLabel => 'Nome visualizzato del servizio';

  @override
  String get broadcastTypeFieldLabel => 'Tipo (es. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'Attributi TXT';

  @override
  String get add => 'Aggiungi';

  @override
  String get keyFieldLabel => 'Chiave';

  @override
  String get valueFieldLabel => 'Valore';

  @override
  String get startBroadcast => 'Avvia annuncio';

  @override
  String get invalidPortRange => 'Inserisci una porta valida (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Impossibile avviare l’annuncio: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Operazione non riuscita: $error';
  }

  @override
  String get defaultHostLabel => 'Locale';

  @override
  String get defaultServiceName => 'Servizio';

  @override
  String get languageDialogTitle => 'Lingua';

  @override
  String get languageFollowSystem => 'Segui il sistema';

  @override
  String get txtCopyKeyTooltip => 'Copia chiave';

  @override
  String get txtCopyValueTooltip => 'Copia valore';

  @override
  String get txtCopyPairTooltip => 'Copia chiave=valore';

  @override
  String get copyLabelServiceType => 'tipo di servizio';

  @override
  String get copyLabelServiceName => 'nome servizio';

  @override
  String get copyLabelFullJson => 'JSON completo';

  @override
  String copyLabelTxtKey(Object key) {
    return 'chiave TXT $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'valore TXT $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Colore tema';

  @override
  String get themeColorDialogTitle => 'Scegli colore di accento';

  @override
  String get tooltipAppearance => 'Aspetto';

  @override
  String get appearanceDialogTitle => 'Aspetto';

  @override
  String get appearanceFollowSystem => 'Come il sistema';

  @override
  String get appearanceLight => 'Chiaro';

  @override
  String get appearanceDark => 'Scuro';
}
