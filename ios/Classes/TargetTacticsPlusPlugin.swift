import Flutter
import UIKit
import CoreTelephony

public class TargetTacticsPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "target_tactics_plus", binaryMessenger: registrar.messenger())
    let instance = TargetTacticsPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
      case "isHaveSim":
      result(cachedCurrentRadioAccessTechnology())
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func cachedCurrentRadioAccessTechnology() -> Bool {
        let info = CTTelephonyNetworkInfo()
        var cached = info.value(forKey: "cachedCurrentRadioAccessTechnology") as? NSDictionary
        if let carrierProviders = info.serviceSubscriberCellularProviders {
            carrierProviders
            for item in carrierProviders.values {
                 print("\(item.description)");
            }
        }

        if ((cached ?? NSDictionary()).allValues.isEmpty) {
            return false;
        } else {
            return true;
        }
    }
}
