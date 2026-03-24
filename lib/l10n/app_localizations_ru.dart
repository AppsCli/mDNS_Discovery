// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Обнаружение mDNS';

  @override
  String get homeTitle => 'Обнаружение и объявление mDNS';

  @override
  String get tabDiscover => 'Поиск';

  @override
  String get tabBroadcast => 'Объявление';

  @override
  String get tooltipHelp => 'Справка';

  @override
  String get tooltipLanguage => 'Язык';

  @override
  String get dialogAboutTitle => 'О mDNS';

  @override
  String get dialogAboutBody =>
      'Поиск: просмотр служб в LAN по типу DNS-SD. Если хост не разрешён, нажмите «Разрешить хост и TXT».\n\nОбъявление: публикация службы на этом устройстве (порт должен быть свободен, ОС должна разрешать).\n\nРядом с элементами есть копирование; в подробностях — строка или полный JSON.\n\nНа iOS укажите типы в NSBonjourServices в Info.plist.';

  @override
  String get dialogGotIt => 'Понятно';

  @override
  String get fabAddDiscoveryType => 'Добавить тип поиска';

  @override
  String get fabAddBroadcast => 'Добавить объявление';

  @override
  String get filterLabel => 'Фильтр по имени / типу / хосту / порту';

  @override
  String get discoveryEmptyBody =>
      'Нажмите «Добавить тип поиска», чтобы начать.\nЧасто: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Скопировано: $label';
  }

  @override
  String get alreadyBrowsingType => 'Этот тип уже просматривается';

  @override
  String get resolveFailedRetry => 'Не удалось разрешить (повторите позже)';

  @override
  String get copyTypeTooltip => 'Копировать тип';

  @override
  String get stop => 'Стоп';

  @override
  String errorWithMessage(Object message) {
    return 'Ошибка: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown из $total служб';
  }

  @override
  String searchingForType(Object type) {
    return 'Поиск «$type»…';
  }

  @override
  String get noMatchingServices => 'Нет служб, подходящих под фильтр';

  @override
  String get broadcastEmptyBody =>
      'Нажмите «Добавить объявление» для публикации.\nУбедитесь, что порт не занят.';

  @override
  String get stateInitializing => 'Инициализация…';

  @override
  String get stateBroadcasting => 'Объявление активно';

  @override
  String get stateStopped => 'Остановлено';

  @override
  String get stateStarting => 'Запуск…';

  @override
  String get stopAndRemove => 'Остановить и удалить';

  @override
  String statusWithState(Object state) {
    return 'Состояние: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Копировать имя службы';

  @override
  String hostLineUnresolved(Object port) {
    return 'Порт $port · хост не разрешён';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Разрешить хост и TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Сбой вызова разрешения: $error';
  }

  @override
  String get labelName => 'Имя';

  @override
  String get labelType => 'Тип';

  @override
  String get labelHost => 'Хост';

  @override
  String get hostUnresolvedValue => '(не разрешён)';

  @override
  String get labelPort => 'Порт';

  @override
  String get txtAttributesHeader => 'TXT-записи';

  @override
  String get txtNone => '(нет)';

  @override
  String get copyFullJsonButton => 'Копировать полный JSON';

  @override
  String copyFieldTooltip(Object field) {
    return 'Копировать $field';
  }

  @override
  String get discoveryDialogTitle => 'Добавить тип поиска';

  @override
  String get quickSelect => 'Быстрый выбор';

  @override
  String get typeNameFieldLabel => 'Имя типа (без начального _)';

  @override
  String get typeNameFieldHint => 'напр. http → _http._tcp';

  @override
  String get transportProtocol => 'Транспорт';

  @override
  String get cancel => 'Отмена';

  @override
  String get startBrowsing => 'Начать поиск';

  @override
  String get broadcastDialogTitle => 'Добавить объявление';

  @override
  String get serviceNameFieldLabel => 'Отображаемое имя службы';

  @override
  String get broadcastTypeFieldLabel => 'Тип (напр. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT-атрибуты';

  @override
  String get add => 'Добавить';

  @override
  String get keyFieldLabel => 'Ключ';

  @override
  String get valueFieldLabel => 'Значение';

  @override
  String get startBroadcast => 'Начать объявление';

  @override
  String get invalidPortRange => 'Введите корректный порт (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Не удалось запустить объявление: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Сбой: $error';
  }

  @override
  String get defaultHostLabel => 'Локально';

  @override
  String get defaultServiceName => 'Служба';

  @override
  String get languageDialogTitle => 'Язык';

  @override
  String get languageFollowSystem => 'Как в системе';

  @override
  String get txtCopyKeyTooltip => 'Копировать ключ';

  @override
  String get txtCopyValueTooltip => 'Копировать значение';

  @override
  String get txtCopyPairTooltip => 'Копировать ключ=значение';

  @override
  String get copyLabelServiceType => 'тип службы';

  @override
  String get copyLabelServiceName => 'имя службы';

  @override
  String get copyLabelFullJson => 'полный JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT-ключ $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT-значение $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Цвет темы';

  @override
  String get themeColorDialogTitle => 'Выберите цвет акцента';

  @override
  String get tooltipAppearance => 'Оформление';

  @override
  String get appearanceDialogTitle => 'Оформление';

  @override
  String get appearanceFollowSystem => 'Как в системе';

  @override
  String get appearanceLight => 'Светлая';

  @override
  String get appearanceDark => 'Тёмная';
}
