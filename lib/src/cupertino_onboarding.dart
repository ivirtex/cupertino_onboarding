// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dots_indicator/dots_indicator.dart';

// Estimated from the iPhone Simulator running iOS 15
final CupertinoDynamicColor _kBackgroundColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.white,
  darkColor: CupertinoColors.systemGrey6.darkColor,
);

final CupertinoDynamicColor _kActiveDotColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.systemGrey2.darkColor,
  darkColor: CupertinoColors.systemGrey2.color,
);
final CupertinoDynamicColor _kInactiveDotColor =
    CupertinoDynamicColor.withBrightness(
  color: CupertinoColors.systemGrey2.color,
  darkColor: CupertinoColors.systemGrey2.darkColor,
);

const Size _kDotSize = Size(8, 8);

final BorderRadius _bottomButtonBorderRadius = BorderRadius.circular(15);
const EdgeInsets _kBottomButtonPadding = EdgeInsets.only(
  left: 22,
  right: 22,
  bottom: 60,
);

/// Represents an onboarding screen in iOS 15 style.
/// Works great with `modal_bottom_sheet` package.
///
/// It is possible to restyle this widget to match older iOS versions.
class CupertinoOnboarding extends StatefulWidget {
  /// Default constructor of the [CupertinoOnboarding] widget.
  /// Works great with `modal_bottom_sheet` package.
  ///
  /// It is possible to restyle this widget to match older iOS versions.
  CupertinoOnboarding({
    required this.controller,
    required this.pages,
    this.backgroundColor,
    this.bottomButtonChild = const Text('Continue'),
    this.bottomButtonColor,
    this.bottomButtonBorderRadius,
    this.bottomButtonPadding = _kBottomButtonPadding,
    this.widgetAboveBottomButton,
    this.pageTransitionAnimationDuration = const Duration(milliseconds: 500),
    this.pageTransitionAnimationCurve = Curves.fastEaseInToSlowEaseOut,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.onPressed,
    this.onPressedOnLastPage,
    this.onPageChanged,
    super.key,
  }) : assert(
          pages.isNotEmpty,
          'Number of pages must be greater than 0',
        );

  /// An object that can be used to control the position to which this page
  /// view is scrolled.
  final PageController controller;

  /// List of Widgets that will be displayed as pages.
  ///
  /// Preferably, list of `CupertinoOnboardingPage`
  /// or `WhatsNewPage` widgets.
  final List<Widget> pages;

  /// Background color of the onboarding screen.
  ///
  /// Defaults to the iOS style.
  final Color? backgroundColor;

  /// Child used in the bottom button.
  ///
  /// Default to the Text('Continue') widget.
  final Widget bottomButtonChild;

  /// Background color of the bottom button.
  ///
  /// Default color is derived
  /// from the [CupertinoTheme]'s primaryColor.
  final Color? bottomButtonColor;

  /// Border radius of the next button.
  ///
  /// Can't match native iOS look, because as of 3.0.3 Flutter
  /// still uses rounded rectangle shape for [CupertinoButton]
  /// instead of squircle paths.
  /// https://github.com/flutter/flutter/issues/13914
  final BorderRadius? bottomButtonBorderRadius;

  /// Padding of the bottom button.
  final EdgeInsets bottomButtonPadding;

  /// Widget that is placed above the bottom button.
  ///
  /// E.g. a [CupertinoButton] that links to the privacy policy page.
  final Widget? widgetAboveBottomButton;

  /// Duration that is used to animate the transition between pages.
  ///
  /// Defaults to `const Duration(milliseconds: 500)`.
  final Duration pageTransitionAnimationDuration;

  /// Animation curve that is used to animate the transition between pages.
  ///
  /// Defaults to [Curves.fastEaseInToSlowEaseOut].
  final Curve pageTransitionAnimationCurve;

  /// The physics to use for horizontal
  /// scrolling between the pages.
  ///
  /// Defaults to [BouncingScrollPhysics].
  final ScrollPhysics scrollPhysics;

  /// Invoked when the user taps on the bottom button.
  /// Usable only if [pages] length is greater than 1.
  ///
  /// By default, it will navigate to the next page.
  final VoidCallback? onPressed;

  /// Invoked when the user taps on the bottom button on the last page.
  /// Must not be null to be active.
  ///
  /// E.g. use [Navigator.pop] to close the onboarding after navigating to it
  /// or use `setState` with changed state boolean to re-render the parent
  /// widget and conditionally display other widget instead of the onboarding.
  final VoidCallback? onPressedOnLastPage;

  /// Called whenever the page in the center of the viewport changes.
  final ValueChanged<int>? onPageChanged;

  @override
  State<CupertinoOnboarding> createState() => _CupertinoOnboardingState();
}

class _CupertinoOnboardingState extends State<CupertinoOnboarding> {
  double _currentPageAsDouble = 0;

  bool isCeilOrFloor = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        if ((widget.controller.page ?? 0) > _currentPageAsDouble) {
          setState(() {
            isCeilOrFloor = true;
          });
        } else {
          setState(() {
            isCeilOrFloor = false;
          });
        }
        _currentPageAsDouble = widget.controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor ?? _kBackgroundColor.resolveFrom(context),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: widget.scrollPhysics,
                controller: widget.controller,
                onPageChanged: widget.onPageChanged,
                children: widget.pages,
              ),
            ),
            if (widget.pages.length > 1)
              DotsIndicator(
                dotsCount: widget.pages.length,
                position: isCeilOrFloor
                    ? _currentPageAsDouble.ceil()
                    : _currentPageAsDouble.floor(),
                decorator: DotsDecorator(
                  activeColor: _kActiveDotColor.resolveFrom(context),
                  color: _kInactiveDotColor.resolveFrom(context),
                  activeSize: _kDotSize,
                  size: _kDotSize,
                ),
              ),
            if (widget.widgetAboveBottomButton != null)
              widget.widgetAboveBottomButton!
            else
              const SizedBox(height: 15),
            Center(
              child: Padding(
                padding: widget.bottomButtonPadding,
                child: Column(
                  children: [
                    CupertinoButton(
                      borderRadius: widget.bottomButtonBorderRadius ??
                          _bottomButtonBorderRadius,
                      color: widget.bottomButtonColor ??
                          CupertinoTheme.of(context).primaryColor,
                      padding: const EdgeInsets.all(16),
                      onPressed: _currentPageAsDouble.toInt() ==
                              widget.pages.length - 1
                          ? widget.onPressedOnLastPage
                          : widget.onPressed ?? _animateToNextPage,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            widget.bottomButtonChild,
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _animateToNextPage() async {
    await widget.controller.nextPage(
      duration: widget.pageTransitionAnimationDuration,
      curve: widget.pageTransitionAnimationCurve,
    );
  }
}
