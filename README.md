# cupertino_onboarding

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
![pub.dev badge](https://img.shields.io/pub/v/cupertino_onboarding)
![GitHub build status](https://img.shields.io/github/actions/workflow/status/ivirtex/cupertino_onboarding/flutter.yml)
[![codecov](https://codecov.io/gh/ivirtex/cupertino_onboarding/branch/master/graph/badge.svg?token=8XMXYFGIFF)](https://codecov.io/gh/ivirtex/cupertino_onboarding)
[![License: MIT][license_badge]][license_link]

Flutter package that provides a beautiful, iOS-like, easy onboarding experience with minimal code.

It's designed to easily showcase your app's features and provide a simple way for users to learn about your app.

<img src="https://github.com/ivirtex/cupertino_onboarding/blob/master/readme_media/onboarding.gif?raw=true" alt="onboarding example" width="50%"/>

<img src="https://github.com/ivirtex/cupertino_onboarding/blob/master/readme_media/calendar.png?raw=true" alt="calendar example" width="75%"/>
<img src="https://github.com/ivirtex/cupertino_onboarding/blob/master/readme_media/translator.png?raw=true" alt="translator example" width="75%"/>

## Getting Started

Add the package to your pubspec.yaml file:

```yaml
cupertino_onboarding: ^1.2.0
```

Import the library:

```dart
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
```

Create `CupertinoOnboarding` widget and pass your pages as parameter:

```dart
@override
Widget build(BuildContext context) {
  return CupertinoOnboarding(
    onPressedOnLastPage: () => Navigator.pop(context),
    pages: [
      // To create What's New page like Calendar or Translator
      // examples in the readme, use `WhatsNewPage` widget:

      // Actual code from the Calendar example:
      WhatsNewPage(
        title: const Text("What's New in Calendar"),
        features: [
          // Feature's type must be `WhatsNewFeature`
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
        ],
      ),

      // To create custom onboarding page, use
      // `CupertinoOnboardingPage` widget:

      // Actual code from the GIF example:
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
    ],
  );
}
```

`CupertinoOnboarding` can be shown as any other widget, but to match native feel, consider using [modal_bottom_sheet](https://pub.dev/packages/modal_bottom_sheet) package or other modal view.

See API reference for more information about customizing look and feel of the onboarding.

## Features, bugs and contributions

Feel free to contribute to this project.

Please file feature requests and bugs at the [issue tracker](https://github.com/ivirtex/cupertino_onboarding).  
If you fixed a bug or implemented a feature by yourself, feel free to send a [pull request](https://github.com/ivirtex/cupertino_onboarding/pulls).

## Sponsoring

I am working on my packages in my free time.

If this package is helping you, please consider [buying me a coffee](https://ko-fi.com/ivirtex), so I can keep updating and maintaining this package.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
