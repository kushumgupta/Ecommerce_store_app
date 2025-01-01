import 'package:e_store/features/authentication/controllers_onboarding/onboarding/onboarding_controller.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: EDeviceUtils.getAppBarHeight(),
      right: ESizes.defaultSpace,
      child:TextButton(
        onPressed: ()=> OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
