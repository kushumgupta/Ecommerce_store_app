import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EBillingAddressSection extends StatelessWidget {
  const EBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ESectionHeading(title: 'Shopping Address',buttonTitle: 'Change',onPressed: (){},),
        Text('Coding With K',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: EColors.grey,size: 16,),
            const SizedBox(width: ESizes.spaceBtwItems,),
            Text('9876543210', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: ESizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: EColors.grey,size: 16,),
            const SizedBox(width: ESizes.spaceBtwItems,),
            Expanded(child: Text('South Liana, maine 87654 USA', style: Theme.of(context).textTheme.bodyMedium,))
          ],
        ),

      ],
    );
  }
}
