import 'package:e_store/common/widget/custom_shades/containers/rounded_container.dart';
import 'package:e_store/features/shop/screens/cart/cart_item.dart';
import 'package:e_store/features/shop/screens/checkout/billing/billing_address_section.dart';
import 'package:e_store/features/shop/screens/checkout/billing/billing_payment_section.dart';
import 'package:e_store/navigation_menu.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/product/cart/coupon_code.dart';
import '../../../../common/widget/success_screen/success_screen.dart';
import '../../../../utils/constants/image_strings.dart';
import 'billing/billing_amount_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: EAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding:const  EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              const ECartItems(showAddRemoveButtons: false),
              const SizedBox(height: ESizes.spaceBtwSection),
              const ECouponCode(),
              const SizedBox(height: ESizes.spaceBtwSection,),


              ERoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(ESizes.md),
                backgroundColor: dark ? EColors.black : EColors.white,
                child: const Column(
                  children: [
                    EBillingAmountSection(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    Divider(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    EBillingPaymentSection(),
                    SizedBox(height: ESizes.spaceBtwItems),

                    EBillingAddressSection()
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(SuccessScreen(
              image: EImage.successfulPaymentIcon,
              title: 'Payment Success',
              subtitle: 'your Item will be shipped soon!',
              onPressed: () => Get.to( const NavigationMenu()),
            )),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}
