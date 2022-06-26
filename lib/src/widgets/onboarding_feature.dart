import 'package:flutter/cupertino.dart';

const double _kIconToTextSpacing = 20;
const double _kTitleToDescriptionSpacing = 2;
const double _kIconSize = 35;

/// Widget that represents a feature of the onboarding.
class OnboardingFeature extends StatelessWidget {
  /// Feature's default constructor.
  const OnboardingFeature({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  /// Feature's title.
  ///
  /// Usually a Text widget.
  final Widget title;

  /// Feature's description.
  ///
  /// Usually a Text widget.
  final Widget description;

  /// Feature's icon.
  ///
  /// Color of the icon defaults to the [CupertinoTheme]'s primaryColor.
  /// Icon size defaults to 35.
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconTheme(
              data: IconThemeData(
                color: CupertinoTheme.of(context).primaryColor,
                size: _kIconSize,
              ),
              child: icon,
            ),
            const SizedBox(width: _kIconToTextSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                    child: title,
                  ),
                  const SizedBox(height: _kTitleToDescriptionSpacing),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 15,
                      color:
                          CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                    child: description,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
