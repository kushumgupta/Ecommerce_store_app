import 'package:e_store/common/widget/images/Circular_image.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shades/containers/rounded_container.dart';
import '../text/brand_title_text_with_verified_icon.dart';
/// A card widget representing a brand.
class EBrandCard extends StatelessWidget {
  /// Default constructor for the TBrandCard.
  ///
  /// Parameters:
  ///   - brand: The brand model to display.
  ///   - showBorder: A flag indicating whether to show a border around the card.
  ///   - onTap: Callback function when the card is tapped.
  const EBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = EHelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      /// Container Design
      child: ERoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(ESizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// -- Icon
            Flexible(
              child: ECircularImage(
                image: EImage.clothIcon,
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                overlayColor: isDark ? EColors.white : EColors.black,
              ),
            ),
            const SizedBox(width: ESizes.spaceBtwItems / 2),

            /// -- Texts
            // [Expanded] & Column [MainAxisSize.min] is important to keep the elements in the vertical center and also
            // to keep text inside the boundaries.
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleTextWithVerifiedIcon(title:'Nike', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}