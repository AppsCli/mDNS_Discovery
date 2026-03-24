// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'mDNS 검색';

  @override
  String get homeTitle => 'mDNS 검색 및 브로드캐스트';

  @override
  String get tabDiscover => '검색';

  @override
  String get tabBroadcast => '브로드캐스트';

  @override
  String get tooltipHelp => '정보';

  @override
  String get tooltipLanguage => '언어';

  @override
  String get dialogAboutTitle => 'mDNS 정보';

  @override
  String get dialogAboutBody =>
      '검색: DNS-SD 유형으로 LAN 서비스를 탐색합니다. 호스트가 확인되지 않으면 «호스트 및 TXT 확인»을 누르세요.\n\n브로드캐스트: 이 기기에서 서비스를 게시합니다(포트가 비어 있어야 하며 OS가 허용해야 함).\n\n각 항목 옆에 복사 단축키가 있으며, 세부 정보에서 한 줄 또는 전체 JSON을 복사할 수 있습니다.\n\niOS에서는 Info.plist의 NSBonjourServices에 탐색할 유형을 선언하세요.';

  @override
  String get dialogGotIt => '확인';

  @override
  String get fabAddDiscoveryType => '검색 유형 추가';

  @override
  String get fabAddBroadcast => '브로드캐스트 추가';

  @override
  String get filterLabel => '이름 / 유형 / 호스트 / 포트로 필터';

  @override
  String get discoveryEmptyBody =>
      '«검색 유형 추가»를 눌러 시작하세요.\n자주 쓰는 값: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return '복사됨: $label';
  }

  @override
  String get alreadyBrowsingType => '이미 이 유형을 검색 중입니다';

  @override
  String get resolveFailedRetry => '확인 실패(나중에 다시 시도)';

  @override
  String get copyTypeTooltip => '유형 복사';

  @override
  String get stop => '중지';

  @override
  String errorWithMessage(Object message) {
    return '오류: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '서비스 $total개 중 $shown개';
  }

  @override
  String searchingForType(Object type) {
    return '«$type» 검색 중…';
  }

  @override
  String get noMatchingServices => '필터와 일치하는 서비스 없음';

  @override
  String get broadcastEmptyBody =>
      '«브로드캐스트 추가»를 눌러 게시하세요.\n포트가 사용 중이 아닌지 확인하세요.';

  @override
  String get stateInitializing => '초기화 중…';

  @override
  String get stateBroadcasting => '브로드캐스트 중';

  @override
  String get stateStopped => '중지됨';

  @override
  String get stateStarting => '시작 중…';

  @override
  String get stopAndRemove => '중지 및 제거';

  @override
  String statusWithState(Object state) {
    return '상태: $state';
  }

  @override
  String get copyServiceNameTooltip => '서비스 이름 복사';

  @override
  String hostLineUnresolved(Object port) {
    return '포트 $port · 호스트 미확인';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => '호스트 및 TXT 확인';

  @override
  String resolveCallFailed(Object error) {
    return '확인 호출 실패: $error';
  }

  @override
  String get labelName => '이름';

  @override
  String get labelType => '유형';

  @override
  String get labelHost => '호스트';

  @override
  String get hostUnresolvedValue => '(미확인)';

  @override
  String get labelPort => '포트';

  @override
  String get txtAttributesHeader => 'TXT 레코드';

  @override
  String get txtNone => '(없음)';

  @override
  String get copyFullJsonButton => '전체 JSON 복사';

  @override
  String copyFieldTooltip(Object field) {
    return '$field 복사';
  }

  @override
  String get discoveryDialogTitle => '검색 유형 추가';

  @override
  String get quickSelect => '빠른 선택';

  @override
  String get typeNameFieldLabel => '유형 이름(앞의 _ 없음)';

  @override
  String get typeNameFieldHint => '예: http → _http._tcp';

  @override
  String get transportProtocol => '전송';

  @override
  String get cancel => '취소';

  @override
  String get startBrowsing => '검색 시작';

  @override
  String get broadcastDialogTitle => '브로드캐스트 추가';

  @override
  String get serviceNameFieldLabel => '서비스 표시 이름';

  @override
  String get broadcastTypeFieldLabel => '유형(예: http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT 속성';

  @override
  String get add => '추가';

  @override
  String get keyFieldLabel => '키';

  @override
  String get valueFieldLabel => '값';

  @override
  String get startBroadcast => '브로드캐스트 시작';

  @override
  String get invalidPortRange => '유효한 포트(1–65535)를 입력하세요';

  @override
  String broadcastStartFailed(Object error) {
    return '브로드캐스트를 시작할 수 없음: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return '실패: $error';
  }

  @override
  String get defaultHostLabel => '로컬';

  @override
  String get defaultServiceName => '서비스';

  @override
  String get languageDialogTitle => '언어';

  @override
  String get languageFollowSystem => '시스템 따르기';

  @override
  String get txtCopyKeyTooltip => '키 복사';

  @override
  String get txtCopyValueTooltip => '값 복사';

  @override
  String get txtCopyPairTooltip => 'key=value 복사';

  @override
  String get copyLabelServiceType => '서비스 유형';

  @override
  String get copyLabelServiceName => '서비스 이름';

  @override
  String get copyLabelFullJson => '전체 JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT 키 $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT 값 $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => '테마 색';

  @override
  String get themeColorDialogTitle => '강조 색 선택';

  @override
  String get tooltipAppearance => '모양';

  @override
  String get appearanceDialogTitle => '모양';

  @override
  String get appearanceFollowSystem => '시스템과 같이';

  @override
  String get appearanceLight => '라이트';

  @override
  String get appearanceDark => '다크';
}
