// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Descoberta mDNS';

  @override
  String get homeTitle => 'Descoberta e anúncio mDNS';

  @override
  String get tabDiscover => 'Descobrir';

  @override
  String get tabBroadcast => 'Anunciar';

  @override
  String get tooltipHelp => 'Sobre';

  @override
  String get tooltipLanguage => 'Idioma';

  @override
  String get dialogAboutTitle => 'Sobre o mDNS';

  @override
  String get dialogAboutBody =>
      'Descobrir: navegue serviços na LAN por tipo DNS-SD. Se o host não estiver resolvido, toque em «Resolver host e TXT».\n\nAnunciar: publique um serviço neste dispositivo (a porta deve estar livre e o SO deve permitir).\n\nAtalhos de cópia ao lado dos itens; nos detalhes, copie uma linha ou o JSON completo.\n\nNo iOS, declare os tipos em NSBonjourServices no Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Adicionar tipo de busca';

  @override
  String get fabAddBroadcast => 'Adicionar anúncio';

  @override
  String get filterLabel => 'Filtrar por nome / tipo / host / porta';

  @override
  String get discoveryEmptyBody =>
      'Toque em «Adicionar tipo de busca» para começar.\nComuns: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Copiado: $label';
  }

  @override
  String get alreadyBrowsingType => 'Este tipo já está sendo buscado';

  @override
  String get resolveFailedRetry => 'Falha ao resolver (tente mais tarde)';

  @override
  String get copyTypeTooltip => 'Copiar tipo';

  @override
  String get stop => 'Parar';

  @override
  String errorWithMessage(Object message) {
    return 'Erro: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown de $total serviços';
  }

  @override
  String searchingForType(Object type) {
    return 'Procurando «$type»…';
  }

  @override
  String get noMatchingServices => 'Nenhum serviço corresponde ao filtro';

  @override
  String get broadcastEmptyBody =>
      'Toque em «Adicionar anúncio» para publicar.\nCertifique-se de que a porta não esteja em uso.';

  @override
  String get stateInitializing => 'Inicializando…';

  @override
  String get stateBroadcasting => 'Anunciando';

  @override
  String get stateStopped => 'Parado';

  @override
  String get stateStarting => 'Iniciando…';

  @override
  String get stopAndRemove => 'Parar e remover';

  @override
  String statusWithState(Object state) {
    return 'Estado: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Copiar nome do serviço';

  @override
  String hostLineUnresolved(Object port) {
    return 'Porta $port · host não resolvido';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Resolver host e TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Falha na chamada de resolução: $error';
  }

  @override
  String get labelName => 'Nome';

  @override
  String get labelType => 'Tipo';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(não resolvido)';

  @override
  String get labelPort => 'Porta';

  @override
  String get txtAttributesHeader => 'Registros TXT';

  @override
  String get txtNone => '(nenhum)';

  @override
  String get copyFullJsonButton => 'Copiar JSON completo';

  @override
  String copyFieldTooltip(Object field) {
    return 'Copiar $field';
  }

  @override
  String get discoveryDialogTitle => 'Adicionar tipo de busca';

  @override
  String get quickSelect => 'Seleção rápida';

  @override
  String get typeNameFieldLabel => 'Nome do tipo (sem _ inicial)';

  @override
  String get typeNameFieldHint => 'ex.: http → _http._tcp';

  @override
  String get transportProtocol => 'Transporte';

  @override
  String get cancel => 'Cancelar';

  @override
  String get startBrowsing => 'Iniciar busca';

  @override
  String get broadcastDialogTitle => 'Adicionar anúncio';

  @override
  String get serviceNameFieldLabel => 'Nome exibido do serviço';

  @override
  String get broadcastTypeFieldLabel => 'Tipo (ex.: http → _http._tcp)';

  @override
  String get txtAttrsSection => 'Atributos TXT';

  @override
  String get add => 'Adicionar';

  @override
  String get keyFieldLabel => 'Chave';

  @override
  String get valueFieldLabel => 'Valor';

  @override
  String get startBroadcast => 'Iniciar anúncio';

  @override
  String get invalidPortRange => 'Digite uma porta válida (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Não foi possível iniciar o anúncio: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Falha: $error';
  }

  @override
  String get defaultHostLabel => 'Local';

  @override
  String get defaultServiceName => 'Serviço';

  @override
  String get languageDialogTitle => 'Idioma';

  @override
  String get languageFollowSystem => 'Seguir o sistema';

  @override
  String get txtCopyKeyTooltip => 'Copiar chave';

  @override
  String get txtCopyValueTooltip => 'Copiar valor';

  @override
  String get txtCopyPairTooltip => 'Copiar chave=valor';

  @override
  String get copyLabelServiceType => 'tipo de serviço';

  @override
  String get copyLabelServiceName => 'nome do serviço';

  @override
  String get copyLabelFullJson => 'JSON completo';

  @override
  String copyLabelTxtKey(Object key) {
    return 'chave TXT $key';
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
  String get tooltipThemeColor => 'Cor do tema';

  @override
  String get themeColorDialogTitle => 'Escolher cor de destaque';

  @override
  String get tooltipAppearance => 'Aparência';

  @override
  String get appearanceDialogTitle => 'Aparência';

  @override
  String get appearanceFollowSystem => 'Seguir o sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Escuro';
}
