import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mdns_discovery/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('应用启动并显示发现页', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MdnsDiscoveryApp());
    await tester.pumpAndSettle();

    expect(find.text('mDNS discovery & broadcast'), findsOneWidget);
    expect(find.text('Discover'), findsWidgets);
  });
}
