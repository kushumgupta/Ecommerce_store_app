import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shades/containers/rounded_container.dart';

class ECouponCode extends StatelessWidget {
  const ECouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ERoundedContainer(
      showBorder: true,
      backgroundColor: dark ? EColors.dark :EColors.white,
      padding:const EdgeInsets.only(top: ESizes.sm ,bottom: ESizes.sm,right: ESizes.sm ,left: ESizes.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a Promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? EColors.white.withOpacity(0.5): EColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: EColors.grey.withOpacity(0.1)),

              ),
              child:const Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
