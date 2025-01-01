import 'package:e_store/common/widget/custom_shades/containers/primary_header_container.dart';
import 'package:e_store/common/widget/custom_shades/containers/search_container.dart';
import 'package:e_store/common/widget/layout/grid_layout.dart';
import 'package:e_store/common/widget/product/product_card/product_card_vertical.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/shop/screens/all_product/all_products.dart';
import 'package:e_store/features/shop/screens/widget/home_appbar.dart';
import 'package:e_store/features/shop/screens/widget/promo_slider.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_catrgories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const EPrimaryHeaderContainer(
              child: Column(
                children: [
                  EHomeAppBar(),
                  SizedBox(
                    height: ESizes.spaceBtwSection,
                  ),
                  ESearchContainer(
                    text: "Search in Store",
                  ),
                  SizedBox(
                    height: ESizes.spaceBtwSection,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: ESizes.defaultSpace),
                    child: Column(
                      children: [
                        ESectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: EColors.white,
                        ),
                        SizedBox(
                          height: ESizes.spaceBtwItems,
                        ),
                        // Categories
                        HomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height:ESizes.spaceBtwSection),
                ],
              ),
            ),
            // -- body
            Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                children: [
                  // -- promo Slider
                  const EPromoSlider(banner: [EImage.promoBanner1,EImage.promoBanner2,EImage.promoBanner3,],),
                  const SizedBox(height: ESizes.spaceBtwSection,),
                  
                  ESectionHeading(title:'Popular Product', onPressed: () => Get.to(const AllProducts()),),
                  EGridLayout(itemCount: 4,itemBuilder: (_, index) => const EProductCardVertical(),
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

