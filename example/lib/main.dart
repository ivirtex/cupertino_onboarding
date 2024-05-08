import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Onboarding Example',
      home: CupertinoScaffold(
        body: AppHome(),
      ),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Onboarding Example'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Text(
                'Show Calendar Onboarding',
                style: TextStyle(
                  color: CupertinoColors.systemRed.resolveFrom(context),
                ),
              ),
              onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (_) => const CalendarOnboarding(),
              ),
            ),
            CupertinoButton(
              child: Text(
                'Show Translator Onboarding',
                style: TextStyle(
                  color: CupertinoColors.systemTeal.resolveFrom(context),
                ),
              ),
              onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (_) => const TranslatorOnboarding(),
              ),
            ),
            CupertinoButton(
              child: Text(
                'Show Onboarding Overview',
                style: TextStyle(
                  color: CupertinoColors.systemBlue.resolveFrom(context),
                ),
              ),
              onPressed: () =>
                  CupertinoScaffold.showCupertinoModalBottomSheet<void>(
                context: context,
                builder: (_) => const OnboardingOverview(),
              ),
            ),
            CupertinoButton(
              child: Text(
                'Sample Onboarding',
                style: TextStyle(
                  color: CupertinoColors.systemTeal.resolveFrom(context),
                ),
              ),
              onPressed: () => CupertinoScaffold.showCupertinoModalBottomSheet(
                context: context,
                builder: (_) => const SampleOnboarding(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingOverview extends StatelessWidget {
  const OnboardingOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      controller: PageController(),
      onPageChanged: (value) {},
      onPressedOnLastPage: () => Navigator.pop(context),
      pages: [
        WhatsNewPage(
          scrollPhysics: const BouncingScrollPhysics(),
          title: const Text("What's New Template"),
          features: const [
            WhatsNewFeature(
              title: Text('Showcase your App Features'),
              description: Text(
                  'Clean and minimalistic iOS styled template for showing app features e.g. in a new update.'),
              icon: Icon(CupertinoIcons.star),
            ),
            WhatsNewFeature(
              title: Text("Styled Icons and Buttons"),
              description: Text(
                  "To create consistent look, icons and buttons are styled to match your CupertinoTheme's primaryColor. "),
              icon: Icon(CupertinoIcons.paintbrush),
            ),
            WhatsNewFeature(
              title: Text('Style Flexibility'),
              description: Text(
                  "What's New Template can be styled to match new and old iOS versions of onboarding or your own preferences."),
              icon: Icon(CupertinoIcons.gear),
            ),
          ],
        ),
        const CupertinoOnboardingPage(
          title: Text('Support For Multiple Pages'),
          body: Icon(
            CupertinoIcons.square_stack_3d_down_right,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Great Look in Light and Dark Mode'),
          body: Icon(
            CupertinoIcons.sun_max,
            size: 200,
          ),
        ),
        const CupertinoOnboardingPage(
          title: Text('Beautiful and Consistent Appearance'),
          body: Icon(
            CupertinoIcons.check_mark_circled,
            size: 200,
          ),
        ),
      ],
    );
  }
}

class TranslatorOnboarding extends StatelessWidget {
  const TranslatorOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      controller: PageController(),
      onPageChanged: (value) {},
      onPressedOnLastPage: () => Navigator.pop(context),
      bottomButtonColor: CupertinoColors.systemTeal.resolveFrom(context),
      widgetAboveBottomButton: CupertinoButton(
        child: Text(
          'About Translation & Privacy',
          style: TextStyle(
            color: CupertinoColors.systemTeal.resolveFrom(context),
          ),
        ),
        onPressed: () {},
      ),
      pages: [
        WhatsNewPage(
          title: Text.rich(
            TextSpan(
              text: "What's New in ",
              children: [
                TextSpan(
                  text: 'Translate',
                  style: TextStyle(
                    color: CupertinoColors.systemTeal.resolveFrom(context),
                  ),
                ),
              ],
            ),
          ),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.rectangle_dock,
                color: CupertinoColors.systemTeal.resolveFrom(context),
              ),
              title: const Text('Conversation Views'),
              description: const Text(
                'Choose a side-by-side or face-to-face conversation view.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.mic,
                color: CupertinoColors.systemTeal.resolveFrom(context),
              ),
              title: const Text('Auto Translate'),
              description: const Text(
                'Respond in conversations without tapping the microphone button.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.device_phone_portrait,
                color: CupertinoColors.systemTeal.resolveFrom(context),
              ),
              title: const Text('System-Wide Translation'),
              description: const Text(
                'Translate selected text anywhere on your iPhone.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CalendarOnboarding extends StatelessWidget {
  const CalendarOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      controller: PageController(),
      onPageChanged: (value) {},
      bottomButtonColor: CupertinoColors.systemRed.resolveFrom(context),
      onPressedOnLastPage: () => Navigator.pop(context),
      pages: [
        WhatsNewPage(
          title: const Text("What's New in Calendar"),
          features: [
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.mail,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Found Events'),
              description: const Text(
                'Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings.',
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.time,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Time to Leave'),
              description: const Text(
                "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave.",
              ),
            ),
            WhatsNewFeature(
              icon: Icon(
                CupertinoIcons.location,
                color: CupertinoColors.systemRed.resolveFrom(context),
              ),
              title: const Text('Location Suggestions'),
              description: const Text(
                'Calendar suggests locations based on your past events and significant locations.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SampleOnboarding extends StatefulWidget {
  const SampleOnboarding({
    Key? key,
  }) : super(key: key);

  @override
  State<SampleOnboarding> createState() => _SampleOnboardingState();
}

class _SampleOnboardingState extends State<SampleOnboarding> {
  final BoxDecoration _kDefaultRoundedBorderDecoration = const BoxDecoration(
    color: CupertinoDynamicColor.withBrightness(
      color: CupertinoColors.white,
      darkColor: CupertinoColors.black,
    ),
    border: Border(
      top: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      bottom: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      left: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
      right: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x33000000),
          darkColor: Color(0x33FFFFFF),
        ),
        width: 0.0,
      ),
    ),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  );
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoOnboarding(
      controller: PageController(),
      onPageChanged: (value) {
        setState(
          () => _currentPage = value,
        );
      },
      onPressedOnLastPage: () => Navigator.pop(context),
      bottomButtonChild: _currentPage != 1
          ? const Text("Continue")
          : const Text("Get Started"),
      pages: <CupertinoOnboardingPage>[
        CupertinoOnboardingPage(
          bodyPadding: const EdgeInsets.symmetric(horizontal: 30),
          title: Text.rich(
            TextSpan(
              text: "Welcome to ",
              children: [
                TextSpan(
                  text: 'LeetMaster',
                  style: TextStyle(
                    color: CupertinoColors.systemTeal.resolveFrom(context),
                  ),
                ),
              ],
            ),
          ),
          body: const Text(
            "LeetMaster, an unofficial API, offers a robust toolkit for coding enthusiasts, providing valuable resources to sharpen skills and conquer challenges with ease",
            textAlign: TextAlign.center,
          ),
        ),
        CupertinoOnboardingPage(
          bodyPadding: const EdgeInsets.symmetric(horizontal: 30),
          title: Text.rich(
            TextSpan(
              text: "Enter ",
              children: [
                TextSpan(
                  text: 'Leetcode ',
                  style: TextStyle(
                    color: CupertinoColors.systemTeal.resolveFrom(context),
                  ),
                ),
                const TextSpan(
                  text: 'Username ',
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              CupertinoTextField(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: _kDefaultRoundedBorderDecoration,
                prefix: const Text("     Username"),
                style: const TextStyle(
                  color: CupertinoDynamicColor.withBrightness(
                    color: CupertinoColors.black,
                    darkColor: CupertinoColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
