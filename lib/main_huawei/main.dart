import 'dart:async';

import 'package:agconnect_crash_plus/agconnect_crash_plus.dart';

import 'package:flutter/material.dart';

import 'core.dart';
import 'crash_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AGCApp.instance.setClientId(clientId: '1065521752018276096');
  AGCApp.instance.setClientSecret(
      clientSecret:
          '0798093862181758C001E0CB26ED043C9C485985AFFCBE9C5ECA1027950A2490');
  AGCApp.instance.setApiKey(
      apiKey:
          'DAEDAB2Wwh2srnvdEiL4Y/uXjONLNEv8H7KmuKg7Z+SA5EholeJgZlvRYWb658vnJI+KXfG72PUTq8Pfixq4Y/66M264g4aLdIbzjw==');

  runZonedGuarded(() {
    Future(() {
      runApp(const MyApp());
    });
  }, (dynamic error, StackTrace stackTrace) {
    AGCCrash.instance.recordError(error, stackTrace);
  });
  FlutterError.onError = AGCCrash.instance.onFlutterError;
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: TextButton(
            onPressed: (() => AGCCrash.instance.testIt()), //testCrash,
            child: const Text("Throw Test Exception - Huawei"),
          ),
        ),
      ),
    );
  }

  void testCrash() {
    CrashService.enableCollection();
    AGCCrash.instance.setUserId("11223344");
    AGCCrash.instance
        .setCustomKey("Test", "This is test crash for crash service.");
    AGCCrash.instance.setCustomKey("Family Name", "Crash Test");
    AGCCrash.instance.testIt();
    AGCCrash.instance.log(
        level: LogLevel.debug,
        message: " has successfully tested crash service.");
  }
}
