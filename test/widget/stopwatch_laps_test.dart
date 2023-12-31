import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/environment.dart';
import 'package:stopwatch_app/widgets/stopwatch_laps.dart';

void main() {
  AppEnvironment.setEnvironment(Flavor.DEV);
  testWidgets('StopwatchLaps shows empty list message initially',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: Column(children: [StopwatchLaps(laps: [])])));
    expect(find.byKey(const Key('lap_item')), findsNothing);
  });

  testWidgets('StopwatchLaps displays recorded laps',
      (WidgetTester tester) async {
    final List<int> testLaps = [100, 200, 300];
    await tester.pumpWidget(
        MaterialApp(home: Column(children: [StopwatchLaps(laps: testLaps)])));
    expect(find.byKey(const Key('lap_item')), findsNWidgets(3));
    expect(find.text('00:01:40'), findsOneWidget);
  });
}
