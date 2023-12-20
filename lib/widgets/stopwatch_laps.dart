import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/stopwatch_formatter.dart';

Widget buildLapsList(List<int> laps) {
  return Expanded(
      key: const Key('laps_list'),
      child: ListView.builder(
          itemCount: laps.length,
          itemBuilder: (BuildContext context, int index) {
            return buildLapItem(index, laps);
          }));
}

Widget buildLapItem(int index, List<int> laps) {
  return Card(
      key: const Key('lap_item'),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      elevation: 1,
      child: ListTile(
          title: Text('Lap ${laps.length - index}',
              style: const TextStyle(
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          subtitle: Text(getFormattedTime(laps[index]),
              style:
                  const TextStyle(fontSize: 14, color: AppColors.accentColor)),
          trailing: const Icon(Icons.timer, color: AppColors.accentColor)));
}
