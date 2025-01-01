import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class EBillingAmountSection extends StatelessWidget {
  const EBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: ESizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.0',style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.0',style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],

    );
  }
}

