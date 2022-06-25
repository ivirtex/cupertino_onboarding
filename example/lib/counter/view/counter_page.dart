// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:example/counter/counter.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                onPressed: () {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (_) => CupertinoOnboarding(
                      onContinue: () => Navigator.pop(context),
                      features: const [
                        OnboardingFeature(
                          iconData: CupertinoIcons.heart_fill,
                          title: Text('More Personalized'),
                          description: Text(
                            'Top Stories picked for you and recommendations from Siri.',
                          ),
                          iconColor: CupertinoColors.systemPink,
                        ),
                        OnboardingFeature(
                          iconData: CupertinoIcons.news_solid,
                          title: Text('New Spotlight Tab'),
                          description: Text(
                            'Discover great stories selected by our colors.',
                          ),
                          iconColor: CupertinoColors.systemRed,
                        ),
                        OnboardingFeature(
                          iconData: CupertinoIcons.play_arrow_solid,
                          title: Text('Video in Today View'),
                          description: Text(
                            "The day's best videos, right in the News widget.",
                          ),
                          iconColor: CupertinoColors.systemBlue,
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(Icons.info_outline),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
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
