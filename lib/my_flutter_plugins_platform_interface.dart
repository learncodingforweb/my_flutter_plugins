import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_flutter_plugins_method_channel.dart';

abstract class MyFlutterPluginsPlatform extends PlatformInterface {
  /// Constructs a MyFlutterPluginsPlatform.
  MyFlutterPluginsPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyFlutterPluginsPlatform _instance = MethodChannelMyFlutterPlugins();

  /// The default instance of [MyFlutterPluginsPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyFlutterPlugins].
  static MyFlutterPluginsPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyFlutterPluginsPlatform] when
  /// they register themselves.
  static set instance(MyFlutterPluginsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
