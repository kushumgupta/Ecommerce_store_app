import 'package:e_store/common/widget/images/rounded_images.dart';
import 'package:e_store/common/widget/text/brand_title_text_with_verified_icon.dart';
import 'package:e_store/common/widget/text/product_title_text.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ECartItem extends StatelessWidget {
  const ECartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ERoundedImage(
          imageUrl: EImage.shoesProduct1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(ESizes.sm),
          backgroundColor: EHelperFunction.isDarkMode(context)
              ? EColors.darkerGrey
              : EColors.light,
        ),
        const SizedBox(width: ESizes.spaceBtwItems,),
        Expanded(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandTitleTextWithVerifiedIcon(title: 'Nike'),
                const Flexible(child: EProductTitleText(title: 'Grey Sports Shoes', maxLine: 1,)),
                Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(text: 'Colors ',style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: 'Grey ',style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(text: 'Size ',style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: 'UK 08',style: Theme.of(context).textTheme.bodyLarge),
                        ]
                    )
                )

              ],
            )
        ),
      ],
    );
  }
}
