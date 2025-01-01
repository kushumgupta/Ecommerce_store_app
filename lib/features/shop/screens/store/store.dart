import 'package:e_store/common/widget/brand/brand_card.dart';
import 'package:e_store/common/widget/custom_shades/containers/search_container.dart';
import 'package:e_store/common/widget/layout/grid_layout.dart';
import 'package:e_store/common/widget/product/cart/cart_menu_icon.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/shop/screens/brand/all_brand.dart';
import 'package:e_store/features/shop/screens/store/categories_tab.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/appbar/tabbar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: EAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            ECartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: EHelperFunction.isDarkMode(context)
                      ? EColors.black
                      : EColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(ESizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: ESizes.spaceBtwItems),
                        const ESearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: ESizes.spaceBtwSection,
                        ),

                        // -- Feature Brand
                        ESectionHeading(
                            title: 'Feature Brands', onPressed: () => Get.to (const AllBrandScreen())),
                        const SizedBox(height: ESizes.spaceBtwItems / 1.5),
                        EGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return const EBrandCard(showBorder: false);
                            }),
                      ],
                    ),
                  ),
                  bottom: const ETabBar(tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ]),
                )
              ];
            },
            body: const TabBarView(
                children:[
                  ECategoriesTab(),
                  ECategoriesTab(),
                  ECategoriesTab(),
                  ECategoriesTab(),
                  ECategoriesTab(),
                ]
            ),
        ),
      ),
    );
  }
}

