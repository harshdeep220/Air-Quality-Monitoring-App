import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:air_quality_monitor/main.dart';
import 'package:air_quality_monitor/services/thingspeak_service.dart';

// Generate mock HTTP client
@GenerateMocks([http.Client])
import 'widget_test.mocks.dart';

void main() {
  group('Air Quality App Tests', () {
    testWidgets('App should render with title', (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const AirQualityApp());

      // Verify that the app title is present
      expect(find.text('Air Quality Monitor'), findsOneWidget);
    });

    testWidgets('App should show loading indicator initially',
        (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const AirQualityApp());

      // Verify that a CircularProgressIndicator is present
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('App should show error on network failure',
        (WidgetTester tester) async {
      // Build our app and trigger a frame
      await tester.pumpWidget(const AirQualityApp());
      
      // Wait for the async operations to complete
      await tester.pumpAndSettle();

      // Verify that error message is shown (since we haven't mocked any successful response)
      expect(find.textContaining('Error'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}