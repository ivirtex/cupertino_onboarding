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
    required this.features,
    this.featuresSeperator = const SizedBox(height: 25),
    this.title = const Text("What's New"),
    this.bodyPadding = _kOnboardingPagePadding,
    this.titleTopIndent = _kTitleTopIndent,
    this.titleToBodySpacing = _kTitleToBodySpacing,
    this.bodyToBottomSpacing = 0,
    this.titleFlex = 3,
    this.scrollPhysics = const BouncingScrollPhysics(),
    super.key,
  }) : assert(
          features.isNotEmpty,
          'Feature list must contain at least 1 widget.',
        );

  /// List of widgets that will be displayed
  /// under the title.
  ///
  /// Preferably, list of [WhatsNewFeature] widgets.
  final List<Widget> features;

  /// Widget that will be displayed between the features.
  ///
  /// Defaults to [SizedBox(height: 25)].
  final Widget featuresSeperator;

  /// Title of the onboarding.
  ///
  /// It is recommended to keep it short.
  ///
  /// Defaults to Text("What's New").
  /// If another Text widget is provided, it will be
  /// defaultly styled to match the iOS style.
  final Widget title;

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

  /// The physics to use for the features section.
  ///
  /// Defaults to [BouncingScrollPhysics].
  final ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboardingPage(
      title: title,
      bodyPadding: bodyPadding,
      titleTopIndent: titleTopIndent,
      titleToBodySpacing: titleToBodySpacing,
      bodyToBottomSpacing: bodyToBottomSpacing,
      titleFlex: titleFlex,
      body: ListView.separated(
        physics: scrollPhysics,
        separatorBuilder: (_, __) => featuresSeperator,
        itemCount: features.length,
        itemBuilder: (context, index) {
          return features[index];
        },
      ),
    );
  }
}
