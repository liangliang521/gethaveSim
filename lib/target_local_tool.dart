// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class SexyChatLocalTool {
  static String US = "us";
  static List<String> T1 = ["gb", "au", "ca", "nz"];
  static List<String> T2 = [
    "fr",
    "ie",
    "be",
    "nl",
    "no",
    "is",
    "fi",
    "se",
    "de",
    "dk",
    "at",
    "hu",
    "cz",
    "sk",
    "il",
    "lu",
    "ch",
    "mt",
    "it",
    "es",
    "li",
    "ad",
    "si",
    "gr",
    "pt",
    "pl",
    "jp",
    "kr",
    "mo",
    "my",
    "tw",
    "tr",
    "ph"
  ];

  static Future<bool> istarget_user(int mode, String phone1, bool sim) async {
    try {
      var phone = phone1.toLowerCase();
      var ip = await getCountryByIp();
      if (mode == 0) {
        if (sim || phone == US || ip == US) {
          return true;
        } else if (sim || T1.contains(phone) || T1.contains(ip)) {
          return true;
        } else if (sim || T2.contains(phone) || T2.contains(ip)) {
          return true;
        } else {
          return false;
        }
      } else if (mode == 1) {
        if (sim && phone != "cn" && ip != "cn") {
          return true;
        } else {
          return false;
        }
      } else if (mode == 2) {
        if (sim && phone == US && ip == US) {
          return true;
        } else if (sim && T1.contains(phone) && T1.contains(ip)) {
          return true;
        } else if (sim && T2.contains(phone) && T2.contains(ip)) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //根据ip地址获取国家
  static Future<String> getCountryByIp() async {
    //网络请求dio 获取ip地址
    String country = 'CN';
    try {
      var response = await Dio().get('http://ipapi.com/json/');
      var data = response.data;
      country = data['countryCode'];
    } catch (e) {}
    return country;
  }
}
