// Flutter imports:
import 'package:cupertino_onboarding/src/constants.dart';
import 'package:flutter/cupertino.dart';

const EdgeInsets _kOnboardingPagePadding = EdgeInsets.only(left: 35, right: 15);

/// Represents a swipeable page in the onboarding.
class CupertinoOnboardingPage extends StatelessWidget {
  /// Default constructor of the [CupertinoOnboardingPage] widget.
  const CupertinoOnboardingPage({
    required this.title,
    required this.body,
    this.titleFlex = 3,
    this.bodyPadding = _kOnboardingPagePadding,
    super.key,
  });

  /// Title of the onboarding.
  ///
  /// It is recommended to keep it short.
  ///
  /// Defaults to Text("What's New").
  /// If another Text widget is provided, it will be
  /// defaultly styled to match the iOS 15 style onboarding.
  final Widget title;

  /// Body of the onboarding.
  final Widget body;

  /// Flex value of the title.
  ///
  /// Detrmines how much horizontal space the title takes.
  ///
  /// Defaults to 3.
  final int titleFlex;

  /// Padding of the body.
  final EdgeInsets bodyPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kBaseTextColor.resolveFrom(context),
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
            fontSize: 35,
          ),
          child: Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: title,
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 55),
        Expanded(
          flex: 10,
          child: DefaultTextStyle(
            style: TextStyle(
              color: kBaseTextColor.resolveFrom(context),
            ),
            child: Padding(
              padding: bodyPadding,
              child: body,
            ),
          ),
        ),
      ],
    );
  }
}
