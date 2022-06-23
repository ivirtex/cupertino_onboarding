// ignore_for_file: prefer_const_constructors
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final features = [
    OnboardingFeature(
      title: 'Feature 1',
      description: 'Description 1',
      iconData: CupertinoIcons.add,
    ),
  ];
  group('CupertinoOnboarding', () {
    test('can be instantiated', () {
      expect(
        CupertinoOnboarding(features: features),
        isNotNull,
      );
    });
  });
}
