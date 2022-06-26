import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';

final CupertinoDynamicColor _kBackgroundColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.white,
  darkColor: CupertinoColors.systemGrey6.darkColor,
);

/// Represents an onboarding screen in iOS 15 style.
///
/// It is possible to restyle this widget to match older iOS versions.
class CupertinoOnboarding extends StatefulWidget {
  /// Default constructor of the [CupertinoOnboarding] widget.
  const CupertinoOnboarding({
    required this.pages,
    this.backgroundColor,
    this.bottomButtonChild,
    this.bottomButtonBorderRadius,
    this.bottomButtonPadding,
    this.onContinue,
    this.onContinueOnLastPage,
    super.key,
  });

  /// List of Widgets that will be displayed as pages.
  final List<Widget> pages;

  /// Background color of the onboarding screen.
  ///
  /// Defaults to the iOS style.
  ///
  /// The background color of the bottom button is derived
  /// from the [CupertinoTheme]'s primaryColor.
  final Color? backgroundColor;

  /// Child used in the next button.
  ///
  /// Default to the Text('Continue') widget.
  final Widget? bottomButtonChild;

  /// Border radius of the next button.
  ///
  /// Can't match native iOS look, because as of 3.0.2 Flutter
  /// still uses rounded rectangle shape for [CupertinoButton]
  /// instead of squircle paths.
  /// https://github.com/flutter/flutter/issues/13914
  final BorderRadius? bottomButtonBorderRadius;

  /// Padding of the bottom button.
  ///
  /// Defaults to `const EdgeInsets.only(bottom: 60)`.
  final EdgeInsets? bottomButtonPadding;

  /// Invoked when the user taps on the bottom button.
  /// By default, it will navigate to the next page.
  final VoidCallback? onContinue;

  /// Invoked when the user taps on the bottom button on the last page.
  /// Must not be null to be active.
  ///
  /// E.g. use `() => Navigator.of(context).pop()` to close the onboarding
  /// or use `setState` with changed state boolean to re-render the parent
  /// widget and conditionally display other widget instead of the onboarding.
  final VoidCallback? onContinueOnLastPage;

  @override
  State<CupertinoOnboarding> createState() => _CupertinoOnboardingState();
}

class _CupertinoOnboardingState extends State<CupertinoOnboarding> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor ?? _kBackgroundColor.resolveFrom(context),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                children: widget.pages,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
            ),
            if (widget.pages.length > 1)
              DotsIndicator(
                dotsCount: widget.pages.length,
                position: _currentPage.toDouble(),
                decorator: DotsDecorator(
                  activeColor: CupertinoColors.systemGrey.resolveFrom(context),
                  color: CupertinoColors.systemGrey2.resolveFrom(context),
                  activeSize: const Size(8, 8),
                  size: const Size(8, 8),
                ),
              ),
            const SizedBox(height: 10),
            Center(
              child: Padding(
                padding: widget.bottomButtonPadding ??
                    const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 60,
                    ),
                child: CupertinoButton.filled(
                  borderRadius: widget.bottomButtonBorderRadius ??
                      BorderRadius.circular(15),
                  padding: const EdgeInsets.all(16),
                  onPressed: _currentPage == widget.pages.length - 1
                      ? widget.onContinueOnLastPage
                      : widget.onContinue ?? _animateToNextPage,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        widget.bottomButtonChild ?? const Text('Continue'),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _animateToNextPage() async {
    await _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
