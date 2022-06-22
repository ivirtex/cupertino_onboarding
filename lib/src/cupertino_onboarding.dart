import 'package:flutter/cupertino.dart';

const CupertinoDynamicColor _kBackgroundColor =
    CupertinoDynamicColor.withBrightness(
        color: CupertinoColors.systemGrey5, darkColor: CupertinoColors.black);

/// Page
class CupertinoOnboarding extends StatelessWidget {
  const CupertinoOnboarding({
    this.title = "What's new",
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _kBackgroundColor.resolveFrom(context),
      child: Column(
        children: [
          Text(title),
        ],
      ),
    );
  }
}
