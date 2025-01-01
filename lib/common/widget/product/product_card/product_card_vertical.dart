import 'package:e_store/common/styles/shadows.dart';
import 'package:e_store/common/widget/custom_shades/containers/rounded_container.dart';
import 'package:e_store/common/widget/icons/circular_icon.dart';
import 'package:e_store/common/widget/images/rounded_images.dart';
import 'package:e_store/common/widget/text/product_title_text.dart';
import 'package:e_store/features/shop/screens/product_details/product_detail.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../text/brand_title_text_with_verified_icon.dart';
import '../../text/product_price_text.dart';

class EProductCardVertical extends StatelessWidget {
  const EProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [EShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(ESizes.productImageRadius),
            color: dark ? EColors.darkerGrey : EColors.white),
        child: Column(
          children: [
            ERoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(ESizes.sm),
              backgroundColor: dark ? EColors.dark : EColors.light,
              child: Stack(
                children: [
                  const ERoundedImage(
                    imageUrl: EImage.shoesProduct1,
                    applyImageRadius: true,
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
            const SizedBox(height: ESizes.spaceBtwItems/2,),

            // -- Details of Product
            const Padding(
              padding: EdgeInsets.only(left: ESizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EProductTitleText(title: "Grey Nike Air Shoes",smallSize: true,),
                  SizedBox(height: ESizes.spaceBtwItems/2,),
                  BrandTitleTextWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: ESizes.sm),
                  child: EProductPriceText(price: '35.5',),
                ),
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
      ),
    );
  }
}



