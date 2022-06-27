import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Calendar Onboarding Example',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemRed,
      ),
      home: CalendarHome(),
    );
  }
}

class CalendarHome extends StatelessWidget {
  const CalendarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Calendar Onboarding Example'),
      ),
      child: Center(
        child: CupertinoButton(
          child: const Text('Show Onboarding'),
          onPressed: () {
            showCupertinoModalBottomSheet<void>(
              context: context,
              builder: (_) => CupertinoOnboarding(
                onPressedOnLastPage: () => Navigator.pop(context),
                pages: [
                  WhatsNewPage(
                    title: const Text(
                      "What's New in Calendar",
                    ),
                    features: const [
                      WhatsNew(
                        icon: Icon(CupertinoIcons.mail),
                        title: Text('Found Events'),
                        description: Text(
                          'Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings.',
                        ),
                      ),
                      WhatsNew(
                        icon: Icon(CupertinoIcons.time),
                        title: Text('Time to Leave'),
                        description: Text(
                          "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave.",
                        ),
                      ),
                      WhatsNew(
                        icon: Icon(CupertinoIcons.location),
                        title: Text('Location Suggestions'),
                        description: Text(
                          'Calendar suggests locations based on your past events and significant locations.',
                        ),
                      ),
                    ],
                  ),
                  WhatsNewPage(
                    title: const Text("What's New Template"),
                    features: const [
                      WhatsNew(
                        title: Text('iOS Styled Template'),
                        description: Text(
                            'Clean and minimalistic iOS styled template for showing app features e.g. in a new update.'),
                        icon: Icon(CupertinoIcons.square_arrow_down),
                      ),
                      WhatsNew(
                        title: Text("Styled Icons and Buttons"),
                        description: Text(
                            "To create consistent look, icons and buttons are styled to match your CupertinoTheme's primaryColor. "),
                        icon: Icon(CupertinoIcons.paintbrush),
                      ),
                      WhatsNew(
                        title: Text('Style Flexiblity'),
                        description: Text(
                            "What's New Template can be styled to match new and old iOS versions of onboarding or your own preferencees."),
                        icon: Icon(CupertinoIcons.gear),
                      ),
                    ],
                  ),
                  const CupertinoOnboardingPage(
                    title: Text('Support For Multiple Pages'),
                    body: Icon(
                      CupertinoIcons.square_stack_3d_down_right,
                      size: 250,
                    ),
                  ),
                  const CupertinoOnboardingPage(
                    title: Text('Great Look in Light and Dark Mode'),
                    body: Icon(
                      CupertinoIcons.sun_max,
                      size: 250,
                    ),
                  ),
                  const CupertinoOnboardingPage(
                    title: Text('Beautiful and Consistent Appearance'),
                    body: Icon(
                      CupertinoIcons.check_mark_circled,
                      size: 250,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
