import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'target_tactics_plus_method_channel.dart';

abstract class TargetTacticsPlusPlatform extends PlatformInterface {
  /// Constructs a TargetTacticsPlusPlatform.
  TargetTacticsPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static TargetTacticsPlusPlatform _instance = MethodChannelTargetTacticsPlus();

  /// The default instance of [TargetTacticsPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelTargetTacticsPlus].
  static TargetTacticsPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TargetTacticsPlusPlatform] when
  /// they register themselves.
  static set instance(TargetTacticsPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> isHaveSim() {
    throw UnimplementedError('isHaveSim() has not been implemented.');
  }
}
