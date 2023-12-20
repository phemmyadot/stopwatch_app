import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

Widget buildControlButtons(
    {bool isRunning = false,
    VoidCallback? startStopwatch,
    VoidCallback? stopStopwatch,
    VoidCallback? trackLap,
    VoidCallback? resetStopwatch}) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    buildControlButton(isRunning ? 'Stop' : 'Start',
        isRunning ? stopStopwatch : startStopwatch,
        key: !isRunning ? 'start_button' : 'stop_button'),
    buildControlButton('Track Lap', isRunning ? trackLap : null,
        key: 'lap_button'),
    buildControlButton('Reset', resetStopwatch, key: 'reset_button')
  ]);
}

Widget buildControlButton(String label, VoidCallback? onPressed,
    {String key = ''}) {
  return ElevatedButton(
      key: Key(key),
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
      onPressed: onPressed,
      child: Text(label,
          style: const TextStyle(color: AppColors.primaryTextColor)));
}
