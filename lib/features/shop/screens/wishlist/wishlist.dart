import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/icons/circular_icon.dart';
import 'package:e_store/common/widget/layout/grid_layout.dart';
import 'package:e_store/common/widget/product/product_card/product_card_vertical.dart';
import 'package:e_store/features/shop/screens/widget/home.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              EGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) =>const  EProductCardVertical()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
