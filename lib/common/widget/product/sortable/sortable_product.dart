import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class ESortableProducts extends StatelessWidget {
  const ESortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity']
              .map((option) => DropdownMenuItem(value: option,child:Text(option))).toList(),
        ),
        const SizedBox(height: ESizes.spaceBtwSection),
        EGridLayout(itemCount:8, itemBuilder:(_, index) => const EProductCardVertical())
      ],
    );
  }
}
