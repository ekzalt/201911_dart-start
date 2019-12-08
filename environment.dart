import 'dart:io';

void main() {
  final Map<String, String> env = Platform.environment;

  print(env['PATH']);
  print(env['PWD']);
}
