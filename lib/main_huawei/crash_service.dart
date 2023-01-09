import 'package:agconnect_crash_plus/agconnect_crash_plus.dart';

class CrashService {
  static enableCollection() async {
    await AGCCrash.instance.enableCrashCollection(true);
  }

  static disableCollection() async {
    await AGCCrash.instance.enableCrashCollection(false);
  }

  static log(LogLevel level, String message) {
    AGCCrash.instance.log(level: level, message: message);
    AGCCrash.instance.testIt();
  }

  static logDebug(String message) {
    AGCCrash.instance.log(level: LogLevel.debug, message: message);
    AGCCrash.instance.testIt();
  }

  static logInfo(String message) {
    AGCCrash.instance.log(level: LogLevel.info, message: message);
    AGCCrash.instance.testIt();
  }

  static logWarn(String message) {
    AGCCrash.instance.log(level: LogLevel.warning, message: message);
    AGCCrash.instance.testIt();
  }

  static logError(String message) {
    AGCCrash.instance.log(level: LogLevel.error, message: message);
    AGCCrash.instance.testIt();
  }
}
