import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/stopwatch_formatter.dart';

class StopwatchDisplay extends StatelessWidget {
  final int currentTime;

  const StopwatchDisplay({Key? key, required this.currentTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        width: 140,
        child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            color: AppColors.primaryColor,
            child: Center(
                child: Text(getFormattedTime(currentTime),
                    style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.bold)))));
  }
}
