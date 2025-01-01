import 'package:e_store/features/authentication/controllers_onboarding/onboarding/onboarding_controller.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Positioned(
      right: ESizes.defaultSpace,
      bottom: EDeviceUtils.getBottomNavigationBarHeight(),
      child:ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor:dark ? EColors.primary: Colors.black),
        child:const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}

