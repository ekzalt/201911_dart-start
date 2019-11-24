library fs;

import 'dart:io';
import 'dart:convert';

Future main() async {
  String content = await File('config.json').readAsString();
  Map<String, dynamic> config = jsonDecode(content);

  print(config);
}
