// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:radhiant_patient_app_fixed/main.dart';

void main() {
  testWidgets('App loads and displays home screen', (WidgetTester tester) async {
    // Provide the required 'startAtHome' parameter
    await tester.pumpWidget(const RadhiantApp(startAtHome: true));

    // Verify that the logo or welcome text appears
    expect(find.text('Welcome'), findsOneWidget);
  });
}

