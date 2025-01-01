import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shades/containers/rounded_container.dart';
import 'brand_card.dart';

class EBrandShowCase extends StatelessWidget {
  const EBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ERoundedContainer(
      showBorder: true,
      borderColor: EColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(ESizes.md),
      margin: const EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Column(
        children: [
          const EBrandCard(showBorder: false),
          const SizedBox(height: ESizes.spaceBtwItems,),
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
}
Widget brandTopProductImageWidget(String image, context){
  return Expanded(
    child: ERoundedContainer(
      height: 100,
      backgroundColor: EHelperFunction.isDarkMode(context) ? EColors.darkerGrey : EColors.light,
      margin: const EdgeInsets.only(right: ESizes.sm),
      child: const Image(fit: BoxFit.contain, image: AssetImage(EImage.shoesProduct1)),
    ),
  );
}