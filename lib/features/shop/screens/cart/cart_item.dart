import 'package:flutter/material.dart';

import '../../../../common/widget/product/cart/add_remove.dart';
import '../../../../common/widget/product/cart/cart_item.dart';
import '../../../../common/widget/text/product_price_text.dart';
import '../../../../utils/constants/sizes.dart';

class ECartItems extends StatelessWidget {
  const ECartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(height: ESizes.spaceBtwSection),
        itemCount: 2,
        itemBuilder: (_, index) => Column(
          children: [
            const ECartItem(),
            if(showAddRemoveButtons)
           const  SizedBox(height: ESizes.spaceBtwItems,),
            if(showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70,),
                    EProductQuantityWithAddRemoveButton(),
                  ],
                ),
                EProductPriceText(price: '256'),
              ],
            )
          ],
        ));
  }
}

