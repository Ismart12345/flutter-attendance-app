import 'package:student/features/authentication/controllers/onboarding_controller.dart';
import 'package:student/features/authentication/screens/onboarding/widgets/on_boarding_dot_navigation.dart';
import 'package:student/features/authentication/screens/onboarding/widgets/on_boarding_next_button.dart';
import 'package:student/features/authentication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:student/features/authentication/screens/onboarding/widgets/on_boarding_skip.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //  Horizontal Scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage4,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage5,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage6,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          OnBoardingSkip(),
          // Dot Navigation SmoothPageIndicator
          OnBoardingDotNavigation(),
          // Cicular Button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
