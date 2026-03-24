import 'package:flutter_test/flutter_test.dart';

import 'package:mdns_discovery/main.dart';

void main() {
  testWidgets('应用启动并显示发现页', (WidgetTester tester) async {
    await tester.pumpWidget(const MdnsDiscoveryApp());
    await tester.pumpAndSettle();

    expect(find.text('mDNS 发现与广播'), findsOneWidget);
    expect(find.text('发现'), findsWidgets);
  });
}
