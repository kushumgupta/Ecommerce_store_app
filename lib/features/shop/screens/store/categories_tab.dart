import 'package:e_store/common/widget/layout/grid_layout.dart';
import 'package:e_store/common/widget/product/product_card/product_card_vertical.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/brand/brand_show_case.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ECategoriesTab extends StatelessWidget {
  const ECategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          children: [
            // -- brand
            const EBrandShowCase(images: [EImage.shoesProduct1,EImage.shoesProduct1,EImage.shoesProduct1,],),
            const EBrandShowCase(images: [EImage.shoesProduct1,EImage.shoesProduct1,EImage.shoesProduct1,],),
            const SizedBox(height: ESizes.spaceBtwItems,),
      
            ESectionHeading(title: 'You might like', showActionButton: true, onPressed: (){},),
            const SizedBox(height: ESizes.spaceBtwItems,),
            EGridLayout(itemCount: 4,itemBuilder: (_, index) => const EProductCardVertical(),),
            const SizedBox(height: ESizes.spaceBtwSection,),
          ],
        ),
      ),
    ],
    );
  }
}
