import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Hello, World!'), findsOneWidget);

    // We expect that AppBar widget is present in the widget tree
    expect(find.byType(AppBar), findsOneWidget);

    // We expect that the title of the AppBar is 'My App'
    expect(find.text('My App'), findsOneWidget);
  });
}
