import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/custom_shades/containers/primary_header_container.dart';
import 'package:e_store/common/widget/list/setting_menu_tiles.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/personalization/screens/address/address.dart';
import 'package:e_store/features/personalization/screens/profile/profile.dart';
import 'package:e_store/features/shop/screens/order/order.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/list/user_profile_tile.dart';
import '../../../../data/repositories/repositories_authentication/authentication_repository.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            EPrimaryHeaderContainer(
                child: Column(
                  children: [
                    //-- Appbar
                    EAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: EColors.white))),
                    const SizedBox(height: ESizes.spaceBtwSection),
                    //-- User Profile card
                    EUserProfileTile(onPressed:() => Get.to(const ProfileScreen()),),
                    const SizedBox(height: ESizes.spaceBtwSection),

                  ],
                )
            ),
            Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
            child: Column(
              children: [const ESectionHeading(title: 'Account Setting', showActionButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),
                ESettingMenuTiles(icon: Iconsax.safe_home, title: 'My Addresses', subtitle: 'Set shopping delivery address',onTab: ()=> Get.to(const UserAddressScreen()),),
                const ESettingMenuTiles(icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add, remove  product and move to checkout'),
                ESettingMenuTiles(icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress and Completed orders',onTab: () => Get.to(const OrderScreen()),),
                const ESettingMenuTiles(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account'),
                const ESettingMenuTiles(icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discount coupons'),
                const ESettingMenuTiles(icon: Iconsax.notification, title: 'Notification', subtitle: 'Set any kind of notification message'),
                const ESettingMenuTiles(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts'),

                // App setting

                const SizedBox(height: ESizes.spaceBtwSection,),
                const ESectionHeading(title: 'App Setting', showActionButton: false),
                const SizedBox(height: ESizes.spaceBtwItems),
                const ESettingMenuTiles(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload data to your cloud firebase'),

                ESettingMenuTiles(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                  trailing: Switch(value: false, onChanged:(value){}),),
                ESettingMenuTiles(
                  icon: Iconsax.security_user,
                  title: 'Safe Mode',
                  subtitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged:(value){}),),
                ESettingMenuTiles(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subtitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged:(value){}),),

                const SizedBox(height: ESizes.spaceBtwSection,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: ()async {
                    await AuthenticationRepository.instance.logout();
                  }, child: const Text('Logout')),
                ),
                const SizedBox(height: ESizes.spaceBtwSection * 2.5),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}

