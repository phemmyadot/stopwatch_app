import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ControlButtons extends StatelessWidget {
  final bool isRunning;
  final VoidCallback? startStopwatch;
  final VoidCallback? stopStopwatch;
  final VoidCallback? trackLap;
  final VoidCallback? resetStopwatch;

  const ControlButtons({
    Key? key,
    required this.isRunning,
    required this.startStopwatch,
    required this.stopStopwatch,
    required this.trackLap,
    required this.resetStopwatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(color: AppColors.primaryTextColor)));
  }
}
