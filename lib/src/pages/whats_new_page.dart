// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

const EdgeInsets _kOnboardingPagePadding = EdgeInsets.only(left: 35, right: 15);

const double _kTitleTopIndent = 80;

const double _kTitleToBodySpacing = 55;

/// Represents an "What's new" screen in iOS 15 style.
///
/// It is possible to restyle this widget to match older iOS versions.
class WhatsNewPage extends StatelessWidget {
  /// Default constructor of the [WhatsNewPage] widget.
  ///
  /// Represents an "What's new" screen in iOS 15 style.
  /// It is possible to restyle this widget to match older iOS versions.
  WhatsNewPage({
    this.title = const Text("What's New"),
    required this.features,
    this.bodyPadding = _kOnboardingPagePadding,
    this.titleTopIndent = _kTitleTopIndent,
    this.titleToBodySpacing = _kTitleToBodySpacing,
    this.bodyToBottomSpacing = 0,
    this.titleFlex = 3,
    super.key,
  }) : assert(
          features.isNotEmpty,
          'Feature list must contain at least 1 widget.',
        );

  /// Title of the onboarding.
  ///
  /// It is recommended to keep it short.
  ///
  /// Defaults to Text("What's New").
  /// If another Text widget is provided, it will be
  /// defaultly styled to match the iOS 15 style.
  final Widget title;

  /// List of widgets that will be displayed
  /// under the title.
  ///
  /// Preferably, list of [WhatsNewFeature] widgets.
  final List<WhatsNewFeature> features;

  /// Padding of the body.
  final EdgeInsets bodyPadding;

  /// Top indent of the title.
  ///
  /// Defaults to 80.
  final double titleTopIndent;

  /// Spacing between the title and the body.
  ///
  /// Defaults to 55.
  final double titleToBodySpacing;

  /// Spacing between the body and the bottom buttons/page indicator.
  ///
  /// Defaults to 0.
  final double bodyToBottomSpacing;

  /// Flex value of the title.
  ///
  /// Determines how much horizontal space the title takes.
  ///
  /// Defaults to 3.
  final int titleFlex;

  @override
  Widget build(BuildContext context) {
    const _featuresSeparator = SizedBox(height: 25);

    return CupertinoOnboardingPage(
      title: title,
      bodyPadding: bodyPadding,
      titleTopIndent: titleTopIndent,
      titleToBodySpacing: titleToBodySpacing,
      bodyToBottomSpacing: bodyToBottomSpacing,
      titleFlex: titleFlex,
      body: ListView.separated(
        separatorBuilder: (_, __) => _featuresSeparator,
        itemCount: features.length,
        itemBuilder: (context, index) {
          return features[index];
        },
      ),
    );
  }
}
