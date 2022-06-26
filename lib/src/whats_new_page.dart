import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';

/// Represents an "What's new" screen in iOS 15 style.
///
/// It is possible to restyle this widget to match older iOS versions.
class WhatsNewPage extends StatelessWidget {
  /// Default constructor of the [WhatsNewPage] widget.
  WhatsNewPage({
    this.title = const Text("What's New"),
    this.features,
    this.backgroundColor,
    super.key,
  }) : assert(
          features != null || features!.isNotEmpty,
          'Feature list cannot be empty.',
        );

  /// Title of the onboarding.
  ///
  /// It is recommended to keep it short.
  ///
  /// Defaults to Text("What's New").
  /// If another Text widget is provided, it will be
  /// defaultly styled to match the iOS 15 style.
  final Widget title;

  /// List of `OnboardingFeature` widgets that will be displayed
  /// under the title.
  final List<OnboardingFeature>? features;

  /// Background color of the onboarding screen.
  ///
  /// Defaults to the iOS style.
  ///
  /// The background color of the bottom button is derived
  /// from the [CupertinoTheme]'s primaryColor.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    const _featuresSeparator = SizedBox(height: 25);

    return CupertinoOnboardingPage(
      title: title,
      body: ListView.separated(
        separatorBuilder: (_, __) => _featuresSeparator,
        itemCount: features!.length,
        itemBuilder: (context, index) {
          return features![index];
        },
      ),
    );
  }
}
