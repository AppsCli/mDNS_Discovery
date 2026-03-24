// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'mDNS 検出';

  @override
  String get homeTitle => 'mDNS の検出と告知';

  @override
  String get tabDiscover => '検出';

  @override
  String get tabBroadcast => '告知';

  @override
  String get tooltipHelp => '説明';

  @override
  String get tooltipLanguage => '言語';

  @override
  String get dialogAboutTitle => 'mDNS について';

  @override
  String get dialogAboutBody =>
      '検出: DNS-SD タイプで LAN 上のサービスを閲覧します。ホストが未解決の場合は「ホストと TXT を解決」をタップ。\n\n告知: この端末でサービスを公開します（ポートが空いており OS が許可している必要があります）。\n\n各項目の横にコピー操作があります。詳細では 1 行または JSON 全体をコピーできます。\n\niOS では Info.plist の NSBonjourServices に閲覧するタイプを宣言してください。';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => '閲覧タイプを追加';

  @override
  String get fabAddBroadcast => '告知を追加';

  @override
  String get filterLabel => '名前 / タイプ / ホスト / ポートで絞り込み';

  @override
  String get discoveryEmptyBody =>
      '「閲覧タイプを追加」で開始します。\n例: _http._tcp、_ssh._tcp、_bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'コピーしました: $label';
  }

  @override
  String get alreadyBrowsingType => 'このタイプは既に閲覧中です';

  @override
  String get resolveFailedRetry => '解決に失敗しました（後でもう一度お試しください）';

  @override
  String get copyTypeTooltip => 'タイプをコピー';

  @override
  String get stop => '停止';

  @override
  String errorWithMessage(Object message) {
    return 'エラー: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$total 件中 $shown 件のサービス';
  }

  @override
  String searchingForType(Object type) {
    return '「$type」を検索中…';
  }

  @override
  String get noMatchingServices => '条件に一致するサービスはありません';

  @override
  String get broadcastEmptyBody =>
      '「告知を追加」で公開します。\nポートが他のアプリで使用されていないことを確認してください。';

  @override
  String get stateInitializing => '初期化中…';

  @override
  String get stateBroadcasting => '告知中';

  @override
  String get stateStopped => '停止済み';

  @override
  String get stateStarting => '起動中…';

  @override
  String get stopAndRemove => '停止して削除';

  @override
  String statusWithState(Object state) {
    return '状態: $state';
  }

  @override
  String get copyServiceNameTooltip => 'サービス名をコピー';

  @override
  String hostLineUnresolved(Object port) {
    return 'ポート $port · ホスト未解決';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'ホストと TXT を解決';

  @override
  String resolveCallFailed(Object error) {
    return '解決の呼び出しに失敗: $error';
  }

  @override
  String get labelName => '名前';

  @override
  String get labelType => 'タイプ';

  @override
  String get labelHost => 'ホスト';

  @override
  String get hostUnresolvedValue => '（未解決）';

  @override
  String get labelPort => 'ポート';

  @override
  String get txtAttributesHeader => 'TXT レコード';

  @override
  String get txtNone => '（なし）';

  @override
  String get copyFullJsonButton => 'JSON 全体をコピー';

  @override
  String copyFieldTooltip(Object field) {
    return '$fieldをコピー';
  }

  @override
  String get discoveryDialogTitle => '閲覧タイプを追加';

  @override
  String get quickSelect => 'クイック選択';

  @override
  String get typeNameFieldLabel => 'タイプ名（先頭の _ なし）';

  @override
  String get typeNameFieldHint => '例: http → _http._tcp';

  @override
  String get transportProtocol => 'トランスポート';

  @override
  String get cancel => 'キャンセル';

  @override
  String get startBrowsing => '閲覧を開始';

  @override
  String get broadcastDialogTitle => '告知を追加';

  @override
  String get serviceNameFieldLabel => 'サービス表示名';

  @override
  String get broadcastTypeFieldLabel => 'タイプ（例: http → _http._tcp）';

  @override
  String get txtAttrsSection => 'TXT 属性';

  @override
  String get add => '追加';

  @override
  String get keyFieldLabel => 'キー';

  @override
  String get valueFieldLabel => '値';

  @override
  String get startBroadcast => '告知を開始';

  @override
  String get invalidPortRange => '有効なポート (1–65535) を入力してください';

  @override
  String broadcastStartFailed(Object error) {
    return '告知を開始できませんでした: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return '失敗: $error';
  }

  @override
  String get defaultHostLabel => 'ローカル';

  @override
  String get defaultServiceName => 'サービス';

  @override
  String get languageDialogTitle => '言語';

  @override
  String get languageFollowSystem => 'システムに合わせる';

  @override
  String get txtCopyKeyTooltip => 'キーをコピー';

  @override
  String get txtCopyValueTooltip => '値をコピー';

  @override
  String get txtCopyPairTooltip => 'key=value をコピー';

  @override
  String get copyLabelServiceType => 'サービスタイプ';

  @override
  String get copyLabelServiceName => 'サービス名';

  @override
  String get copyLabelFullJson => 'JSON 全体';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT キー $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT 値 $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'テーマ色';

  @override
  String get themeColorDialogTitle => 'アクセント色を選ぶ';

  @override
  String get tooltipAppearance => '外観';

  @override
  String get appearanceDialogTitle => '外観';

  @override
  String get appearanceFollowSystem => 'システムに合わせる';

  @override
  String get appearanceLight => 'ライト';

  @override
  String get appearanceDark => 'ダーク';
}
