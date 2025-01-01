import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.maxLines = 1 ,
    this.textColor,
    this.iconColor = EColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.color,
  });

  final String title;
  final Color? color;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;


  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
        ?Theme.of(context).textTheme.labelMedium!.apply(color: color)
        :brandTextSize == TextSizes.medium
          ?Theme.of(context).textTheme.bodyLarge!.apply(color: color)
          :brandTextSize == TextSizes.large
          ?Theme.of(context).textTheme.titleLarge!.apply(color: color)
          :Theme.of(context).textTheme.bodyMedium!.apply(color: color)
    );
  }
}
