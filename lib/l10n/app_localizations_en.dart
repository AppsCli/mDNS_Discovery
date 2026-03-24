// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'mDNS Discovery';

  @override
  String get homeTitle => 'mDNS discovery & broadcast';

  @override
  String get tabDiscover => 'Discover';

  @override
  String get tabBroadcast => 'Broadcast';

  @override
  String get tooltipHelp => 'About';

  @override
  String get tooltipLanguage => 'Language';

  @override
  String get dialogAboutTitle => 'About mDNS';

  @override
  String get dialogAboutBody =>
      'Discover: browse LAN services by DNS-SD type. If the host is unresolved, tap “Resolve host & TXT”.\n\nBroadcast: publish a service on this device (port must be free and the OS must allow it).\n\nCopy shortcuts appear next to items; in details you can copy a line or full JSON.\n\nOn iOS, declare browsed types under NSBonjourServices in Info.plist.';

  @override
  String get dialogGotIt => 'OK';

  @override
  String get fabAddDiscoveryType => 'Add browse type';

  @override
  String get fabAddBroadcast => 'Add broadcast';

  @override
  String get filterLabel => 'Filter by name / type / host / port';

  @override
  String get discoveryEmptyBody =>
      'Tap “Add browse type” to start.\nCommon: _http._tcp, _ssh._tcp, _bonsoirdemo._tcp';

  @override
  String copiedMessage(Object label) {
    return 'Copied: $label';
  }

  @override
  String get alreadyBrowsingType => 'Already browsing this type';

  @override
  String get resolveFailedRetry => 'Resolve failed (try again later)';

  @override
  String get copyTypeTooltip => 'Copy type';

  @override
  String get stop => 'Stop';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String discoveredCount(Object shown, Object total) {
    return '$shown of $total services';
  }

  @override
  String searchingForType(Object type) {
    return 'Searching for “$type”…';
  }

  @override
  String get noMatchingServices => 'No services match the filter';

  @override
  String get broadcastEmptyBody =>
      'Tap “Add broadcast” to publish.\nMake sure the port is not in use.';

  @override
  String get stateInitializing => 'Initializing…';

  @override
  String get stateBroadcasting => 'Broadcasting';

  @override
  String get stateStopped => 'Stopped';

  @override
  String get stateStarting => 'Starting…';

  @override
  String get stopAndRemove => 'Stop & remove';

  @override
  String statusWithState(Object state) {
    return 'Status: $state';
  }

  @override
  String get copyServiceNameTooltip => 'Copy service name';

  @override
  String hostLineUnresolved(Object port) {
    return 'Port $port · host not resolved';
  }

  @override
  String hostLineResolved(Object host, Object port) {
    return '$host:$port';
  }

  @override
  String get resolveHostTxt => 'Resolve host & TXT';

  @override
  String resolveCallFailed(Object error) {
    return 'Resolve call failed: $error';
  }

  @override
  String get labelName => 'Name';

  @override
  String get labelType => 'Type';

  @override
  String get labelHost => 'Host';

  @override
  String get hostUnresolvedValue => '(unresolved)';

  @override
  String get labelPort => 'Port';

  @override
  String get txtAttributesHeader => 'TXT records';

  @override
  String get txtNone => '(none)';

  @override
  String get copyFullJsonButton => 'Copy full JSON';

  @override
  String copyFieldTooltip(Object field) {
    return 'Copy $field';
  }

  @override
  String get discoveryDialogTitle => 'Add browse type';

  @override
  String get quickSelect => 'Quick pick';

  @override
  String get typeNameFieldLabel => 'Type name (without leading _)';

  @override
  String get typeNameFieldHint => 'e.g. http → _http._tcp';

  @override
  String get transportProtocol => 'Transport';

  @override
  String get cancel => 'Cancel';

  @override
  String get startBrowsing => 'Start browsing';

  @override
  String get broadcastDialogTitle => 'Add broadcast';

  @override
  String get serviceNameFieldLabel => 'Service display name';

  @override
  String get broadcastTypeFieldLabel => 'Type (e.g. http → _http._tcp)';

  @override
  String get txtAttrsSection => 'TXT attributes';

  @override
  String get add => 'Add';

  @override
  String get keyFieldLabel => 'Key';

  @override
  String get valueFieldLabel => 'Value';

  @override
  String get startBroadcast => 'Start broadcast';

  @override
  String get invalidPortRange => 'Enter a valid port (1–65535)';

  @override
  String broadcastStartFailed(Object error) {
    return 'Broadcast failed to start: $error';
  }

  @override
  String stateFailedWithError(Object error) {
    return 'Failed: $error';
  }

  @override
  String get defaultHostLabel => 'Local';

  @override
  String get defaultServiceName => 'Service';

  @override
  String get languageDialogTitle => 'Language';

  @override
  String get languageFollowSystem => 'Follow system';

  @override
  String get txtCopyKeyTooltip => 'Copy key';

  @override
  String get txtCopyValueTooltip => 'Copy value';

  @override
  String get txtCopyPairTooltip => 'Copy key=value';

  @override
  String get copyLabelServiceType => 'service type';

  @override
  String get copyLabelServiceName => 'service name';

  @override
  String get copyLabelFullJson => 'full JSON';

  @override
  String copyLabelTxtKey(Object key) {
    return 'TXT key $key';
  }

  @override
  String copyLabelTxtValue(Object key) {
    return 'TXT value $key';
  }

  @override
  String copyLabelTxtPair(Object pair) {
    return 'TXT $pair';
  }

  @override
  String get tooltipThemeColor => 'Theme color';

  @override
  String get themeColorDialogTitle => 'Choose accent color';

  @override
  String get tooltipAppearance => 'Appearance';

  @override
  String get appearanceDialogTitle => 'Appearance';

  @override
  String get appearanceFollowSystem => 'Follow system';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';
}
