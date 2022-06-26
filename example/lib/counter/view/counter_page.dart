// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: lines_longer_than_80_chars

import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(l10n.counterAppBarTitle),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Center(child: CounterText()),
              const Spacer(),
              FloatingActionButton(
                heroTag: 'modal',
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
                            OnboardingFeature(
                              icon: Icon(CupertinoIcons.mail),
                              title: Text('Found Events'),
                              description: Text(
                                'Siri suggests events found in Mail, Messages, and Safari, so you can add them easily, such as flight reservations and hotel bookings.',
                              ),
                            ),
                            OnboardingFeature(
                              icon: Icon(CupertinoIcons.time),
                              title: Text('Time to Leave'),
                              description: Text(
                                "Calendar uses Apple Maps to look up locations, traffic conditions, and transit options to tell you when it's time to leave.",
                              ),
                            ),
                            OnboardingFeature(
                              icon: Icon(CupertinoIcons.location),
                              title: Text('Location Suggestions'),
                              description: Text(
                                'Calendar suggests locations based on your past events and significant locations.',
                              ),
                            ),
                          ],
                        ),
                        const CupertinoOnboardingPage(
                          title: Text('Permissions'),
                          body: Text('Permissions screen'),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.info_outline),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'increment',
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'decrement',
                onPressed: () => context.read<CounterCubit>().decrement(),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
