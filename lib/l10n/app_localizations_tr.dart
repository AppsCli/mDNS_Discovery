// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'mDNS Keşfi';

  @override
  String get homeTitle => 'mDNS keşfi ve yayını';

  @override
  String get tabDiscover => 'Keşfet';

  @override
  String get tabBroadcast => 'Yayınla';

  @override
  String get tooltipHelp => 'Hakkında';

  @override
  String get tooltipLanguage => 'Dil';

  @override
  String get dialogAboutTitle => 'mDNS hakkında';

  @override
  String get dialogAboutBody =>
      'Keşfet: DNS-SD türüne göre LAN hizmetlerine göz atın. Ana bilgisayar çözülmediyse «Ana bilgisayar ve TXT’yi çöz»e dokunun.\n\nYayınla: Bu cihazda bir hizmet yayınlayın (bağlantı noktası boş olmalı ve işletim sistemi izin vermelidir).\n\nÖğelerin yanında kopyalama kısayolları; ayrıntılarda tek satır veya tam JSON kopyalayın.\n\niOS’ta Info.plist içindeki NSBonjourServices altında türleri bildirin.';

  @override
  String get dialogGotIt => 'Tamam';

  @override
  String get fabAddDiscoveryType => 'Tarama türü ekle';

  @override
  String get fabAddBroadcast => 'Yayın ekle';

  @override
  String get filterLabel =>
      'Ada / türe / ana bilgisayara / bağlantı noktasına göre filtrele';

  @override
  String get discoveryEmptyBody =>
      'Başlamak için «Tarama türü ekle»ye dokunun.\nYaygın: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Kopyalandı: $label';
  }

  @override
  String get alreadyBrowsingType => 'Bu tür zaten taranıyor';

  @override
  String get resolveFailedRetry => 'Çözümleme başarısız (daha sonra deneyin)';

  @override
  String get copyTypeTooltip => 'Türü kopyala';

  @override
  String get stop => 'Durdur';

  @override
  String errorWithMessage(Object message) {
    return 'Hata: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$total hizmetten $shown tanesi';
  }

  @override
  String searchingForType(Object type) {
    return '«$type» aranıyor…';
  }

  @override
  String get noMatchingServices => 'Filtreyle eşleşen hizmet yok';

  @override
  String get broadcastEmptyBody =>
      'Yayınlamak için «Yayın ekle»ye dokunun.\nBağlantı noktasının kullanılmadığından emin olun.';

  @override
  String get stateInitializing => 'Başlatılıyor…';

  @override
  String get stateBroadcasting => 'Yayında';

  @override
  String get stateStopped => 'Durduruldu';

  @override
  String get stateStarting => 'Başlıyor…';

  @override
  String get stopAndRemove => 'Durdur ve kaldır';

  @override
  String statusWithState(Object state) {
    return 'Durum: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Hizmet adını kopyala';

  @override
  String hostLineUnresolved(Object port) {
    return 'Bağlantı noktası $port · ana bilgisayar çözülmedi';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Ana bilgisayar ve TXT’yi çöz';

  @override
  String resolveCallFailed(Object error) {
    return 'Çözümleme çağrısı başarısız: $error';
  }

  @override
  String get labelName => 'Ad';

  @override
  String get labelType => 'Tür';

  @override
  String get labelHost => 'Ana bilgisayar';

  @override
  String get hostUnresolvedValue => '(çözülmedi)';

  @override
  String get labelPort => 'Bağlantı noktası';

  @override
  String get txtAttributesHeader => 'TXT kayıtları';

  @override
  String get txtNone => '(yok)';

  @override
  String get copyFullJsonButton => 'Tam JSON’u kopyala';

  @override
  String copyFieldTooltip(Object field) {
    return '$field kopyala';
  }

  @override
  String get discoveryDialogTitle => 'Tarama türü ekle';

  @override
  String get quickSelect => 'Hızlı seçim';

  @override
  String get typeNameFieldLabel => 'Tür adı (başta _ olmadan)';

  @override
  String get typeNameFieldHint => 'ör. http → _http._tcp';

  @override
  String get transportProtocol => 'Taşıma';

  @override
  String get cancel => 'İptal';

  @override
  String get startBrowsing => 'Taramayı başlat';

  @override
  String get broadcastDialogTitle => 'Yayın ekle';

  @override
  String get serviceNameFieldLabel => 'Hizmet görünen adı';

  @override
  String get broadcastTypeFieldLabel => 'Tür (ör. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT öznitelikleri';

  @override
  String get add => 'Ekle';

  @override
  String get keyFieldLabel => 'Anahtar';

  @override
  String get valueFieldLabel => 'Değer';

  @override
  String get startBroadcast => 'Yayını başlat';

  @override
  String get invalidPortRange => 'Geçerli bir bağlantı noktası girin (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Yayın başlatılamadı: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Başarısız: $error';
  }

  @override
  String get defaultHostLabel => 'Yerel';

  @override
  String get defaultServiceName => 'Hizmet';

  @override
  String get languageDialogTitle => 'Dil';

  @override
  String get languageFollowSystem => 'Sistemi izle';

  @override
  String get txtCopyKeyTooltip => 'Anahtarı kopyala';

  @override
  String get txtCopyValueTooltip => 'Değeri kopyala';

  @override
  String get txtCopyPairTooltip => 'anahtar=değer kopyala';

  @override
  String get copyLabelServiceType => 'hizmet türü';

  @override
  String get copyLabelServiceName => 'hizmet adı';

  @override
  String get copyLabelFullJson => 'tam JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT anahtarı $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT değeri $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Tema rengi';

  @override
  String get themeColorDialogTitle => 'Vurgu rengi seç';

  @override
  String get tooltipAppearance => 'Görünüm';

  @override
  String get appearanceDialogTitle => 'Görünüm';

  @override
  String get appearanceFollowSystem => 'Sistemi izle';

  @override
  String get appearanceLight => 'Açık';

  @override
  String get appearanceDark => 'Koyu';
}
