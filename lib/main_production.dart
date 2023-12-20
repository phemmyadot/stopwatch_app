import 'package:flutter/material.dart';
import 'package:stopwatch_app/app.dart';
import 'package:stopwatch_app/environment.dart';

void main() {
  AppEnvironment.setEnvironment(Flavor.PROD);
  runApp(const StopwatchApp());
}
