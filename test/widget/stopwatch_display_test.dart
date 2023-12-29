import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/environment.dart';
import 'package:stopwatch_app/widgets/stopwatch_display.dart';

void main() {
  AppEnvironment.setEnvironment(Flavor.DEV);
  testWidgets('StopwatchDisplay shows initial time correctly',
      (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: StopwatchDisplay(currentTime: 0)));
    expect(find.text('00:00:00'), findsOneWidget);
  });

  testWidgets('StopwatchDisplay shows updated time correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(home: StopwatchDisplay(currentTime: 120)));
    expect(find.text('00:02:00'), findsOneWidget);
  });
}
