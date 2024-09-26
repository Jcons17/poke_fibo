import 'dart:io';

String fixture(String path) {
  return File(path).readAsStringSync();
}
