// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Découverte mDNS';

  @override
  String get homeTitle => 'Découverte et annonce mDNS';

  @override
  String get tabDiscover => 'Découvrir';

  @override
  String get tabBroadcast => 'Annoncer';

  @override
  String get tooltipHelp => 'À propos';

  @override
  String get tooltipLanguage => 'Langue';

  @override
  String get dialogAboutTitle => 'À propos de mDNS';

  @override
  String get dialogAboutBody =>
      'Découvrir : parcourir les services du réseau local par type DNS-SD. Si l’hôte n’est pas résolu, appuyez sur « Résoudre l’hôte et TXT ».\n\nAnnoncer : publier un service sur cet appareil (le port doit être libre et l’OS doit l’autoriser).\n\nRaccourcis de copie à côté des éléments ; dans les détails, copiez une ligne ou le JSON complet.\n\nSur iOS, déclarez les types dans NSBonjourServices dans Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Ajouter un type à parcourir';

  @override
  String get fabAddBroadcast => 'Ajouter une annonce';

  @override
  String get filterLabel => 'Filtrer par nom / type / hôte / port';

  @override
  String get discoveryEmptyBody =>
      'Appuyez sur « Ajouter un type à parcourir » pour commencer.\nCourants : _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Copié : $label';
  }

  @override
  String get alreadyBrowsingType => 'Ce type est déjà parcouru';

  @override
  String get resolveFailedRetry => 'Échec de résolution (réessayez plus tard)';

  @override
  String get copyTypeTooltip => 'Copier le type';

  @override
  String get stop => 'Arrêter';

  @override
  String errorWithMessage(Object message) {
    return 'Erreur : $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown sur $total services';
  }

  @override
  String searchingForType(Object type) {
    return 'Recherche de « $type »…';
  }

  @override
  String get noMatchingServices => 'Aucun service ne correspond au filtre';

  @override
  String get broadcastEmptyBody =>
      'Appuyez sur « Ajouter une annonce » pour publier.\nVérifiez que le port n’est pas utilisé.';

  @override
  String get stateInitializing => 'Initialisation…';

  @override
  String get stateBroadcasting => 'Annonce en cours';

  @override
  String get stateStopped => 'Arrêté';

  @override
  String get stateStarting => 'Démarrage…';

  @override
  String get stopAndRemove => 'Arrêter et retirer';

  @override
  String statusWithState(Object state) {
    return 'État : $state';
  }

  @override
  String get copyServiceNameTooltip => 'Copier le nom du service';

  @override
  String hostLineUnresolved(Object port) {
    return 'Port $port · hôte non résolu';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Résoudre l’hôte et TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Échec de l’appel de résolution : $error';
  }

  @override
  String get labelName => 'Nom';

  @override
  String get labelType => 'Type';

  @override
  String get labelHost => 'Hôte';

  @override
  String get hostUnresolvedValue => '(non résolu)';

  @override
  String get labelPort => 'Port';

  @override
  String get txtAttributesHeader => 'Enregistrements TXT';

  @override
  String get txtNone => '(aucun)';

  @override
  String get copyFullJsonButton => 'Copier le JSON complet';

  @override
  String copyFieldTooltip(Object field) {
    return 'Copier $field';
  }

  @override
  String get discoveryDialogTitle => 'Ajouter un type à parcourir';

  @override
  String get quickSelect => 'Choix rapide';

  @override
  String get typeNameFieldLabel => 'Nom du type (sans _ initial)';

  @override
  String get typeNameFieldHint => 'ex. http → _http._tcp';

  @override
  String get transportProtocol => 'Transport';

  @override
  String get cancel => 'Annuler';

  @override
  String get startBrowsing => 'Commencer le parcours';

  @override
  String get broadcastDialogTitle => 'Ajouter une annonce';

  @override
  String get serviceNameFieldLabel => 'Nom affiché du service';

  @override
  String get broadcastTypeFieldLabel => 'Type (ex. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'Attributs TXT';

  @override
  String get add => 'Ajouter';

  @override
  String get keyFieldLabel => 'Clé';

  @override
  String get valueFieldLabel => 'Valeur';

  @override
  String get startBroadcast => 'Démarrer l’annonce';

  @override
  String get invalidPortRange => 'Entrez un port valide (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Impossible de démarrer l’annonce : $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Échec : $error';
  }

  @override
  String get defaultHostLabel => 'Local';

  @override
  String get defaultServiceName => 'Service';

  @override
  String get languageDialogTitle => 'Langue';

  @override
  String get languageFollowSystem => 'Suivre le système';

  @override
  String get txtCopyKeyTooltip => 'Copier la clé';

  @override
  String get txtCopyValueTooltip => 'Copier la valeur';

  @override
  String get txtCopyPairTooltip => 'Copier clé=valeur';

  @override
  String get copyLabelServiceType => 'type de service';

  @override
  String get copyLabelServiceName => 'nom du service';

  @override
  String get copyLabelFullJson => 'JSON complet';

  @override
  String copyLabelTxtKey(Object key) {
    return 'clé TXT $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'valeur TXT $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Couleur du thème';

  @override
  String get themeColorDialogTitle => 'Choisir la couleur d’accent';

  @override
  String get tooltipAppearance => 'Apparence';

  @override
  String get appearanceDialogTitle => 'Apparence';

  @override
  String get appearanceFollowSystem => 'Comme le système';

  @override
  String get appearanceLight => 'Clair';

  @override
  String get appearanceDark => 'Sombre';
}
