// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_template/controllers/theme_controller.dart';
import 'package:flutter_template/pages/second_page.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/main.dart';
import 'package:get/get.dart';

void main() {
  setUpAll(() {
    // This is called once before ALL tests.
    Get.put(ThemeController());
  });

  testWidgets('Click button to go to second page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the button to navigate.
    var btn = find.text('Go to Second Page');
    await tester.tap(btn);
    await tester.pumpAndSettle();

    // Are we on the second page?
    expect(find.byType(SecondPage), findsOneWidget);
    expect(find.text('This is page 2'), findsOneWidget);
  });
}
