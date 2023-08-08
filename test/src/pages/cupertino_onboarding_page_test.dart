// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

void main() {
  group('CupertinoOnboardingPage', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      const titleText = 'Feature Title';
      const bodyText = 'Feature Description';

      // Build the CupertinoOnboardingPage widget
      await tester.pumpWidget(
        const CupertinoApp(
          home: Scaffold(
            body: CupertinoOnboardingPage(
              title: Text(titleText),
              body: Text(bodyText),
            ),
          ),
        ),
      );

      // Verify that the CupertinoOnboardingPage widget is rendered correctly
      expect(find.text(titleText), findsOneWidget);
      expect(find.text(bodyText), findsOneWidget);
    });
  });
}
