import 'package:flutter/material.dart';

import 'mdns_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MdnsDiscoveryApp());
}

class MdnsDiscoveryApp extends StatelessWidget {
  const MdnsDiscoveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mDNS Discovery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MdnsHomePage(title: 'mDNS 发现与广播'),
    );
  }
}
