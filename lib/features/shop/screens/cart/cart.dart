import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/features/shop/screens/checkout/checkout.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall,)),
      body: const Padding(padding:EdgeInsets.all(ESizes.defaultSpace),
        child: ECartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(const CheckoutScreen()),
            child:const Text('Checkout \$256.0')),
      ),
    );
  }
}

