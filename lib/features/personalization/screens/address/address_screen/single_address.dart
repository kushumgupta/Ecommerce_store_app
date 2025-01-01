import 'package:e_store/common/widget/custom_shades/containers/rounded_container.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ESingleAddress extends StatelessWidget {
  const ESingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ERoundedContainer(
      padding:const EdgeInsets.all(ESizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? EColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? EColors
          .darkerGrey : EColors.grey,
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? EColors.light : EColors.dark:null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: ESizes.sm / 2),
              const Text('9867543210', maxLines: 2, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: ESizes.sm / 2),
              const Text('82356 Timmy Coves ,south Liana, maine, 87444, USA', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
