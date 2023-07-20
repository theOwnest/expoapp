import 'package:expo_kg/features/onboarding/data/datasources/animation.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:flutter/material.dart';
import 'package:expo_kg/features/onboarding/data/models/onboarding_page.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingContainer extends StatelessWidget {
  const OnboardingContainer({
    Key? key,
    required this.page,
  }) : super(key: key);
  final OnboardingPageModel page;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Animate(
          effects: const [
            FadeEffect(
              duration: animationDuration,
            ),
            SlideEffect(
              duration: animationDuration,
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              page.title,
              style: h24,
            ),
          ),
        ),
        Animate(
          effects: const [
            FadeEffect(
              duration: animationDuration,
            ),
            SlideEffect(
              duration: animationDuration,
            ),
          ],
          delay: const Duration(
            milliseconds: animationDelay,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              page.description,
              textAlign: TextAlign.center,
              style: st14,
            ),
          ),
        ),
        Expanded(
          child: Animate(
            delay: const Duration(
              milliseconds: 2 * animationDelay,
            ),
            effects: const [
              FadeEffect(
                delay: fastAnimationDuration,
                duration: fastAnimationDuration,
              ),
              ScaleEffect(
                duration: fastAnimationDuration,
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/onboarding/${page.image}.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
