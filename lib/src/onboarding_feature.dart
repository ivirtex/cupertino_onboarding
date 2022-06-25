import 'package:flutter/cupertino.dart';

/// Widget that represents a feature of the onboarding.
class OnboardingFeature extends StatelessWidget {
  /// Feature's default constructor.
  const OnboardingFeature({
    required this.title,
    required this.description,
    required this.iconData,
    this.iconColor,
    this.iconSize = 50,
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
  final IconData iconData;

  /// Feature's icon color.
  final Color? iconColor;

  /// Feature's icon size.
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: iconColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.label.resolveFrom(context),
                    ),
                    child: title,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
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
