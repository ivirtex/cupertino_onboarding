import 'package:flutter/cupertino.dart';

/// Represents a swipeable page in the onboarding
class CupertinoOnboardingPage extends StatelessWidget {
  /// Default constructor of the [CupertinoOnboardingPage] widget.
  const CupertinoOnboardingPage({
    required this.title,
    required this.body,
    super.key,
  });

  /// Title of the onboarding.
  ///
  /// It is recommended to keep it short.
  ///
  /// Defaults to Text("What's New").
  /// If another Text widget is provided, it will be
  /// defaultly styled to match the iOS 15 style.
  final Widget title;

  /// Body of the onboarding.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const Spacer(flex: 2),
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CupertinoColors.label.resolveFrom(context),
              fontWeight: FontWeight.w700,
              letterSpacing: -2,
              fontSize: 35,
            ),
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: title,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 10,
            child: DefaultTextStyle(
              style: TextStyle(
                color: CupertinoColors.label.resolveFrom(context),
              ),
              child: body,
            ),
          ),
        ],
      ),
    );
  }
}
