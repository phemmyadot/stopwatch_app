import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/screens/stopwatch_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  testWidgets('Stopwatch integration test', (WidgetTester tester) async {
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
