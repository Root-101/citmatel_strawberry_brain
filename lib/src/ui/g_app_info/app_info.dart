import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  AppInfo._();

  static final instance = AppInfo._();

  String appName = "???";
  String packageName = "???";
  String version = "???";
  String buildNumber = "???";

  final String appIconURL = "assets/app_icon.png";
  final String appSplashURL = "assets/app_splash_initial.png";

  late PackageInfo _packageInfo;

  Future initialize() async {
    _packageInfo = await PackageInfo.fromPlatform();
    appName = _packageInfo.appName;
    packageName = _packageInfo.packageName;
    version = _packageInfo.version;
    buildNumber = _packageInfo.buildNumber;
  }
}
