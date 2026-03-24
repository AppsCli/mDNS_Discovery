// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Descubrimiento mDNS';

  @override
  String get homeTitle => 'Descubrimiento y difusión mDNS';

  @override
  String get tabDiscover => 'Descubrir';

  @override
  String get tabBroadcast => 'Difundir';

  @override
  String get tooltipHelp => 'Acerca de';

  @override
  String get tooltipLanguage => 'Idioma';

  @override
  String get dialogAboutTitle => 'Acerca de mDNS';

  @override
  String get dialogAboutBody =>
      'Descubrir: explora servicios en la LAN por tipo DNS-SD. Si el host no está resuelto, pulsa «Resolver host y TXT».\n\nDifundir: publica un servicio en este dispositivo (el puerto debe estar libre y el SO debe permitirlo).\n\nHay accesos para copiar junto a cada elemento; en los detalles puedes copiar una línea o el JSON completo.\n\nEn iOS, declara los tipos en NSBonjourServices en Info.plist.';

  @override
  String get dialogGotIt => 'Entendido';

  @override
  String get fabAddDiscoveryType => 'Añadir tipo de exploración';

  @override
  String get fabAddBroadcast => 'Añadir difusión';

  @override
  String get filterLabel => 'Filtrar por nombre / tipo / host / puerto';

  @override
  String get discoveryEmptyBody =>
      'Pulsa «Añadir tipo de exploración» para empezar.\nComunes: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Copiado: $label';
  }

  @override
  String get alreadyBrowsingType => 'Ya se está explorando este tipo';

  @override
  String get resolveFailedRetry => 'Error al resolver (inténtalo más tarde)';

  @override
  String get copyTypeTooltip => 'Copiar tipo';

  @override
  String get stop => 'Detener';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown de $total servicios';
  }

  @override
  String searchingForType(Object type) {
    return 'Buscando «$type»…';
  }

  @override
  String get noMatchingServices => 'Ningún servicio coincide con el filtro';

  @override
  String get broadcastEmptyBody =>
      'Pulsa «Añadir difusión» para publicar.\nAsegúrate de que el puerto no esté en uso.';

  @override
  String get stateInitializing => 'Inicializando…';

  @override
  String get stateBroadcasting => 'Difundiendo';

  @override
  String get stateStopped => 'Detenido';

  @override
  String get stateStarting => 'Iniciando…';

  @override
  String get stopAndRemove => 'Detener y quitar';

  @override
  String statusWithState(Object state) {
    return 'Estado: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Copiar nombre del servicio';

  @override
  String hostLineUnresolved(Object port) {
    return 'Puerto $port · host no resuelto';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Resolver host y TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Fallo al resolver: $error';
  }

  @override
  String get labelName => 'Nombre';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(sin resolver)';

  @override
  String get labelPort => 'Puerto';

  @override
  String get txtAttributesHeader => 'Registros TXT';

  @override
  String get txtNone => '(ninguno)';

  @override
  String get copyFullJsonButton => 'Copiar JSON completo';

  @override
  String copyFieldTooltip(Object field) {
    return 'Copiar $field';
  }

  @override
  String get discoveryDialogTitle => 'Añadir tipo de exploración';

  @override
  String get quickSelect => 'Selección rápida';

  @override
  String get typeNameFieldLabel => 'Nombre del tipo (sin _ inicial)';

  @override
  String get typeNameFieldHint => 'p. ej. http → _http._tcp';

  @override
  String get transportProtocol => 'Transporte';

  @override
  String get cancel => 'Cancelar';

  @override
  String get startBrowsing => 'Empezar a explorar';

  @override
  String get broadcastDialogTitle => 'Añadir difusión';

  @override
  String get serviceNameFieldLabel => 'Nombre visible del servicio';

  @override
  String get broadcastTypeFieldLabel => 'Tipo (p. ej. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'Atributos TXT';

  @override
  String get add => 'Añadir';

  @override
  String get keyFieldLabel => 'Clave';

  @override
  String get valueFieldLabel => 'Valor';

  @override
  String get startBroadcast => 'Iniciar difusión';

  @override
  String get invalidPortRange => 'Introduce un puerto válido (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'No se pudo iniciar la difusión: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Fallo: $error';
  }

  @override
  String get defaultHostLabel => 'Local';

  @override
  String get defaultServiceName => 'Servicio';

  @override
  String get languageDialogTitle => 'Idioma';

  @override
  String get languageFollowSystem => 'Según el sistema';

  @override
  String get txtCopyKeyTooltip => 'Copiar clave';

  @override
  String get txtCopyValueTooltip => 'Copiar valor';

  @override
  String get txtCopyPairTooltip => 'Copiar clave=valor';

  @override
  String get copyLabelServiceType => 'tipo de servicio';

  @override
  String get copyLabelServiceName => 'nombre del servicio';

  @override
  String get copyLabelFullJson => 'JSON completo';

  @override
  String copyLabelTxtKey(Object key) {
    return 'clave TXT $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'valor TXT $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Color del tema';

  @override
  String get themeColorDialogTitle => 'Elegir color de acento';

  @override
  String get tooltipAppearance => 'Apariencia';

  @override
  String get appearanceDialogTitle => 'Apariencia';

  @override
  String get appearanceFollowSystem => 'Según el sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Oscuro';
}
