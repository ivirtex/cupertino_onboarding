// ignore_for_file: prefer_const_constructors

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

void main() {
  group('CupertinoOnboarding', () {
    test('throws assertion if number of pages is 0', () {
      expect(
        () => CupertinoOnboarding(pages: const []),
        throwsAssertionError,
      );
    });
  });
}
