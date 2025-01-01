import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/shop/screens/product_details/bottom_add_to_cart.dart';
import 'package:e_store/features/shop/screens/product_details/product_attributes.dart';
import 'package:e_store/features/shop/screens/product_details/product_detail_image_slider.dart';
import 'package:e_store/features/shop/screens/product_details/product_meta_data.dart';
import 'package:e_store/features/shop/screens/product_details/rating_share.dart';
import 'package:e_store/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const EBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //-- 1 - Product Image Slider
            const EProductImageSlider(),

            // -- 2 - Product details
            Padding(padding: const EdgeInsets.only(right: ESizes.defaultSpace,left: ESizes.defaultSpace,bottom: ESizes.defaultSpace),
            child: Column(
              children: [
                // Rating and share
                const ERatingAndShare(),
                // Price , Title, stock and brand
                const EProductMetaData(),
                // -- Attributes
                const ProductAttributes(),
                const SizedBox(height: ESizes.spaceBtwSection),
                //-- Checkout Button
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){}, child:const Text('Checkout')),),
                //-- Description
                const SizedBox(height: ESizes.spaceBtwSection),
                const ESectionHeading(title: 'Description' ,showActionButton: false,),
                const SizedBox(height: ESizes.spaceBtwItems,),
                const ReadMoreText('Step up your style with our Classic Leather Sneakers. Designed for both comfort and durability, these sneakers feature premium quality leather and a cushioned insole for all-day wear.',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Less',
                moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(height: ESizes.spaceBtwItems,),
                Row(
                  children: [
                    const ESectionHeading(title: 'Reviews (199)',showActionButton: false,),
                    IconButton(icon: const Icon(Iconsax.arrow_right_3,size: 18),onPressed: () => Get.to(const ProductReviewScreen()),),
                  ],
                ),
                const SizedBox(height: ESizes.spaceBtwSection ,)


                //-- reviews


              ],
            ),
            ),

          ],

        ),
      ),
    );
  }
}

