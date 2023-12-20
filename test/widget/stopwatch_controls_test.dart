import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/main.dart';
import 'package:stopwatch_app/widgets/stopwatch_controls.dart';

void main() {
  testWidgets('StopwatchControls shows all buttons when not running',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: buildControlButtons(
      isRunning: false,
      startStopwatch: () {},
      stopStopwatch: () {},
      resetStopwatch: () {},
      trackLap: () {},
    )));
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
  });

  testWidgets(
      'StopwatchControls shows stop, reset and lap buttons when running',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: buildControlButtons(
      isRunning: true,
      startStopwatch: () {},
      stopStopwatch: () {},
      resetStopwatch: () {},
      trackLap: () {},
    )));
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
  });

  testWidgets('Start and stop stopwatch', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchApp()));

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Validate that the UI shows 'Stop' button
    expect(find.text('Stop'), findsOneWidget);

    // Tap the stop button
    await tester.tap(find.byKey(const Key('stop_button')));
    await tester.pumpAndSettle();

    // Validate that the UI shows 'Start' button
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('00:00:00'), findsOneWidget);
  });

  testWidgets('Reset stopwatch', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchApp()));

    // Start the stopwatch
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Reset the stopwatch
    await tester.tap(find.byKey(const Key('reset_button')));
    await tester.pumpAndSettle();
    expect(find.text('Start'), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
  });

  testWidgets('Track lap', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchApp()));

    // Start the stopwatch
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Track a lap
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('lap_item')), findsOneWidget);
  });
}
