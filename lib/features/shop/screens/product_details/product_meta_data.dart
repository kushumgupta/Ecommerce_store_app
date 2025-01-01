import 'package:e_store/common/widget/images/Circular_image.dart';
import 'package:e_store/common/widget/text/brand_title_text_with_verified_icon.dart';
import 'package:e_store/common/widget/text/product_price_text.dart';
import 'package:e_store/common/widget/text/product_title_text.dart';
import 'package:e_store/utils/constants/enums.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/custom_shades/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class EProductMetaData extends StatelessWidget {
  const EProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = EHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //-- price and sale price
        Row(
          children: [
            ERoundedContainer(
              radius: ESizes.sm,
              backgroundColor: EColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: ESizes.sm, vertical: ESizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black),),
            ),
            const SizedBox(width: ESizes.spaceBtwItems,),

            // price
            Text('\$250',style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: ESizes.spaceBtwItems,),
            const EProductPriceText(price: '175', isLarge: true,),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        // title
        const EProductTitleText(title: 'Grey Nike Sports Shoe'),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),

        // stock status
        Row(
          children: [
            const EProductTitleText(title: 'Status'),
            const SizedBox(width: ESizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),

          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 1.5),
        // brand

        Row(
          children: [
            ECircularImage(image: EImage.shoeIcon,width: 32,height: 32,overlayColor: darkMode ? EColors.white : EColors.black,),
            const BrandTitleTextWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium,),

          ],
        )

      ],
    );
  }
}
