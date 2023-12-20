import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/widgets/stopwatch_display.dart';

void main() {
  testWidgets('StopwatchDisplay shows initial time correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: buildTimeDisplay(0)));
    expect(find.text('00:00:00'), findsOneWidget);
  });

  testWidgets('StopwatchDisplay shows updated time correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: buildTimeDisplay(120)));
    expect(find.text('00:02:00'), findsOneWidget);
  });
}
