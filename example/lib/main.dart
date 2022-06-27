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
                onContinueOnLastPage: () => Navigator.pop(context),
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
                  const CupertinoOnboardingPage(
                    title: Text('Next page'),
                    body: Text('This is the next page'),
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
