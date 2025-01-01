import 'package:e_store/features/authentication/controllers_onboarding/onboarding/onboarding_controller.dart';
import 'package:e_store/features/authentication/screens/onboarding/widget/onboarding_dot_navigation.dart';
import 'package:e_store/features/authentication/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:e_store/features/authentication/screens/onboarding/widget/onboarding_page.dart';
import 'package:e_store/features/authentication/screens/onboarding/widget/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_string.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children:  [
          // Page View
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image:  EImage.onBoardingImage1,
                title: ETexts.onBoardingTitle1,
                subtitle: ETexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image:  EImage.onBoardingImage2,
                title: ETexts.onBoardingTitle2,
                subtitle: ETexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image:  EImage.onBoardingImage3,
                title: ETexts.onBoardingTitle3,
                subtitle: ETexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}




