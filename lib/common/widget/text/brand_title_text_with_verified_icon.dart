import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1 ,
    this.textColor,
    this.iconColor = EColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child:BrandTitleText(
              title: title,
              color:textColor,
              maxLines :maxLines,
              textAlign: textAlign,
              brandTextSize: brandTextSize,
            ),
    ),
        const SizedBox(width: ESizes.xs),
        const Icon(Iconsax.verify5,
          color: EColors.primary,
          size: ESizes.iconXs,
        )
      ],
    );
  }
}
