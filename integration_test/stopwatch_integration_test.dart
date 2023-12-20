import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/environment.dart';
import 'package:stopwatch_app/screens/stopwatch_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  AppEnvironment.setEnvironment(Flavor.DEV);

  testWidgets(
      'As a user I want to be able to start the stopwatch so that I can begin tracking time',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);
  });

  testWidgets(
      'As a user I want to be able to stop the stopwatch so that I can end tracking time',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);

    // Tap the stop button
    await tester.tap(find.byKey(const Key('stop_button')));
    await tester.pumpAndSettle();

    // Verify state after stopping: Start button is visible and timer is stopped
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('00:00:00'), findsNothing);
  });

  testWidgets('As a user I want to be able to optionally track laps',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);

    // Tap the track lap button
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsOneWidget);

    // Tap the track lap button again
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsNWidgets(2));
  });

  testWidgets(
      'When tracking laps, I want to know what order they were tracked in',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);

    // Tap the track lap button
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsOneWidget);
    expect(find.text('Lap 1'), findsOne);
    await tester.pumpAndSettle();
    // Tap the track lap button again
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsNWidgets(2));
    expect(find.text('Lap 1'), findsOne);
    expect(find.text('Lap 2'), findsOne);
  });

  testWidgets('When tracking laps, I want to know how many there are',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);
    expect(find.text('Completed laps: 1'), findsNothing);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);

    // Tap the track lap button
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsOneWidget);
    expect(find.text('Lap 1'), findsOne);
    expect(find.text('Completed laps: 1'), findsOne);

    // Tap the track lap button again
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsNWidgets(2));
    expect(find.text('Lap 2'), findsOne);
    expect(find.text('Lap 1'), findsOne);
    expect(find.text('Completed laps: 2'), findsOne);
  });

  testWidgets('As a user I want to be able to reset the stopwatch',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StopwatchScreen()));
    await tester.pump(const Duration(seconds: 2));

    // Verify initial state: Control buttons is visible and no laps are shown
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    expect(find.byKey(const Key('reset_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_button')), findsOneWidget);
    expect(find.byKey(const Key('lap_item')), findsNothing);
    expect(find.text('00:00:00'), findsOneWidget);

    // Tap the start button
    await tester.tap(find.byKey(const Key('start_button')));
    await tester.pumpAndSettle();

    // Verify state after starting: Stop button is visible and timer is running
    expect(find.byKey(const Key('stop_button')), findsOneWidget);
    expect(find.byKey(const Key('start_button')), findsNothing);

    // Wait for some time (simulate time passing)
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('00:00:00'), findsNothing);

    // Tap the lap button
    await tester.tap(find.byKey(const Key('lap_button')));
    await tester.pumpAndSettle();

    // Wait 5 seconds to make sure the lap is added
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsOneWidget);

    // Tap the stop button
    await tester.tap(find.byKey(const Key('stop_button')));
    await tester.pumpAndSettle();

    // Verify state after stopping: Start button is visible and timer is stopped
    expect(find.byKey(const Key('start_button')), findsOneWidget);
    expect(find.byKey(const Key('stop_button')), findsNothing);
    await tester.pump(const Duration(seconds: 5));
    // Verify list item appears
    expect(find.byKey(const Key('lap_item')), findsOneWidget);
    expect(find.text('00:00:00'), findsNothing);

    // Tap the reset button
    await tester.tap(find.byKey(const Key('reset_button')));
    await tester.pumpAndSettle();

    expect(find.text('00:00:00'), findsOne);
    expect(find.byKey(const Key('lap_item')), findsNothing);
  });
}
