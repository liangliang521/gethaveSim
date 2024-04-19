import 'target_tactics_plus_platform_interface.dart';

class TargetTacticsPlus {
  Future<String?> getPlatformVersion() {
    return TargetTacticsPlusPlatform.instance.getPlatformVersion();
  }

  Future<bool?> isHaveSim() {
    return TargetTacticsPlusPlatform.instance.isHaveSim();
  }
}
