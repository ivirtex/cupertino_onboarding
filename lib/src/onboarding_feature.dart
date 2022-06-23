import 'package:flutter/material.dart';

/// Widget that represents a feature of the onboarding.
class OnboardingFeature extends StatelessWidget {
  /// Feature's default constructor.
  const OnboardingFeature({
    required this.title,
    required this.description,
    required this.iconData,
    this.iconColor,
    this.iconSize = 50,
    super.key,
  });

  /// Feature's title.
  final String title;

  /// Feature's description.
  final String description;

  /// Feature's icon.
  final IconData iconData;

  /// Feature's icon color.
  final Color? iconColor;

  /// Feature's icon size.
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: iconColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
