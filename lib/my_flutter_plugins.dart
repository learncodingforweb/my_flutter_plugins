
import 'my_flutter_plugins_platform_interface.dart';

class MyFlutterPlugins {
  Future<String?> getPlatformVersion() {
    return MyFlutterPluginsPlatform.instance.getPlatformVersion();
  }
}
