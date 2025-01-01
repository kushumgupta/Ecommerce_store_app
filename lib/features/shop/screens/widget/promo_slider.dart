import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_store/common/widget/custom_shades/containers/circular_container.dart';
import 'package:e_store/common/widget/images/rounded_images.dart';
import 'package:e_store/features/shop/controllers/home_controller.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EPromoSlider extends StatelessWidget {
  const EPromoSlider({
    super.key, required this.banner,
  });

  final List<String> banner;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banner.map((url) => ERoundedImage(imageUrl:url, backgroundColor: null,)).toList(),
        ),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banner.length; i++)
                  ECircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value ==  i ? EColors.primary: EColors.grey,
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
