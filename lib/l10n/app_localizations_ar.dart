// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'اكتشاف mDNS';

  @override
  String get homeTitle => 'اكتشاف وإعلان mDNS';

  @override
  String get tabDiscover => 'اكتشاف';

  @override
  String get tabBroadcast => 'إعلان';

  @override
  String get tooltipHelp => 'حول';

  @override
  String get tooltipLanguage => 'اللغة';

  @override
  String get dialogAboutTitle => 'حول mDNS';

  @override
  String get dialogAboutBody =>
      'الاكتشاف: تصفّح خدمات الشبكة المحلية حسب نوع DNS-SD. إذا لم يُحلّ المضيف، اضغط «حل المضيف وTXT».\n\nالإعلان: انشر خدمة على هذا الجهاز (يجب أن يكون المنفذ متاحًا وأن يسمح النظام).\n\nاختصارات نسخ بجانب العناصر؛ في التفاصيل انسخ سطرًا أو JSON كاملًا.\n\nعلى iOS، صرّح بالأنواع في NSBonjourServices داخل Info.plist.';

  @override
  String get dialogGotIt => 'حسنًا';

  @override
  String get fabAddDiscoveryType => 'إضافة نوع استعراض';

  @override
  String get fabAddBroadcast => 'إضافة إعلان';

  @override
  String get filterLabel => 'تصفية حسب الاسم / النوع / المضيف / المنفذ';

  @override
  String get discoveryEmptyBody =>
      'اضغط «إضافة نوع استعراض» للبدء.\nشائعة: _http._tcp، _ssh._tcp، _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'تم النسخ: $label';
  }

  @override
  String get alreadyBrowsingType => 'يتم استعراض هذا النوع بالفعل';

  @override
  String get resolveFailedRetry => 'فشل الحل (أعد المحاولة لاحقًا)';

  @override
  String get copyTypeTooltip => 'نسخ النوع';

  @override
  String get stop => 'إيقاف';

  @override
  String errorWithMessage(Object message) {
    return 'خطأ: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown من $total خدمات';
  }

  @override
  String searchingForType(Object type) {
    return 'جارٍ البحث عن «$type»…';
  }

  @override
  String get noMatchingServices => 'لا توجد خدمات تطابق المرشّح';

  @override
  String get broadcastEmptyBody =>
      'اضغط «إضافة إعلان» للنشر.\nتأكد أن المنفذ غير مستخدم.';

  @override
  String get stateInitializing => 'جارٍ التهيئة…';

  @override
  String get stateBroadcasting => 'جارٍ الإعلان';

  @override
  String get stateStopped => 'متوقف';

  @override
  String get stateStarting => 'جارٍ البدء…';

  @override
  String get stopAndRemove => 'إيقاف وإزالة';

  @override
  String statusWithState(Object state) {
    return 'الحالة: $state';
  }

  @override
  String get copyServiceNameTooltip => 'نسخ اسم الخدمة';

  @override
  String hostLineUnresolved(Object port) {
    return 'المنفذ $port · المضيف غير محلول';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'حل المضيف وTXT';

  @override
  String resolveCallFailed(Object error) {
    return 'فشل استدعاء الحل: $error';
  }

  @override
  String get labelName => 'الاسم';

  @override
  String get labelType => 'النوع';

  @override
  String get labelHost => 'المضيف';

  @override
  String get hostUnresolvedValue => '(غير محلول)';

  @override
  String get labelPort => 'المنفذ';

  @override
  String get txtAttributesHeader => 'سجلات TXT';

  @override
  String get txtNone => '(لا يوجد)';

  @override
  String get copyFullJsonButton => 'نسخ JSON كامل';

  @override
  String copyFieldTooltip(Object field) {
    return 'نسخ $field';
  }

  @override
  String get discoveryDialogTitle => 'إضافة نوع استعراض';

  @override
  String get quickSelect => 'اختيار سريع';

  @override
  String get typeNameFieldLabel => 'اسم النوع (بدون _ في البداية)';

  @override
  String get typeNameFieldHint => 'مثال: http → _http._tcp';

  @override
  String get transportProtocol => 'النقل';

  @override
  String get cancel => 'إلغاء';

  @override
  String get startBrowsing => 'بدء الاستعراض';

  @override
  String get broadcastDialogTitle => 'إضافة إعلان';

  @override
  String get serviceNameFieldLabel => 'اسم العرض للخدمة';

  @override
  String get broadcastTypeFieldLabel => 'النوع (مثال: http → _http._tcp)';

  @override
  String get txtAttrsSection => 'سمات TXT';

  @override
  String get add => 'إضافة';

  @override
  String get keyFieldLabel => 'المفتاح';

  @override
  String get valueFieldLabel => 'القيمة';

  @override
  String get startBroadcast => 'بدء الإعلان';

  @override
  String get invalidPortRange => 'أدخل منفذًا صالحًا (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'تعذر بدء الإعلان: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'فشل: $error';
  }

  @override
  String get defaultHostLabel => 'محلي';

  @override
  String get defaultServiceName => 'خدمة';

  @override
  String get languageDialogTitle => 'اللغة';

  @override
  String get languageFollowSystem => 'مطابقة النظام';

  @override
  String get txtCopyKeyTooltip => 'نسخ المفتاح';

  @override
  String get txtCopyValueTooltip => 'نسخ القيمة';

  @override
  String get txtCopyPairTooltip => 'نسخ مفتاح=قيمة';

  @override
  String get copyLabelServiceType => 'نوع الخدمة';

  @override
  String get copyLabelServiceName => 'اسم الخدمة';

  @override
  String get copyLabelFullJson => 'JSON كامل';

  @override
  String copyLabelTxtKey(Object key) {
    return 'مفتاح TXT $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'قيمة TXT $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'لون السمة';

  @override
  String get themeColorDialogTitle => 'اختر لون التمييز';

  @override
  String get tooltipAppearance => 'المظهر';

  @override
  String get appearanceDialogTitle => 'المظهر';

  @override
  String get appearanceFollowSystem => 'مطابقة النظام';

  @override
  String get appearanceLight => 'فاتح';

  @override
  String get appearanceDark => 'داكن';
}
