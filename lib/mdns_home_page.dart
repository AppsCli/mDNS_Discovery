import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 主界面：mDNS 发现与广播（逻辑参考 Bonsoir example）。
class MdnsHomePage extends StatefulWidget {
  const MdnsHomePage({super.key, required this.title});

  final String title;

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
    _snack('已复制：$label');
  }

  Future<void> _addDiscoveryType() async {
    final type = await showDialog<String>(
      context: context,
      builder: (context) => const _DiscoveryTypeDialog(),
    );
    if (type == null || type.isEmpty) return;
    final normalized = BonsoirServiceNormalizer.normalizeType(type);
    if (_discoveryTypes.contains(normalized)) {
      _snack('已在浏览该类型');
      return;
    }
    setState(() => _discoveryTypes.add(normalized));
  }

  void _removeDiscoveryType(String type) {
    setState(() => _discoveryTypes.remove(type));
  }

  Future<void> _addBroadcast() async {
    final service = await showDialog<BonsoirService>(
      context: context,
      builder: (context) => _BroadcastServiceDialog(
        initial: _defaultBroadcastService(),
      ),
    );
    if (service == null) return;
    setState(() => _broadcastItems.add(_BroadcastItem(service: service)));
  }

  void _removeBroadcast(String id) {
    setState(() => _broadcastItems.removeWhere((e) => e.id == id));
  }

  BonsoirService _defaultBroadcastService() {
    String hostLabel = '本机';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.search), text: '发现'),
            Tab(icon: Icon(Icons.podcasts), text: '广播'),
          ],
        ),
        actions: [
          IconButton(
            tooltip: '说明',
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('关于 mDNS'),
                content: const SingleChildScrollView(
                  child: Text(
                    '发现：按 DNS-SD 类型浏览局域网服务，未解析主机时可点「解析」。\n\n'
                    '广播：在本机发布服务（需端口未被占用且系统允许）。\n\n'
                    '每项旁可复制；详情内可复制单行或整段 JSON。\n\n'
                    'iOS 需在 Info.plist 的 NSBonjourServices 中声明要浏览的类型。',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('知道了'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _DiscoveryTab(
            types: _discoveryTypes,
            filterController: _filterController,
            onRemoveType: _removeDiscoveryType,
            onCopy: _copy,
            onSnack: _snack,
          ),
          _BroadcastTab(
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
            label: Text(_tabController.index == 0 ? '添加浏览类型' : '添加广播'),
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

class _DiscoveryTab extends StatelessWidget {
  const _DiscoveryTab({
    required this.types,
    required this.filterController,
    required this.onRemoveType,
    required this.onCopy,
    required this.onSnack,
  });

  final List<String> types;
  final TextEditingController filterController;
  final void Function(String type) onRemoveType;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: filterController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.filter_alt_outlined),
              labelText: '按名称 / 类型 / 主机 / 端口筛选',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            onChanged: (_) {
              // 子组件通过父 setState 刷新：用 ValueListenableBuilder
            },
          ),
        ),
        Expanded(
          child: types.isEmpty
              ? const Center(
                  child: Text(
                    '点击右下角「添加浏览类型」开始发现。\n常用：_http._tcp、_ssh._tcp、_bonsoirdemo._tcp',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54),
                  ),
                )
              : ValueListenableBuilder<TextEditingValue>(
                  valueListenable: filterController,
                  builder: (context, _, __) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 88),
                      itemCount: types.length,
                      itemBuilder: (context, i) {
                        return _DiscoveryTypeSection(
                          type: types[i],
                          filter: filterController.text.trim().toLowerCase(),
                          onRemove: () => onRemoveType(types[i]),
                          onCopy: onCopy,
                          onSnack: onSnack,
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
    required this.type,
    required this.filter,
    required this.onRemove,
    required this.onCopy,
    required this.onSnack,
  });

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
        widget.onSnack('解析失败（可稍后重试）');
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
                ? Text('错误：$_error', style: const TextStyle(color: Colors.red))
                : Text('已发现 ${filtered.length}/${_services.length} 个服务'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: '复制类型',
                  icon: const Icon(Icons.copy, size: 20),
                  onPressed: () => widget.onCopy('服务类型', widget.type),
                ),
                TextButton(
                  onPressed: widget.onRemove,
                  child: const Text('停止'),
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
                    ? '正在搜索「${widget.type}」…'
                    : '无匹配筛选条件的服务',
                style: const TextStyle(color: Colors.black54),
              ),
            )
          else
            for (final service in filtered)
              _ServiceCard(
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

class _BroadcastTab extends StatelessWidget {
  const _BroadcastTab({
    required this.items,
    required this.onRemove,
    required this.onCopy,
    required this.onSnack,
  });

  final List<_BroadcastItem> items;
  final void Function(String id) onRemove;
  final Future<void> Function(String label, String text) onCopy;
  final void Function(String message) onSnack;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          '点击右下角「添加广播」发布服务。\n请确保端口未被其他程序占用。',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 88),
      itemCount: items.length,
      itemBuilder: (context, i) {
        return _BroadcastSessionCard(
          key: ValueKey(items[i].id),
          item: items[i],
          onStop: () => onRemove(items[i].id),
          onCopy: onCopy,
          onSnack: onSnack,
        );
      },
    );
  }
}

class _BroadcastSessionCard extends StatefulWidget {
  const _BroadcastSessionCard({
    super.key,
    required this.item,
    required this.onStop,
    required this.onCopy,
    required this.onSnack,
  });

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
  String _stateLabel = '初始化…';
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
              _stateLabel = '广播中';
              _failed = false;
            });
          case BonsoirBroadcastStoppedEvent(:final service):
            setState(() {
              _live = service;
              _stateLabel = '已停止';
            });
          default:
            break;
        }
      });
      await broadcast.start();
      _broadcast = broadcast;
      if (mounted) {
        setState(() {
          _stateLabel = '启动中…';
        });
      }
    } catch (e, st) {
      debugPrint('Broadcast error: $e\n$st');
      if (mounted) {
        setState(() {
          _stateLabel = '失败：$e';
          _failed = true;
        });
        widget.onSnack('广播启动失败：$e');
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    unawaited(_broadcast?.stop());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            subtitle: Text('状态：$_stateLabel'),
            trailing: TextButton(
              onPressed: widget.onStop,
              child: const Text('停止并移除'),
            ),
          ),
          _ServiceDetailRows(
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
    required this.service,
    required this.resolver,
    required this.onCopy,
    required this.onSnack,
  });

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
            tooltip: '复制服务名',
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => onCopy('服务名', service.name),
          ),
        ],
      ),
      subtitle: Text(
        service.host != null
            ? '${service.host}:${service.port}'
            : '端口 ${service.port} · 主机未解析',
      ),
      children: [
        _ServiceDetailRows(service: service, onCopy: onCopy),
        if (service.host == null && resolver != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.tonalIcon(
                icon: const Icon(Icons.dns),
                label: const Text('解析主机与 TXT'),
                onPressed: () async {
                  try {
                    await resolver!.resolveService(service);
                  } catch (e) {
                    onSnack('解析调用失败：$e');
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
    required this.service,
    required this.onCopy,
  });

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
          _CopyRow(label: '名称', value: service.name, onCopy: onCopy),
          _CopyRow(label: '类型', value: service.type, onCopy: onCopy),
          _CopyRow(
            label: '主机',
            value: service.host ?? '（未解析）',
            onCopy: onCopy,
            enabled: service.host != null,
          ),
          _CopyRow(label: '端口', value: '${service.port}', onCopy: onCopy),
          const Divider(),
          const Text('TXT 属性', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          if (service.attributes.isEmpty)
            const Text('（无）', style: TextStyle(color: Colors.black54))
          else
            for (final e in service.attributes.entries)
              _TxtAttributeRow(entry: e, onCopy: onCopy),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => onCopy('完整 JSON', _fullJson(service)),
            icon: const Icon(Icons.data_object),
            label: const Text('复制完整 JSON'),
          ),
        ],
      ),
    );
  }
}

class _CopyRow extends StatelessWidget {
  const _CopyRow({
    required this.label,
    required this.value,
    required this.onCopy,
    this.enabled = true,
  });

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
            tooltip: '复制$label',
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
    required this.entry,
    required this.onCopy,
  });

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
            tooltip: '复制键',
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.label_outline, size: 20),
            onPressed: () => onCopy('TXT 键 ${entry.key}', entry.key),
          ),
          IconButton(
            tooltip: '复制值',
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.abc, size: 20),
            onPressed: () => onCopy('TXT 值 ${entry.key}', entry.value),
          ),
          IconButton(
            tooltip: '复制 key=value',
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.copy, size: 20),
            onPressed: () => onCopy('TXT $kv', kv),
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
    return AlertDialog(
      title: const Text('添加浏览类型'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('快捷选择', style: TextStyle(fontSize: 12, color: Colors.black54)),
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
                decoration: const InputDecoration(
                  labelText: '类型名（不含下划线前缀）',
                  hintText: '例如 http → _http._tcp',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _protocol,
                decoration: const InputDecoration(
                  labelText: '传输协议',
                  border: OutlineInputBorder(),
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
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () {
            final raw = _typeCtrl.text.trim();
            if (raw.isEmpty) return;
            final t = raw.startsWith('_') ? raw : '_$raw';
            final full = t.contains('._') ? t : '$t._$_protocol';
            Navigator.pop(context, full);
          },
          child: const Text('开始浏览'),
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
    return AlertDialog(
      title: const Text('添加广播服务'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 340,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  labelText: '服务显示名称',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _typeStem,
                decoration: const InputDecoration(
                  labelText: '类型（如 http → _http._tcp）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _protocol,
                decoration: const InputDecoration(
                  labelText: '传输协议',
                  border: OutlineInputBorder(),
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
                decoration: const InputDecoration(
                  labelText: '端口',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('TXT 属性', style: Theme.of(context).textTheme.titleSmall),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () => setState(() {
                      _attrs.add(_AttrPair(TextEditingController(), TextEditingController()));
                    }),
                    icon: const Icon(Icons.add),
                    label: const Text('添加'),
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
                          decoration: const InputDecoration(
                            labelText: '键',
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _attrs[i].value,
                          decoration: const InputDecoration(
                            labelText: '值',
                            isDense: true,
                            border: OutlineInputBorder(),
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
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('取消')),
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
                const SnackBar(content: Text('请输入有效端口 1–65535')),
              );
              return;
            }
            Navigator.pop(
              context,
              BonsoirService(
                name: _name.text.trim().isEmpty ? 'Service' : _name.text.trim(),
                type: type,
                port: port,
                attributes: _collectAttributes(),
              ),
            );
          },
          child: const Text('开始广播'),
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
