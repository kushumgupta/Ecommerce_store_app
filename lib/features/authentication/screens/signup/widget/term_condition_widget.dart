import 'package:e_store/features/authentication/controllers_onboarding/signup/signup_controller.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = EHelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 32,
            height: 32,
            child: Obx(
                    () => Checkbox(
                        value:controller.privacyPolice.value,
            onChanged:(value) => controller.privacyPolice.value = value!,
                      activeColor: dark ? EColors.white : EColors.primary,),
            ),

        ),
        const SizedBox(width: ESizes.spaceBtwItems),
        Text.rich(
            TextSpan(
              children:[
                TextSpan(text: '${ETexts.iAgreeTo}', style:Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '${ETexts.privacyPolice}',style:Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? EColors.white: EColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? EColors.white : EColors.primary,
                )),
                TextSpan(text: '${ETexts.and}',style:Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '${ETexts.termAndCondition}',style:Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? EColors.white: EColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? EColors.white : EColors.primary,
                )),
              ],
            )
        )
      ],
    );
  }
}