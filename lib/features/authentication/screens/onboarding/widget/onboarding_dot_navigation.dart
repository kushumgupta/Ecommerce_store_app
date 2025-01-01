import 'package:e_store/features/authentication/controllers_onboarding/onboarding/onboarding_controller.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/device/device_utility.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =EHelperFunction.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: EDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: ESizes.defaultSpace,
        child: SmoothPageIndicator(
          count:3,
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(activeDotColor: dark ? EColors.light: EColors.dark,dotHeight: 6),

        )
    );
  }
}
