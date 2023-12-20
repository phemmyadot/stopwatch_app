import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch_app/environment.dart';
import 'package:stopwatch_app/utils/app_colors.dart';
import 'package:stopwatch_app/widgets/app_bar.dart';
import 'package:stopwatch_app/widgets/stopwatch_controls.dart';
import 'package:stopwatch_app/widgets/stopwatch_display.dart';
import 'package:stopwatch_app/widgets/stopwatch_laps.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  bool isRunning = false;
  bool showLaps = false;
  int currentTime = 0;
  List<int> laps = [];
  Timer? timer;

  void startStopwatch() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTime++;
      });
    });
  }

  void stopStopwatch() {
    setState(() {
      isRunning = false;
    });
    timer?.cancel();
  }

  void resetStopwatch() {
    setState(() {
      isRunning = false;
      currentTime = 0;
      laps.clear();
    });
    timer?.cancel();
  }

  void trackLap() {
    setState(() {
      laps.insert(0, currentTime);
      currentTime = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: AppEnvironment.title),
        body: SafeArea(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 30),
          buildTimeDisplay(currentTime),
          if (laps.isNotEmpty) const SizedBox(height: 16),
          if (laps.isNotEmpty)
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Completed laps: ${laps.length}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
          const SizedBox(height: 40),
          buildControlButtons(
              isRunning: isRunning,
              startStopwatch: startStopwatch,
              stopStopwatch: stopStopwatch,
              trackLap: trackLap,
              resetStopwatch: resetStopwatch),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          buildLapsList(laps)
        ])));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
