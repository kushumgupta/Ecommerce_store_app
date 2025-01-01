import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_shades/curved_edges/Curved_edges_widget.dart';
import '../../../../common/widget/icons/circular_icon.dart';
import '../../../../common/widget/images/rounded_images.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class EProductImageSlider extends StatelessWidget {
  const EProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return ECurvedEdgesWidget(
        child: Container(
          color: dark  ? EColors.darkerGrey : EColors.light ,
          child: Stack(
            children: [
              const SizedBox(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(ESizes.productImageRadius * 2),
                  child: Center(child: Image(image: AssetImage(EImage.shoesProduct1))),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 30,
                left: ESizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(width: ESizes.spaceBtwItems,),
                    itemBuilder: (_, index)=> ERoundedImage(
                        width: 80,
                        backgroundColor: dark ? EColors.dark :  EColors.white,
                        border: Border.all(color:EColors.primary ),
                        padding: const EdgeInsets.all(ESizes.sm),
                        imageUrl: EImage.shoesProduct2),
                  ),
                ),
              ),
              // Appbar Icons
              const EAppBar(
                showBackArrow: true,
                actions: [
                  CircularIcon(icon: Iconsax.heart5,color: Colors.red,)
                ],
              )


            ],
          ),
        )
    );
  }
}
