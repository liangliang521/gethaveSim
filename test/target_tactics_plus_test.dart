import 'package:flutter_test/flutter_test.dart';
import 'package:target_tactics_plus/target_tactics_plus.dart';
import 'package:target_tactics_plus/target_tactics_plus_platform_interface.dart';
import 'package:target_tactics_plus/target_tactics_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTargetTacticsPlusPlatform
    with MockPlatformInterfaceMixin
    implements TargetTacticsPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool?> isHaveSim() => Future.value(true);
}

void main() {
  final TargetTacticsPlusPlatform initialPlatform =
      TargetTacticsPlusPlatform.instance;

  test('$MethodChannelTargetTacticsPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTargetTacticsPlus>());
  });

  test('getPlatformVersion', () async {
    TargetTacticsPlus targetTacticsPlusPlugin = TargetTacticsPlus();
    MockTargetTacticsPlusPlatform fakePlatform =
        MockTargetTacticsPlusPlatform();
    TargetTacticsPlusPlatform.instance = fakePlatform;

    expect(await targetTacticsPlusPlugin.getPlatformVersion(), '42');
  });
}
