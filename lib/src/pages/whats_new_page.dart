// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:cupertino_onboarding/cupertino_onboarding.dart';

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

  /// List of `WhatsNew` widgets that will be displayed
  /// under the title.
  final List<WhatsNew> features;

  @override
  Widget build(BuildContext context) {
    const _featuresSeparator = SizedBox(height: 25);

    return CupertinoOnboardingPage(
      title: title,
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
