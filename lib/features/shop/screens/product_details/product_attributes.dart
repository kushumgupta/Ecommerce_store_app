import 'package:e_store/common/widget/custom_shades/containers/rounded_container.dart';
import 'package:e_store/common/widget/text/product_price_text.dart';
import 'package:e_store/common/widget/text/product_title_text.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/chips/choice_chip.dart';
import '../../../../utils/constants/colors.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Column(
      children: [
        ERoundedContainer(
          padding: const EdgeInsets.all(ESizes.md),
          backgroundColor: dark ? EColors.darkerGrey  : EColors.grey,
          child:Column(
            children: [
              Row(
                children: [
                  const ESectionHeading(title: 'Variation' ,showActionButton: false,),
                  const SizedBox(width: ESizes.spaceBtwItems,),
                  Column(
                    children: [
                      Row(
                        children: [
                          const EProductTitleText(title: 'Price : ', smallSize: true,),

                          Text('\$25', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: ESizes.spaceBtwItems,),
                          const EProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const EProductTitleText(title: 'Price : ', smallSize: true,),
                          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,),

                        ],
                      )
                    ],
                  ),
                ],
              ),
              const EProductTitleText(
                title: 'This is the description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLine: 4,)
            ],
          ),

        ),
        const SizedBox(height: ESizes.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Colors' , showActionButton: false,),
            const SizedBox(height: ESizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 8,
              children: [
                EChoiceChip(text: 'Green',selected: true,onSelected: (value){}),
                EChoiceChip(text: 'Blue',selected: false,onSelected: (value){}),
                EChoiceChip(text: 'Purple',selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ESectionHeading(title: 'Sizes' , showActionButton: false,),
            const SizedBox(height: ESizes.spaceBtwItems / 2,),
            Wrap(
              spacing: 6,
              children: [
                EChoiceChip(text: 'EU 34',selected: true,onSelected: (value){}),
                EChoiceChip(text: 'EU 36',selected: false,onSelected: (value){}),
                EChoiceChip(text: 'EU 38',selected: false,onSelected: (value){}),
              ],
            )
          ],
        ),


      ],
    );
  }
}
