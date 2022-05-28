import 'package:flutter_test/flutter_test.dart';
import 'package:my_flutter_plugins/my_flutter_plugins.dart';
import 'package:my_flutter_plugins/my_flutter_plugins_platform_interface.dart';
import 'package:my_flutter_plugins/my_flutter_plugins_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyFlutterPluginsPlatform 
    with MockPlatformInterfaceMixin
    implements MyFlutterPluginsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyFlutterPluginsPlatform initialPlatform = MyFlutterPluginsPlatform.instance;

  test('$MethodChannelMyFlutterPlugins is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyFlutterPlugins>());
  });

  test('getPlatformVersion', () async {
    MyFlutterPlugins myFlutterPluginsPlugin = MyFlutterPlugins();
    MockMyFlutterPluginsPlatform fakePlatform = MockMyFlutterPluginsPlatform();
    MyFlutterPluginsPlatform.instance = fakePlatform;
  
    expect(await myFlutterPluginsPlugin.getPlatformVersion(), '42');
  });
}
