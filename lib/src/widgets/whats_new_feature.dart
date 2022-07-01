// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:cupertino_onboarding/src/constants.dart';

const double _kIconToTextSpacing = 18;
const double _kIconSize = 35;

/// Widget that represents a feature of the onboarding.
class WhatsNewFeature extends StatelessWidget {
  /// Feature's default constructor.
  const WhatsNewFeature({
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
                      color: kBaseTextColor.resolveFrom(context),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    child: title,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.3,
                      letterSpacing: -0.1,
                      color: kDescriptionTextColor.resolveFrom(context),
                    ),
                    child: description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
