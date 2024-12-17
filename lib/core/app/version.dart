import 'package:package_info_plus/package_info_plus.dart';

class AppVersion {
  AppVersion() {
    PackageInfo.fromPlatform().then((pi) => _setValues(pi));
    instance = this;
  }

  static late AppVersion instance;

  late final int major;
  late final int minor;
  late final int patch;
  late final String version;
  late final String buildNumber;
  late final String buildSignature;

  /// Returns a triple of (major, minor, patch)
  (int, int, int) _parseVersion(String version) {
    List<String> splits = version.split(('.'));
    final int major = int.parse(splits[0]);
    final int minor = int.parse(splits[1]);
    final int patch = int.parse(splits[2]);
    return (major, minor, patch);
  }

  bool isNewerThan(String version) {
    final num = _parseVersion(version);
    return isNewerThanVersion(num.$1, num.$2, num.$3);
  }

  bool isNewerThanVersion(int major, int minor, int patch) {
    if (major > this.major) {
      return false;
    } else if (major == this.major) {
      if (minor > this.minor) {
        return false;
      } else if (minor == this.minor) {
        if (patch > this.patch) {
          return false;
        }
      }
    }
    return true;
  }

  void _setValues(PackageInfo packageInfo) {
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;
    buildSignature = packageInfo.buildSignature;

    final num = _parseVersion(version);
    major = num.$1;
    minor = num.$2;
    patch = num.$3;
  }

  String getAppVersion() {
    return version;
  }
}
