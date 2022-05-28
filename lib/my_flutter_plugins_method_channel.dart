import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_flutter_plugins_platform_interface.dart';

/// An implementation of [MyFlutterPluginsPlatform] that uses method channels.
class MethodChannelMyFlutterPlugins extends MyFlutterPluginsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_flutter_plugins');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
