import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';

const lineNumber = 'line-number';

void main(List<String> arguments) async {
  final parser = ArgParser();
  parser.addOption('device');
  final result = parser.parse(arguments);

  final File f = File('pubspec.yaml');
  final List<String> lines = await f.readAsLines();
  for (var i = 0; i < lines.length; i++) {
    /**Huawei */
    if (result['device'].toString().toUpperCase() == 'HUAWEI') {
      if (lines[i].contains('firebase')) {
        if (!lines[i].contains('##')) {
          lines[i] = '##${lines[i]}';
        }
      }
      if (lines[i].contains('agconnect') || lines[i].contains('huawei')) {
        if (lines[i].contains('##')) {
          lines[i] = lines[i].replaceAll('##', '');
        }
      }
    }
    /**Google */
    if (result['device'].toString().toUpperCase() == 'GOOGLE') {
      if (lines[i].contains('agconnect') || lines[i].contains('huawei')) {
        if (!lines[i].contains('##')) {
          lines[i] = '##${lines[i]}';
        }
      }
      if (lines[i].contains('firebase')) {
        if (lines[i].contains('##')) {
          lines[i] = lines[i].replaceAll('##', '');
        }
      }
    }
  }
  await f.writeAsString(lines.join('\n'));
}
