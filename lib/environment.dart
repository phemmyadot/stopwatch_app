import 'package:flutter/material.dart';

enum Flavor { DEV, PROD, STAGING }

abstract class AppEnvironment {
  static late Flavor _environment;
  static late String title;
  static late Color primaryColor;

  static Flavor get environent => _environment;

  static void setEnvironment(Flavor env) {
    switch (env) {
      case Flavor.DEV:
        title = 'Stopwatch Dev';
        break;
      case Flavor.PROD:
        title = 'Stopwatch';
        break;
      case Flavor.STAGING:
        title = 'Stopwatch Staging';
        break;
      default:
        title = 'Stopwatch';
    }
  }
}
