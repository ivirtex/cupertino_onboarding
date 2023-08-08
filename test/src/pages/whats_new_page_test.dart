// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

void main() {
  group('WhatsNewPage', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      const titleText = "What's New";
      const featureTitle1 = 'Feature 1 Title';
      const featureDescription1 = 'Feature 1 Description';
      const featureTitle2 = 'Feature 2 Title';
      const featureDescription2 = 'Feature 2 Description';

      final features = [
        const WhatsNewFeature(
          title: Text(featureTitle1),
          description: Text(featureDescription1),
          icon: Icon(Icons.star),
        ),
        const WhatsNewFeature(
          title: Text(featureTitle2),
          description: Text(featureDescription2),
          icon: Icon(Icons.info),
        ),
      ];

      // Build the WhatsNewPage widget
      await tester.pumpWidget(
        CupertinoApp(
          home: Scaffold(
            body: WhatsNewPage(features: features),
          ),
        ),
      );

      // Verify that the WhatsNewPage widget is rendered correctly
      expect(find.text(titleText), findsOneWidget);
      expect(find.text(featureTitle1), findsOneWidget);
      expect(find.text(featureDescription1), findsOneWidget);
      expect(find.text(featureTitle2), findsOneWidget);
      expect(find.text(featureDescription2), findsOneWidget);
      expect(find.byIcon(Icons.star), findsNWidgets(1));
      expect(find.byIcon(Icons.info), findsNWidgets(1));
    });
  });
}
