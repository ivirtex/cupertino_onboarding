// ignore_for_file: prefer_const_constructors
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter_test/flutter_test.dart';

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
