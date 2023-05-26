part of '../import/app_import.dart';

class MyCss {
  static const String reset = "\x1B[0m";
  static const String black = "\x1B[30m";
  static const String white = "\x1B[37m";
  static const String red = "\x1B[31m";
  static const String green = "\x1B[32m";
  static const String yellow = "\x1B[33m";
  static const String blue = "\x1B[34m";
  static const String cyan = "\x1B[36m";

  static void log({required String message, String color = MyCss.reset}) {
    developer.log('$color$message${MyCss.reset}');
  }
}
