import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/device/device_utility.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ESearchContainer extends StatelessWidget {
  const ESearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTab,
    this.padding = const EdgeInsets.symmetric(horizontal: ESizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback ? onTab;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: padding,
        child: Container(
          width: EDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(ESizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? EColors.dark
                    : EColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ESizes.cardRadiusLg),
            border: showBorder ? Border.all(color: EColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: dark ? EColors.darkerGrey: Colors.grey),
              const SizedBox(width: ESizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
