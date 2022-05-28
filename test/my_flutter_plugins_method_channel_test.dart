import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_plugins/my_flutter_plugins_method_channel.dart';

void main() {
  MethodChannelMyFlutterPlugins platform = MethodChannelMyFlutterPlugins();
  const MethodChannel channel = MethodChannel('my_flutter_plugins');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
