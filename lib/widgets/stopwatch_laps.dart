import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/stopwatch_formatter.dart';

class StopwatchLaps extends StatelessWidget {
  final List<int> laps;

  const StopwatchLaps({Key? key, required this.laps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        key: const Key('laps_list'),
        child: Column(children: [
          buildLapsCount(laps.length),
          const SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
                  itemCount: laps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildLapItem(index, laps);
                  }))
        ]));
  }

  Widget buildLapItem(int index, List<int> laps) {
    return Card(
        key: const Key('lap_item'),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        elevation: 1,
        child: ListTile(
            title: Text('Lap ${laps.length - index}',
                key: Key('lap_item_$index'),
                style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            subtitle: Text(getFormattedTime(laps[index]),
                style: const TextStyle(
                    fontSize: 14, color: AppColors.accentColor)),
            trailing: const Icon(Icons.timer, color: AppColors.accentColor)));
  }

  Widget buildLapsCount(int lapsCount) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
            lapsCount > 0
                ? 'Completed laps: $lapsCount'
                : 'No laps recorded yet',
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16)));
  }
}
