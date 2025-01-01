import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/brand/brand_card.dart';
import 'package:e_store/common/widget/layout/grid_layout.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/shop/screens/brand/brand_product.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const EAppBar(title: Text('Brand'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ESectionHeading(title: 'Brands',showActionButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),

              EGridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => EBrandCard(
                      showBorder: true,
                    onTap: () => Get.to(const BrandProduct()),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
