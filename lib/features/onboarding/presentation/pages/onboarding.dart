import 'package:expo_kg/features/onboarding/data/datasources/onboarding_data.dart';
import 'package:expo_kg/features/onboarding/presentation/cubit/onboarding_shown.dart';
import 'package:expo_kg/features/onboarding/presentation/widgets/onboard_container.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/custom_text_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!.toInt();
      });
    });
  }

  animateToPage(int index) {
    if (index == onboardingList.length) {
      context.read<OnboardingShown>().writeShown();
      context.goNamed(
        RoutesNames.home,
      );
    }
    _pageController.animateToPage(
      index,
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                itemBuilder: (context, index) {
                  return OnboardingContainer(
                    page: onboardingList[index],
                  );
                },
              ),
            ),
            Column(
              children: [
                RoundedButton(
                  title: 'Далее',
                  margin: marginH,
                  function: () {
                    animateToPage(pageIndex + 1);
                  },
                ),
                CustomTextButton(
                  title: 'Пропустить',
                  function: () {
                    animateToPage(
                      onboardingList.length,
                    );
                  },
                ),
              ],
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingList.length,
              effect: const WormEffect(
                dotHeight: 6,
                dotWidth: 6,
                type: WormType.thinUnderground,
              ),
              onDotClicked: (index) {
                animateToPage(index);
              },
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
