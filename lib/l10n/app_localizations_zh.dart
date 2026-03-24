// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'mDNS 发现';

  @override
  String get homeTitle => 'mDNS 发现与广播';

  @override
  String get tabDiscover => '发现';

  @override
  String get tabBroadcast => '广播';

  @override
  String get tooltipHelp => '说明';

  @override
  String get tooltipLanguage => '语言';

  @override
  String get dialogAboutTitle => '关于 mDNS';

  @override
  String get dialogAboutBody =>
      '发现：按 DNS-SD 类型浏览局域网服务，未解析主机时可点「解析主机与 TXT」。\n\n广播：在本机发布服务（需端口未被占用且系统允许）。\n\n每项旁可复制；详情内可复制单行或整段 JSON。\n\niOS 需在 Info.plist 的 NSBonjourServices 中声明要浏览的类型。';

  @override
  String get dialogGotIt => '知道了';

  @override
  String get fabAddDiscoveryType => '添加浏览类型';

  @override
  String get fabAddBroadcast => '添加广播';

  @override
  String get filterLabel => '按名称 / 类型 / 主机 / 端口筛选';

  @override
  String get discoveryEmptyBody =>
      '点击右下角「添加浏览类型」开始发现。\n常用：_http._tcp、_ssh._tcp、_bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return '已复制：$label';
  }

  @override
  String get alreadyBrowsingType => '已在浏览该类型';

  @override
  String get resolveFailedRetry => '解析失败（可稍后重试）';

  @override
  String get copyTypeTooltip => '复制类型';

  @override
  String get stop => '停止';

  @override
  String errorWithMessage(Object message) {
    return '错误：$message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '已发现 $shown/$total 个服务';
  }

  @override
  String searchingForType(Object type) {
    return '正在搜索「$type」…';
  }

  @override
  String get noMatchingServices => '无匹配筛选条件的服务';

  @override
  String get broadcastEmptyBody => '点击右下角「添加广播」发布服务。\n请确保端口未被其他程序占用。';

  @override
  String get stateInitializing => '初始化…';

  @override
  String get stateBroadcasting => '广播中';

  @override
  String get stateStopped => '已停止';

  @override
  String get stateStarting => '启动中…';

  @override
  String get stopAndRemove => '停止并移除';

  @override
  String statusWithState(Object state) {
    return '状态：$state';
  }

  @override
  String get copyServiceNameTooltip => '复制服务名';

  @override
  String hostLineUnresolved(Object port) {
    return '端口 $port · 主机未解析';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => '解析主机与 TXT';

  @override
  String resolveCallFailed(Object error) {
    return '解析调用失败：$error';
  }

  @override
  String get labelName => '名称';

  @override
  String get labelType => '类型';

  @override
  String get labelHost => '主机';

  @override
  String get hostUnresolvedValue => '（未解析）';

  @override
  String get labelPort => '端口';

  @override
  String get txtAttributesHeader => 'TXT 属性';

  @override
  String get txtNone => '（无）';

  @override
  String get copyFullJsonButton => '复制完整 JSON';

  @override
  String copyFieldTooltip(Object field) {
    return '复制$field';
  }

  @override
  String get discoveryDialogTitle => '添加浏览类型';

  @override
  String get quickSelect => '快捷选择';

  @override
  String get typeNameFieldLabel => '类型名（不含下划线前缀）';

  @override
  String get typeNameFieldHint => '例如 http → _http._tcp';

  @override
  String get transportProtocol => '传输协议';

  @override
  String get cancel => '取消';

  @override
  String get startBrowsing => '开始浏览';

  @override
  String get broadcastDialogTitle => '添加广播服务';

  @override
  String get serviceNameFieldLabel => '服务显示名称';

  @override
  String get broadcastTypeFieldLabel => '类型（如 http → _http._tcp）';

  @override
  String get txtAttrsSection => 'TXT 属性';

  @override
  String get add => '添加';

  @override
  String get keyFieldLabel => '键';

  @override
  String get valueFieldLabel => '值';

  @override
  String get startBroadcast => '开始广播';

  @override
  String get invalidPortRange => '请输入有效端口 1–65535';

  @override
  String broadcastStartFailed(Object error) {
    return '广播启动失败：$error';
  }

  @override
  String stateFailedWithError(Object error) {
    return '失败：$error';
  }

  @override
  String get defaultHostLabel => '本机';

  @override
  String get defaultServiceName => '服务';

  @override
  String get languageDialogTitle => '语言';

  @override
  String get languageFollowSystem => '跟随系统';

  @override
  String get txtCopyKeyTooltip => '复制键';

  @override
  String get txtCopyValueTooltip => '复制值';

  @override
  String get txtCopyPairTooltip => '复制 key=value';

  @override
  String get copyLabelServiceType => '服务类型';

  @override
  String get copyLabelServiceName => '服务名';

  @override
  String get copyLabelFullJson => '完整 JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT 键 $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT 值 $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => '主题色';

  @override
  String get themeColorDialogTitle => '选择主题色';

  @override
  String get tooltipAppearance => '外观';

  @override
  String get appearanceDialogTitle => '外观';

  @override
  String get appearanceFollowSystem => '跟随系统';

  @override
  String get appearanceLight => '浅色';

  @override
  String get appearanceDark => '深色';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => 'mDNS 探索';

  @override
  String get homeTitle => 'mDNS 探索與廣播';

  @override
  String get tabDiscover => '探索';

  @override
  String get tabBroadcast => '廣播';

  @override
  String get tooltipHelp => '說明';

  @override
  String get tooltipLanguage => '語言';

  @override
  String get dialogAboutTitle => '關於 mDNS';

  @override
  String get dialogAboutBody =>
      '探索：依 DNS-SD 類型瀏覽區網服務；主機未解析時可點「解析主機與 TXT」。\n\n廣播：在此裝置發布服務（連接埠須可用且系統允許）。\n\n項目旁可複製；詳情內可複製單行或完整 JSON。\n\niOS 須在 Info.plist 的 NSBonjourServices 宣告要瀏覽的類型。';

  @override
  String get dialogGotIt => '知道了';

  @override
  String get fabAddDiscoveryType => '新增瀏覽類型';

  @override
  String get fabAddBroadcast => '新增廣播';

  @override
  String get filterLabel => '依名稱 / 類型 / 主機 / 連接埠篩選';

  @override
  String get discoveryEmptyBody =>
      '點右下角「新增瀏覽類型」開始探索。\n常用：_http._tcp、_ssh._tcp、_bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return '已複製：$label';
  }

  @override
  String get alreadyBrowsingType => '已在瀏覽此類型';

  @override
  String get resolveFailedRetry => '解析失敗（可稍後重試）';

  @override
  String get copyTypeTooltip => '複製類型';

  @override
  String get stop => '停止';

  @override
  String errorWithMessage(Object message) {
    return '錯誤：$message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '已探索 $shown/$total 個服務';
  }

  @override
  String searchingForType(Object type) {
    return '正在搜尋「$type」…';
  }

  @override
  String get noMatchingServices => '沒有符合篩選條件的服務';

  @override
  String get broadcastEmptyBody => '點右下角「新增廣播」發布服務。\n請確認連接埠未被其他程式占用。';

  @override
  String get stateInitializing => '初始化中…';

  @override
  String get stateBroadcasting => '廣播中';

  @override
  String get stateStopped => '已停止';

  @override
  String get stateStarting => '啟動中…';

  @override
  String get stopAndRemove => '停止並移除';

  @override
  String statusWithState(Object state) {
    return '狀態：$state';
  }

  @override
  String get copyServiceNameTooltip => '複製服務名稱';

  @override
  String hostLineUnresolved(Object port) {
    return '連接埠 $port · 主機未解析';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => '解析主機與 TXT';

  @override
  String resolveCallFailed(Object error) {
    return '解析呼叫失敗：$error';
  }

  @override
  String get labelName => '名稱';

  @override
  String get labelType => '類型';

  @override
  String get labelHost => '主機';

  @override
  String get hostUnresolvedValue => '（未解析）';

  @override
  String get labelPort => '連接埠';

  @override
  String get txtAttributesHeader => 'TXT 屬性';

  @override
  String get txtNone => '（無）';

  @override
  String get copyFullJsonButton => '複製完整 JSON';

  @override
  String copyFieldTooltip(Object field) {
    return '複製$field';
  }

  @override
  String get discoveryDialogTitle => '新增瀏覽類型';

  @override
  String get quickSelect => '快速選擇';

  @override
  String get typeNameFieldLabel => '類型名稱（不含底線前綴）';

  @override
  String get typeNameFieldHint => '例如 http → _http._tcp';

  @override
  String get transportProtocol => '傳輸協定';

  @override
  String get cancel => '取消';

  @override
  String get startBrowsing => '開始瀏覽';

  @override
  String get broadcastDialogTitle => '新增廣播服務';

  @override
  String get serviceNameFieldLabel => '服務顯示名稱';

  @override
  String get broadcastTypeFieldLabel => '類型（如 http → _http._tcp）';

  @override
  String get txtAttrsSection => 'TXT 屬性';

  @override
  String get add => '新增';

  @override
  String get keyFieldLabel => '鍵';

  @override
  String get valueFieldLabel => '值';

  @override
  String get startBroadcast => '開始廣播';

  @override
  String get invalidPortRange => '請輸入有效連接埠 1–65535';

  @override
  String broadcastStartFailed(Object error) {
    return '廣播啟動失敗：$error';
  }

  @override
  String stateFailedWithError(Object error) {
    return '失敗：$error';
  }

  @override
  String get defaultHostLabel => '本機';

  @override
  String get defaultServiceName => '服務';

  @override
  String get languageDialogTitle => '語言';

  @override
  String get languageFollowSystem => '跟隨系統';

  @override
  String get txtCopyKeyTooltip => '複製鍵';

  @override
  String get txtCopyValueTooltip => '複製值';

  @override
  String get txtCopyPairTooltip => '複製 key=value';

  @override
  String get copyLabelServiceType => '服務類型';

  @override
  String get copyLabelServiceName => '服務名稱';

  @override
  String get copyLabelFullJson => '完整 JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT 鍵 $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT 值 $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => '主題色彩';

  @override
  String get themeColorDialogTitle => '選擇主題色彩';

  @override
  String get tooltipAppearance => '外觀';

  @override
  String get appearanceDialogTitle => '外觀';

  @override
  String get appearanceFollowSystem => '跟隨系統';

  @override
  String get appearanceLight => '淺色';

  @override
  String get appearanceDark => '深色';
}
