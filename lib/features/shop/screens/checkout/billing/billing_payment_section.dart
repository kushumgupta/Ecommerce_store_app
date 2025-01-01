import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shades/containers/rounded_container.dart';
import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class EBillingPaymentSection extends StatelessWidget {
  const EBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        const ESectionHeading(title: 'Payment Method',buttonTitle: 'Change',showActionButton: true,),
        const SizedBox(height: ESizes.spaceBtwItems /2,),
        Row(
          children: [
            ERoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? EColors.light : EColors.white,
              padding: const EdgeInsets.all(ESizes.sm),
              child: const Image(image: AssetImage(EImage.paypal),fit: BoxFit.contain,),
            ),
            const SizedBox(width: ESizes.spaceBtwItems / 2),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],

    );
  }
}