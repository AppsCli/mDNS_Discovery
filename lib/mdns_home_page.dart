import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'l10n/app_localizations.dart';

/// 主界面：mDNS 发现与广播（逻辑参考 Bonsoir example）。
class MdnsHomePage extends StatefulWidget {
  const MdnsHomePage({
    super.key,
    required this.onAppearanceTap,
    required this.onLanguageTap,
    required this.onThemeTap,
  });

  final void Function(BuildContext context) onAppearanceTap;
  final void Function(BuildContext context) onLanguageTap;
  final void Function(BuildContext context) onThemeTap;

  @override
  State<MdnsHomePage> createState() => _MdnsHomePageState();
}

class _MdnsHomePageState extends State<MdnsHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  /// 正在浏览的服务类型（去重保持顺序）
  final List<String> _discoveryTypes = [];

  /// 广播项（独立 id，避免同名配置冲突）
  final List<_BroadcastItem> _broadcastItems = [];

  final TextEditingController _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _filterController.dispose();
    super.dispose();
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  Future<void> _copy(String label, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    _snack(AppLocalizations.of(context)!.copiedMessage(label));
  }

  Future<void> _addDiscoveryType() async {
    final type = await showDialog<String>(
      context: context,
      builder: (context) => const _DiscoveryTypeDialog(),
    );
    if (type == null || type.isEmpty) return;
    final normalized = BonsoirServiceNormalizer.normalizeType(type);
    if (_discoveryTypes.contains(normalized)) {
      if (!mounted) return;
      _snack(AppLocalizations.of(context)!.alreadyBrowsingType);
      return;
    }
    setState(() => _discoveryTypes.add(normalized));
  }

  void _removeDiscoveryType(String type) {
    setState(() => _discoveryTypes.remove(type));
  }

  Future<void> _addBroadcast() async {
    final l10n = AppLocalizations.of(context)!;
    final service = await showDialog<BonsoirService>(
      context: context,
      builder: (context) => _BroadcastServiceDialog(
        initial: _defaultBroadcastService(l10n),
      ),
    );
    if (service == null) return;
    setState(() => _broadcastItems.add(_BroadcastItem(service: service)));
  }

  void _removeBroadcast(String id) {
    setState(() => _broadcastItems.removeWhere((e) => e.id == id));
  }

  BonsoirService _defaultBroadcastService(AppLocalizations l10n) {
    String hostLabel = l10n.defaultHostLabel;
    try {
      hostLabel = Platform.localHostname;
    } catch (_) {}
    return BonsoirService(
      name: '$hostLabel mDNS',
      type: '_http._tcp',
      port: 8080,
      attributes: {
        'app': 'mdns_discovery',
        'ver': '1',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: const Icon(Icons.search), text: l10n.tabDiscover),
            Tab(icon: const Icon(Icons.podcasts), text: l10n.tabBroadcast),
          ],
        ),
        actions: [
          IconButton(
            tooltip: l10n.tooltipAppearance,
            icon: const Icon(Icons.dark_mode_outlined),
            onPressed: () => widget.onAppearanceTap(context),
          ),
          IconButton(
            tooltip: l10n.tooltipThemeColor,
            icon: const Icon(Icons.palette_outlined),
            onPressed: () => widget.onThemeTap(context),
          ),
          IconButton(
            tooltip: l10n.tooltipLanguage,
            icon: const Icon(Icons.language),
            onPressed: () => widget.onLanguageTap(context),
          ),
          IconButton(
            tooltip: l10n.tooltipHelp,
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) {
                final d = AppLocalizations.of(context)!;
                return AlertDialog(
                  title: Text(d.dialogAboutTitle),
                  content: SingleChildScrollView(
                    child: Text(d.dialogAboutBody),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(d.dialogGotIt),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _DiscoveryTab(
            l10n: l10n,
            types: _discoveryTypes,
            filterController: _filterController,
            onRemoveType: _removeDiscoveryType,
            onCopy: _copy,
            onSnack: _snack,
          ),
          _BroadcastTab(
            l10n: l10n,
            items: _broadcastItems,
            onRemove: _removeBroadcast,
            onCopy: _copy,
            onSnack: _snack,
          ),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController,
        builder: (context, _) {
          return FloatingActionButton.extended(
            onPressed: _tabController.index == 0
                ? _addDiscoveryType
                : _addBroadcast,
            icon: Icon(_tabController.index == 0 ? Icons.add : Icons.cast),
            label: Text(
              _tabController.index == 0
                  ? l10n.fabAddDiscoveryType
                  : l10n.fabAddBroadcast,
            ),
          );
        },
      ),
    );
  }
}

class _BroadcastItem {
  _BroadcastItem({required this.service}) : id = '${DateTime.now().microsecondsSinceEpoch}';

  final String id;
  final BonsoirService service;
}

// ——— 发现 Tab ———

class _DiscoveryTab extends StatefulWidget {
  const _DiscoveryTab({
    required this.l10n,
    required this.types,
    required this.filterController,
    required this.onRemoveType,
    required this.onCopy,
    required this.onSnack,
  });

  final AppLocalizations l10n;
  final List<String> types;
  final TextEditingController filterController;
  final void Function(String type) onRemoveType;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  State<_DiscoveryTab> createState() => _DiscoveryTabState();
}

class _DiscoveryTabState extends State<_DiscoveryTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: widget.filterController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.filter_alt_outlined),
              labelText: widget.l10n.filterLabel,
              border: const OutlineInputBorder(),
              isDense: true,
            ),
            onChanged: (_) {
              // 子组件通过父 setState 刷新：用 ValueListenableBuilder
            },
          ),
        ),
        Expanded(
          child: widget.types.isEmpty
              ? Center(
                  child: Text(
                    widget.l10n.discoveryEmptyBody,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54),
                  ),
                )
              : ValueListenableBuilder<TextEditingValue>(
                  valueListenable: widget.filterController,
                  builder: (context, _, __) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 88),
                      itemCount: widget.types.length,
                      itemBuilder: (context, i) {
                        return _DiscoveryTypeSection(
                          l10n: widget.l10n,
                          type: widget.types[i],
                          filter: widget.filterController.text
                              .trim()
                              .toLowerCase(),
                          onRemove: () => widget.onRemoveType(widget.types[i]),
                          onCopy: widget.onCopy,
                          onSnack: widget.onSnack,
                        );
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _DiscoveryTypeSection extends StatefulWidget {
  const _DiscoveryTypeSection({
    required this.l10n,
    required this.type,
    required this.filter,
    required this.onRemove,
    required this.onCopy,
    required this.onSnack,
  });

  final AppLocalizations l10n;
  final String type;
  final String filter;
  final VoidCallback onRemove;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  State<_DiscoveryTypeSection> createState() => _DiscoveryTypeSectionState();
}

class _DiscoveryTypeSectionState extends State<_DiscoveryTypeSection> {
  BonsoirDiscovery? _discovery;
  StreamSubscription<BonsoirDiscoveryEvent>? _sub;
  List<BonsoirService> _services = [];
  ServiceResolver? _resolver;
  bool _starting = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _runDiscovery();
  }

  Future<void> _runDiscovery() async {
    try {
      final discovery = BonsoirDiscovery(type: widget.type);
      await discovery.initialize();
      _resolver = discovery.serviceResolver;
      _sub = discovery.eventStream?.listen(_onEvent);
      await discovery.start();
      _discovery = discovery;
      if (mounted) {
        setState(() {
          _starting = false;
        });
      }
    } catch (e, st) {
      debugPrint('Discovery error: $e\n$st');
      if (mounted) {
        setState(() {
          _starting = false;
          _error = e.toString();
        });
      }
    }
  }

  void _onEvent(BonsoirDiscoveryEvent event) {
    if (!mounted) return;
    switch (event) {
      case BonsoirDiscoveryStartedEvent():
        setState(() => _services = []);
      case BonsoirDiscoveryServiceFoundEvent(:final service):
        setState(() {
          _services = [..._services.where((s) => s.name != service.name), service];
          _services.sort((a, b) => a.name.compareTo(b.name));
        });
      case BonsoirDiscoveryServiceResolvedEvent(:final service):
      case BonsoirDiscoveryServiceUpdatedEvent(:final service):
        setState(() {
          final next = List<BonsoirService>.from(_services);
          final idx = next.indexWhere((s) => s.name == service.name);
          if (idx >= 0) {
            next[idx] = service;
          } else {
            next.add(service);
          }
          next.sort((a, b) => a.name.compareTo(b.name));
          _services = next;
        });
      case BonsoirDiscoveryServiceLostEvent(:final service):
        setState(() {
          _services = _services.where((s) => s.name != service.name).toList();
        });
      case BonsoirDiscoveryServiceResolveFailedEvent():
        widget.onSnack(widget.l10n.resolveFailedRetry);
      default:
        break;
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    unawaited(_discovery?.stop());
    super.dispose();
  }

  bool _matchFilter(BonsoirService s) {
    if (widget.filter.isEmpty) return true;
    final q = widget.filter;
    if (s.name.toLowerCase().contains(q)) return true;
    if (s.type.toLowerCase().contains(q)) return true;
    if (s.host != null && s.host!.toLowerCase().contains(q)) return true;
    if ('${s.port}'.contains(q)) return true;
    for (final e in s.attributes.entries) {
      if (e.key.toLowerCase().contains(q) || e.value.toLowerCase().contains(q)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final filtered = _services.where(_matchFilter).toList();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: const Icon(Icons.category),
            title: SelectableText(
              widget.type,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: _error != null
                ? Text(
                    l10n.errorWithMessage(_error!),
                    style: const TextStyle(color: Colors.red),
                  )
                : Text(
                    l10n.discoveredCount(
                      '${filtered.length}',
                      '${_services.length}',
                    ),
                  ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: l10n.copyTypeTooltip,
                  icon: const Icon(Icons.copy, size: 20),
                  onPressed: () =>
                      widget.onCopy(l10n.copyLabelServiceType, widget.type),
                ),
                TextButton(
                  onPressed: widget.onRemove,
                  child: Text(l10n.stop),
                ),
              ],
            ),
          ),
          if (_starting)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                _services.isEmpty
                    ? l10n.searchingForType(widget.type)
                    : l10n.noMatchingServices,
                style: const TextStyle(color: Colors.black54),
              ),
            )
          else
            for (final service in filtered)
              _ServiceCard(
                l10n: l10n,
                service: service,
                resolver: _resolver,
                onCopy: widget.onCopy,
                onSnack: widget.onSnack,
              ),
        ],
      ),
    );
  }
}

// ——— 广播 Tab ———

class _BroadcastTab extends StatefulWidget {
  const _BroadcastTab({
    required this.l10n,
    required this.items,
    required this.onRemove,
    required this.onCopy,
    required this.onSnack,
  });

  final AppLocalizations l10n;
  final List<_BroadcastItem> items;
  final void Function(String id) onRemove;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  State<_BroadcastTab> createState() => _BroadcastTabState();
}

class _BroadcastTabState extends State<_BroadcastTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.items.isEmpty) {
      return Center(
        child: Text(
          widget.l10n.broadcastEmptyBody,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 88),
      itemCount: widget.items.length,
      itemBuilder: (context, i) {
        return _BroadcastSessionCard(
          key: ValueKey(widget.items[i].id),
          l10n: widget.l10n,
          item: widget.items[i],
          onStop: () => widget.onRemove(widget.items[i].id),
          onCopy: widget.onCopy,
          onSnack: widget.onSnack,
        );
      },
    );
  }
}

enum _BroadcastPhase { initializing, starting, broadcasting, stopped, failed }

class _BroadcastSessionCard extends StatefulWidget {
  const _BroadcastSessionCard({
    super.key,
    required this.l10n,
    required this.item,
    required this.onStop,
    required this.onCopy,
    required this.onSnack,
  });

  final AppLocalizations l10n;
  final _BroadcastItem item;
  final VoidCallback onStop;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  State<_BroadcastSessionCard> createState() => _BroadcastSessionCardState();
}

class _BroadcastSessionCardState extends State<_BroadcastSessionCard> {
  BonsoirBroadcast? _broadcast;
  StreamSubscription<BonsoirBroadcastEvent>? _sub;
  late BonsoirService _live;
  _BroadcastPhase _phase = _BroadcastPhase.initializing;
  String? _failDetail;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _live = widget.item.service;
    _start();
  }

  Future<void> _start() async {
    try {
      final broadcast = BonsoirBroadcast(service: widget.item.service);
      await broadcast.initialize();
      _sub = broadcast.eventStream?.listen((event) {
        if (!mounted) return;
        switch (event) {
          case BonsoirBroadcastStartedEvent(:final service):
            setState(() {
              _live = service;
              _phase = _BroadcastPhase.broadcasting;
              _failed = false;
            });
          case BonsoirBroadcastStoppedEvent(:final service):
            setState(() {
              _live = service;
              _phase = _BroadcastPhase.stopped;
            });
          default:
            break;
        }
      });
      await broadcast.start();
      _broadcast = broadcast;
      if (mounted) {
        setState(() {
          _phase = _BroadcastPhase.starting;
        });
      }
    } catch (e, st) {
      debugPrint('Broadcast error: $e\n$st');
      if (mounted) {
        setState(() {
          _failDetail = e.toString();
          _phase = _BroadcastPhase.failed;
          _failed = true;
        });
        widget.onSnack(widget.l10n.broadcastStartFailed(e.toString()));
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    unawaited(_broadcast?.stop());
    super.dispose();
  }

  String _phaseLabel(AppLocalizations l10n) {
    switch (_phase) {
      case _BroadcastPhase.initializing:
        return l10n.stateInitializing;
      case _BroadcastPhase.starting:
        return l10n.stateStarting;
      case _BroadcastPhase.broadcasting:
        return l10n.stateBroadcasting;
      case _BroadcastPhase.stopped:
        return l10n.stateStopped;
      case _BroadcastPhase.failed:
        return l10n.stateFailedWithError(_failDetail ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: Icon(
              _failed ? Icons.error_outline : Icons.cast_connected,
              color: _failed ? Colors.red : null,
            ),
            title: Text(_live.name),
            subtitle: Text(l10n.statusWithState(_phaseLabel(l10n))),
            trailing: TextButton(
              onPressed: widget.onStop,
              child: Text(l10n.stopAndRemove),
            ),
          ),
          _ServiceDetailRows(
            l10n: l10n,
            service: _live,
            onCopy: widget.onCopy,
          ),
        ],
      ),
    );
  }
}

// ——— 服务展示（发现列表项） ———

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({
    required this.l10n,
    required this.service,
    required this.resolver,
    required this.onCopy,
    required this.onSnack,
  });

  final AppLocalizations l10n;
  final BonsoirService service;
  final ServiceResolver? resolver;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.devices_other),
      title: Row(
        children: [
          Expanded(child: Text(service.name)),
          IconButton(
            tooltip: l10n.copyServiceNameTooltip,
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => onCopy(l10n.copyLabelServiceName, service.name),
          ),
        ],
      ),
      subtitle: Text(
        service.host != null
            ? l10n.hostLineResolved(service.host!, '${service.port}')
            : l10n.hostLineUnresolved('${service.port}'),
      ),
      children: [
        _ServiceDetailRows(l10n: l10n, service: service, onCopy: onCopy),
        if (service.host == null && resolver != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.tonalIcon(
                icon: const Icon(Icons.dns),
                label: Text(l10n.resolveHostTxt),
                onPressed: () async {
                  try {
                    await resolver!.resolveService(service);
                  } catch (e) {
                    onSnack(l10n.resolveCallFailed(e.toString()));
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}

class _ServiceDetailRows extends StatelessWidget {
  const _ServiceDetailRows({
    required this.l10n,
    required this.service,
    required this.onCopy,
  });

  final AppLocalizations l10n;
  final BonsoirService service;
  final Future<void> Function(String label, String text) onCopy;

  static String _fullJson(BonsoirService s) {
    final map = {
      'name': s.name,
      'type': s.type,
      'host': s.host,
      'port': s.port,
      'attributes': s.attributes,
    };
    return const JsonEncoder.withIndent('  ').convert(map);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CopyRow(
            l10n: l10n,
            label: l10n.labelName,
            value: service.name,
            onCopy: onCopy,
          ),
          _CopyRow(
            l10n: l10n,
            label: l10n.labelType,
            value: service.type,
            onCopy: onCopy,
          ),
          _CopyRow(
            l10n: l10n,
            label: l10n.labelHost,
            value: service.host ?? l10n.hostUnresolvedValue,
            onCopy: onCopy,
            enabled: service.host != null,
          ),
          _CopyRow(
            l10n: l10n,
            label: l10n.labelPort,
            value: '${service.port}',
            onCopy: onCopy,
          ),
          const Divider(),
          Text(
            l10n.txtAttributesHeader,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          if (service.attributes.isEmpty)
            Text(l10n.txtNone, style: const TextStyle(color: Colors.black54))
          else
            for (final e in service.attributes.entries)
              _TxtAttributeRow(l10n: l10n, entry: e, onCopy: onCopy),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () =>
                onCopy(l10n.copyLabelFullJson, _fullJson(service)),
            icon: const Icon(Icons.data_object),
            label: Text(l10n.copyFullJsonButton),
          ),
        ],
      ),
    );
  }
}

class _CopyRow extends StatelessWidget {
  const _CopyRow({
    required this.l10n,
    required this.label,
    required this.value,
    required this.onCopy,
    this.enabled = true,
  });

  final AppLocalizations l10n;
  final String label;
  final String value;
  final Future<void> Function(String label, String text) onCopy;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 56,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: SelectableText(
              value,
              style: TextStyle(color: enabled ? null : Colors.black45),
            ),
          ),
          IconButton(
            tooltip: l10n.copyFieldTooltip(label),
            icon: const Icon(Icons.copy, size: 20),
            onPressed: enabled ? () => onCopy(label, value) : null,
          ),
        ],
      ),
    );
  }
}

class _TxtAttributeRow extends StatelessWidget {
  const _TxtAttributeRow({
    required this.l10n,
    required this.entry,
    required this.onCopy,
  });

  final AppLocalizations l10n;
  final MapEntry<String, String> entry;
  final Future<void> Function(String label, String text) onCopy;

  @override
  Widget build(BuildContext context) {
    final kv = '${entry.key}=${entry.value}';
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SelectableText(kv),
          ),
          IconButton(
            tooltip: l10n.txtCopyKeyTooltip,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.label_outline, size: 20),
            onPressed: () =>
                onCopy(l10n.copyLabelTxtKey(entry.key), entry.key),
          ),
          IconButton(
            tooltip: l10n.txtCopyValueTooltip,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.abc, size: 20),
            onPressed: () =>
                onCopy(l10n.copyLabelTxtValue(entry.key), entry.value),
          ),
          IconButton(
            tooltip: l10n.txtCopyPairTooltip,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => onCopy(l10n.copyLabelTxtPair(kv), kv),
          ),
        ],
      ),
    );
  }
}

// ——— 对话框 ———

class _DiscoveryTypeDialog extends StatefulWidget {
  const _DiscoveryTypeDialog();

  @override
  State<_DiscoveryTypeDialog> createState() => _DiscoveryTypeDialogState();
}

class _DiscoveryTypeDialogState extends State<_DiscoveryTypeDialog> {
  final _typeCtrl = TextEditingController(text: 'http');
  String _protocol = 'tcp';

  static const _presets = <String>[
    '_http._tcp',
    '_https._tcp',
    '_ssh._tcp',
    '_printer._tcp',
    '_googlecast._tcp',
    '_bonsoirdemo._tcp',
    '_dartobservatory._tcp',
  ];

  @override
  void dispose() {
    _typeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.discoveryDialogTitle),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.quickSelect,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final p in _presets)
                    ActionChip(
                      label: Text(p, style: const TextStyle(fontSize: 11)),
                      onPressed: () => Navigator.pop(context, p),
                    ),
                ],
              ),
              const Divider(height: 24),
              TextField(
                controller: _typeCtrl,
                decoration: InputDecoration(
                  labelText: l10n.typeNameFieldLabel,
                  hintText: l10n.typeNameFieldHint,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _protocol,
                decoration: InputDecoration(
                  labelText: l10n.transportProtocol,
                  border: const OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'tcp', child: Text('TCP')),
                  DropdownMenuItem(value: 'udp', child: Text('UDP')),
                ],
                onChanged: (v) => setState(() => _protocol = v ?? 'tcp'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () {
            final raw = _typeCtrl.text.trim();
            if (raw.isEmpty) return;
            final t = raw.startsWith('_') ? raw : '_$raw';
            final full = t.contains('._') ? t : '$t._$_protocol';
            Navigator.pop(context, full);
          },
          child: Text(l10n.startBrowsing),
        ),
      ],
    );
  }
}

class _BroadcastServiceDialog extends StatefulWidget {
  const _BroadcastServiceDialog({required this.initial});

  final BonsoirService initial;

  @override
  State<_BroadcastServiceDialog> createState() => _BroadcastServiceDialogState();
}

class _BroadcastServiceDialogState extends State<_BroadcastServiceDialog> {
  late final TextEditingController _name;
  late final TextEditingController _typeStem;
  late final TextEditingController _port;
  String _protocol = 'tcp';
  late List<_AttrPair> _attrs;

  @override
  void initState() {
    super.initState();
    final s = widget.initial;
    _name = TextEditingController(text: s.name);
    _port = TextEditingController(text: '${s.port}');
    var fullType = s.type;
    if (fullType.endsWith('._tcp')) {
      _protocol = 'tcp';
      fullType = fullType.substring(0, fullType.length - 5);
    } else if (fullType.endsWith('._udp')) {
      _protocol = 'udp';
      fullType = fullType.substring(0, fullType.length - 5);
    }
    if (fullType.startsWith('_')) {
      fullType = fullType.substring(1);
    }
    _typeStem = TextEditingController(text: fullType);
    _attrs = s.attributes.entries
        .map((e) => _AttrPair(TextEditingController(text: e.key), TextEditingController(text: e.value)))
        .toList();
    if (_attrs.isEmpty) {
      _attrs = [_AttrPair(TextEditingController(text: 'app'), TextEditingController(text: 'mdns_discovery'))];
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _typeStem.dispose();
    _port.dispose();
    for (final a in _attrs) {
      a.key.dispose();
      a.value.dispose();
    }
    super.dispose();
  }

  Map<String, String> _collectAttributes() {
    final map = <String, String>{};
    for (final a in _attrs) {
      final k = a.key.text.trim();
      if (k.isEmpty) continue;
      map[k] = a.value.text;
    }
    if (map.isEmpty) {
      map['app'] = 'mdns_discovery';
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.broadcastDialogTitle),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  labelText: l10n.serviceNameFieldLabel,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _typeStem,
                decoration: InputDecoration(
                  labelText: l10n.broadcastTypeFieldLabel,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _protocol,
                decoration: InputDecoration(
                  labelText: l10n.transportProtocol,
                  border: const OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'tcp', child: Text('TCP')),
                  DropdownMenuItem(value: 'udp', child: Text('UDP')),
                ],
                onChanged: (v) => setState(() => _protocol = v ?? 'tcp'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _port,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: l10n.labelPort,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    l10n.txtAttrsSection,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => setState(() {
                      _attrs.add(_AttrPair(TextEditingController(), TextEditingController()));
                    }),
                    icon: const Icon(Icons.add),
                    label: Text(l10n.add),
                  ),
                ],
              ),
              for (var i = 0; i < _attrs.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _attrs[i].key,
                          decoration: InputDecoration(
                            labelText: l10n.keyFieldLabel,
                            isDense: true,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _attrs[i].value,
                          decoration: InputDecoration(
                            labelText: l10n.valueFieldLabel,
                            isDense: true,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            final r = _attrs.removeAt(i);
                            r.key.dispose();
                            r.value.dispose();
                          });
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: () {
            final raw = _typeStem.text.trim();
            if (raw.isEmpty) return;
            late final String type;
            if (raw.endsWith('._tcp') || raw.endsWith('._udp')) {
              type = raw.startsWith('_') ? raw : '_$raw';
            } else {
              var stem = raw.startsWith('_') ? raw.substring(1) : raw;
              if (stem.isEmpty) return;
              type = '_$stem._$_protocol';
            }
            final port = int.tryParse(_port.text.trim()) ?? 0;
            if (port <= 0 || port > 65535) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.invalidPortRange)),
              );
              return;
            }
            Navigator.pop(
              context,
              BonsoirService(
                name: _name.text.trim().isEmpty
                    ? l10n.defaultServiceName
                    : _name.text.trim(),
                type: type,
                port: port,
                attributes: _collectAttributes(),
              ),
            );
          },
          child: Text(l10n.startBroadcast),
        ),
      ],
    );
  }
}

class _AttrPair {
  _AttrPair(this.key, this.value);

  final TextEditingController key;
  final TextEditingController value;
}
