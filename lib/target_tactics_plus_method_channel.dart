import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'target_tactics_plus_platform_interface.dart';

/// An implementation of [TargetTacticsPlusPlatform] that uses method channels.
class MethodChannelTargetTacticsPlus extends TargetTacticsPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('target_tactics_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<bool?> isHaveSim() async {
    final isHaveSim = await methodChannel.invokeMethod<bool>('isHaveSim');
    return isHaveSim;
  }
}
