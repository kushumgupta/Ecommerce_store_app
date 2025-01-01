import 'package:e_store/common/widget/custom_shades/containers/rounded_container.dart';
import 'package:e_store/common/widget/images/rounded_images.dart';
import 'package:e_store/common/widget/text/brand_title_text_with_verified_icon.dart';
import 'package:e_store/common/widget/text/product_price_text.dart';
import 'package:e_store/common/widget/text/product_title_text.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class EProductCardHorizontal extends StatelessWidget {
  const EProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ESizes.productImageRadius),
          color: dark ? EColors.darkerGrey : EColors.softGray),
      child: Row(
        children: [
          ERoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(ESizes.sm),
            backgroundColor: dark ? EColors.dark : EColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: ERoundedImage(
                    imageUrl: EImage.shoesProduct1,
                    applyImageRadius: true,
                  ),
                ),
                Positioned(
                  top: 12,
                  child: ERoundedContainer(
                    radius: ESizes.sm,
                    backgroundColor: EColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: ESizes.sm, vertical: ESizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: Colors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: ESizes.sm,left: ESizes.xs),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EProductTitleText(
                          title: 'Grey Nike Half Sleeves Shirt',
                          smallSize: true,
                        ),
                        SizedBox(
                          height: ESizes.spaceBtwItems / 2,
                        ),
                        BrandTitleTextWithVerifiedIcon(title: 'Nike')
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(child:EProductPriceText(price: '256.0')),
                        Container(
                          decoration: const BoxDecoration(
                              color: EColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(ESizes.cardRadiusMd),
                                bottomRight: Radius.circular(ESizes.productImageRadius),
                              )
                          ),
                          child: const SizedBox(
                            width: ESizes.iconLg * 1.2,
                            height: ESizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: EColors.white,),),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
