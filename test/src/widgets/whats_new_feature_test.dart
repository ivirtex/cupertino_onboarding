// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

void main() {
  group('WhatsNewFeature', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      const titleText = 'Feature Title';
      const descriptionText = 'Feature Description';
      const icon = Icon(Icons.star);

      // Build the WhatsNewFeature widget
      await tester.pumpWidget(
        const CupertinoApp(
          home: Scaffold(
            body: Center(
              child: WhatsNewFeature(
                title: Text(titleText),
                description: Text(descriptionText),
                icon: icon,
              ),
            ),
          ),
        ),
      );

      // Verify that the WhatsNewFeature widget is rendered correctly
      expect(find.text(titleText), findsOneWidget);
      expect(find.text(descriptionText), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);
    });
  });
}
