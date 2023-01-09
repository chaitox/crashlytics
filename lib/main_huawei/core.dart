import 'dart:io';

import 'package:flutter/services.dart';

class AGCApp {
  static const MethodChannel _channel =
      MethodChannel('com.huawei.flutter/agconnect_core');

  /// 获取AGCApp实例
  static final AGCApp instance = AGCApp();

  Future<void> setApiKey({required String apiKey}) {
    if (Platform.isIOS) {
      print(
          'The setApiKey method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel
        .invokeMethod('setApiKey', <String, dynamic>{'apiKey': apiKey});
  }

  Future<void> setClientId({required String clientId}) {
    if (Platform.isIOS) {
      print(
          'The setClientId method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel
        .invokeMethod('setClientId', <String, dynamic>{'clientId': clientId});
  }

  Future<void> setClientSecret({required String clientSecret}) {
    if (Platform.isIOS) {
      print(
          'The setClientSecret method only supports Android, please refer to the iOS development guide to set client secret on iOS.');
    }
    return _channel.invokeMethod(
        'setClientSecret', <String, dynamic>{'clientSecret': clientSecret});
  }
}
