import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();

  static final instance = AppInfo._();

  String appName = "???";
  String packageName = "???";
  String version = "???";
  String buildNumber = "???";

  late PackageInfo _packageInfo;

  Future initialize() async {
    _packageInfo = await PackageInfo.fromPlatform();
    appName = _packageInfo.appName;
    packageName = _packageInfo.packageName;
    version = _packageInfo.version;
    buildNumber = _packageInfo.buildNumber;
  }
}
