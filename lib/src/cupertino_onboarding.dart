import 'package:cupertino_onboarding/src/onboarding_feature.dart';
import 'package:flutter/cupertino.dart';

const CupertinoDynamicColor _kBackgroundColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.white,
  darkColor: CupertinoColors.black,
);

/// Represents an onboarding screen in iOS style.
class CupertinoOnboarding extends StatelessWidget {
  /// Default constructor of the `CupertinoOnboarding` widget.
  const CupertinoOnboarding({
    this.title = "What's New",
    required this.features,
    this.backgroundColor,
    this.nextButtonChild,
    this.onNext,
    super.key,
  }) : assert(features.length > 0, 'Feature list cannot be empty');

  /// Title of the onboarding.
  ///
  /// Apple often uses this title to show the user what's new.
  /// It is recommended to keep it short.
  final String title;

  /// List of `OnboardingFeature` widgets that will be displayed
  /// under the title.
  final List<OnboardingFeature> features;

  /// Background color of the onboarding screen.
  ///
  /// Defaults to the iOS style.
  final Color? backgroundColor;

  /// Child used in the next button.
  ///
  /// Default to the Text('Next') widget.
  final Widget? nextButtonChild;

  /// Invoked when the user taps on the next button.
  /// Must not be null to be enabled.
  ///
  /// E.g. use `() => Navigator.of(context).pop()` to close the onboarding
  /// or use `setState` with changed state boolean to re-render the parent
  /// widget and conditionally display other widget instead of the onboarding.
  final VoidCallback? onNext;

  @override
  Widget build(BuildContext context) {
    const _featuresSeparator = SizedBox(height: 30);

    return ColoredBox(
      color: backgroundColor ?? _kBackgroundColor.resolveFrom(context),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -4,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 30),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 500),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ...features.map(
                      (feature) => Column(
                        children: [
                          feature,
                          _featuresSeparator,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Center(
                child: CupertinoButton.filled(
                  onPressed: onNext,
                  child: Row(
                    children: [
                      const Spacer(),
                      nextButtonChild ?? const Text('Next'),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
