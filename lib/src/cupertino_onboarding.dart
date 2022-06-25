import 'package:cupertino_onboarding/src/onboarding_feature.dart';
import 'package:flutter/cupertino.dart';

const CupertinoDynamicColor _kBackgroundColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.white,
  darkColor: CupertinoColors.black,
);

/// Represents an onboarding screen in iOS 15 style.
///
/// It is possible to restyle the Widget to match older iOS versions.
class CupertinoOnboarding extends StatelessWidget {
  /// Default constructor of the `CupertinoOnboarding` widget.
  const CupertinoOnboarding({
    this.title = const Text("What's New"),
    required this.features,
    this.backgroundColor,
    this.bottomButtonChild,
    this.bottomButtonBorderRadius,
    this.bottomButtonPadding,
    this.onContinue,
    super.key,
  }) : assert(features.length > 0, 'Feature list cannot be empty');

  /// Title of the onboarding.
  ///
  /// Apple often uses this title to show the user what's new.
  /// It is recommended to keep it short.
  final Widget title;

  /// List of `OnboardingFeature` widgets that will be displayed
  /// under the title.
  final List<OnboardingFeature> features;

  /// Background color of the onboarding screen.
  ///
  /// Defaults to the iOS style.
  ///
  /// The background color of the bottom button is derived
  /// from the [CupertinoTheme]'s primaryColor.
  final Color? backgroundColor;

  /// Child used in the next button.
  ///
  /// Default to the Text('Continue') widget.
  final Widget? bottomButtonChild;

  /// Border radius of the next button.
  ///
  /// Can't match native iOS look, because as of 3.0.2 Flutter
  /// still uses rounded rectangle shape for [CupertinoButton]
  /// instead of squircle paths.
  /// https://github.com/flutter/flutter/issues/13914
  final BorderRadius? bottomButtonBorderRadius;

  /// Padding of the bottom button.
  ///
  /// Defaults to `EdgeInsets.zero`.
  final EdgeInsets? bottomButtonPadding;

  /// Invoked when the user taps on the bottom button.
  /// Must not be null to be enabled.
  ///
  /// E.g. use `() => Navigator.of(context).pop()` to close the onboarding
  /// or use `setState` with changed state boolean to re-render the parent
  /// widget and conditionally display other widget instead of the onboarding.
  final VoidCallback? onContinue;

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
              DefaultTextStyle(
                style: TextStyle(
                  color: CupertinoColors.label.resolveFrom(context),
                  fontWeight: FontWeight.w900,
                  letterSpacing: -4,
                  fontSize: 50,
                ),
                child: title,
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
                child: Padding(
                  padding: bottomButtonPadding ?? EdgeInsets.zero,
                  child: CupertinoButton.filled(
                    borderRadius:
                        bottomButtonBorderRadius ?? BorderRadius.circular(15),
                    onPressed: onContinue,
                    child: Row(
                      children: [
                        const Spacer(),
                        bottomButtonChild ?? const Text('Continue'),
                        const Spacer(),
                      ],
                    ),
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
