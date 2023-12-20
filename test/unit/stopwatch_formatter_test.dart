import 'package:flutter_test/flutter_test.dart';
import 'package:stopwatch_app/utils/stopwatch_formatter.dart';

void main() {
  group('Stopwatch Formatter Tests', () {
    test('Test formatted time with seconds', () {
      expect(getFormattedTime(0), '00:00:00');
      expect(getFormattedTime(59), '00:00:59');
      expect(getFormattedTime(60), '00:01:00');
      expect(getFormattedTime(3600), '01:00:00');
    });

    test('Test formatted time with minutes', () {
      expect(getFormattedTime(61), '00:01:01');
      expect(getFormattedTime(3599), '00:59:59');
    });

    test('Test formatted time with hours', () {
      expect(getFormattedTime(3601), '01:00:01');
      expect(getFormattedTime(3961), '01:06:01');
    });
  });
}
