// ignore_for_file: prefer_const_constructors, lines_longer_than_80_chars

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

void main() {
  group('CupertinoOnboarding', () {
    test('throws assertion if number of pages is 0', () {
      expect(
        () => CupertinoOnboarding(
          controller: PageController(),
          pages: const [],
        ),
        throwsAssertionError,
      );
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      // Build the CupertinoOnboarding widget
      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoOnboarding(
            controller: PageController(),
            pages: [
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
          ),
        ),
      );

      // Verify that the CupertinoOnboarding widget is rendered correctly
      expect(find.text('Continue'), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(DotsIndicator), findsOneWidget);
    });

    testWidgets('navigates to next page when pressing button',
        (WidgetTester tester) async {
      // Build the CupertinoOnboarding widget
      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoOnboarding(
            controller: PageController(),
            pages: [
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
          ),
        ),
      );

      // Tap the bottom button to navigate to the next page
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Verify that the PageView has moved to the next page
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Container && widget.color == Colors.red,
        ),
        findsOneWidget,
      );
    });

    testWidgets('triggers onPressedOnLastPage when on last page',
        (WidgetTester tester) async {
      var onPressedOnLastPageCalled = false;

      // Build the CupertinoOnboarding widget
      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoOnboarding(
            controller: PageController(),
            pages: [
              Container(color: Colors.blue),
            ],
            onPressedOnLastPage: () => onPressedOnLastPageCalled = true,
          ),
        ),
      );

      // Tap the bottom button on the only page
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Verify that onPressedOnLastPage was called
      expect(onPressedOnLastPageCalled, true);
    });

    testWidgets('does not trigger onPressedOnLastPage when not on last page',
        (WidgetTester tester) async {
      var onPressedOnLastPageCalled = false;

      // Build the CupertinoOnboarding widget
      await tester.pumpWidget(
        CupertinoApp(
          home: CupertinoOnboarding(
            controller: PageController(),
            pages: [
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
            onPressedOnLastPage: () => onPressedOnLastPageCalled = true,
          ),
        ),
      );

      // Tap the bottom button on the first page to navigate to the next page
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // Verify that onPressedOnLastPage was not called
      expect(onPressedOnLastPageCalled, false);
    });

    testWidgets(
      'does show widgetAboveBottomButton when provided',
      (WidgetTester tester) async {
        // Build the CupertinoOnboarding widget
        await tester.pumpWidget(
          CupertinoApp(
            home: CupertinoOnboarding(
              controller: PageController(),
              pages: [
                Container(color: Colors.blue),
              ],
              widgetAboveBottomButton: const Text('Widget Above Bottom Button'),
            ),
          ),
        );

        // Verify that the widgetAboveBottomButton is rendered
        expect(find.text('Widget Above Bottom Button'), findsOneWidget);
      },
    );
  });
}
