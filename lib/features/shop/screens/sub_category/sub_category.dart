import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/images/rounded_images.dart';
import 'package:e_store/common/widget/product/product_card/product_card_horizontal.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const  EAppBar(title: Text('Sports shirts'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ERoundedImage(width:double.infinity, imageUrl: EImage.promoBanner1,applyImageRadius: true,),
              const SizedBox(height: ESizes.spaceBtwSection),
              Column(
                children: [
                  ESectionHeading(title: "Sports shirts", onPressed: (){}),
                  const SizedBox(height: ESizes.spaceBtwItems/2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      separatorBuilder: (context,index) => const SizedBox(width: ESizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const EProductCardHorizontal(),
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
