import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class EProductQuantityWithAddRemoveButton extends StatelessWidget {
  const EProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: EHelperFunction.isDarkMode(context)
              ? EColors.white
              : EColors.black,
          backgroundColor: EHelperFunction.isDarkMode(context)
              ? EColors.darkerGrey
              : EColors.light,
        ),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        const CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ESizes.md,
          color: EColors.white,
          backgroundColor: EColors.primary,
        ),
      ],
    );
  }
}
