# Running the App

Ensure Flutter SDK is Installed:
If not installed, follow the Flutter installation guide(https://docs.flutter.dev/get-started/install)

# Get Dependencies:

flutter pub get

# Run the App:

## For dev environment:

flutter run --flavor development

## For staging environment:

flutter run --flavor staging

## For production environment:

flutter run --flavor production

# Running Tests

## Unit Tests

flutter test test/unit/ --flavor development

## Widget Tests

flutter test test/widget/ --flavor development

## Integration Tests

flutter test --flavor development integration_test

<!-- or -->

flutter drive \
 --driver=test_driver/integration_test.dart \
 --target=integration_test/stopwatch_integration_test.dart --flavor development
