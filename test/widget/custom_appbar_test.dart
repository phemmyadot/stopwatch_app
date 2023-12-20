import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/widgets/app_bar.dart';

void main() {
  testWidgets('CustomAppBar shows provided title', (WidgetTester tester) async {
    await tester
        .pumpWidget(const MaterialApp(home: CustomAppBar(title: 'Stopwatch')));
    expect(find.text('Stopwatch'), findsOneWidget);
  });
}
