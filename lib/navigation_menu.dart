import 'package:e_store/features/personalization/screens/setting/setting.dart';
import 'package:e_store/features/shop/screens/widget/home.dart';
import 'package:e_store/features/shop/screens/store/store.dart';
import 'package:e_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(NavigationController());
    final darkMode = EHelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>controller.selectedIndex.value =index,
            backgroundColor: darkMode ? EColors.black : EColors.white,
            indicatorColor: darkMode? EColors.white.withOpacity(0.1): EColors.black.withOpacity(0.1),
            destinations:const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(icon: Icon(Iconsax.heart), label: 'WishList'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
        ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;
  final screens =[const HomeScreen(),const StoreScreen(),const FavouriteScreen(),const SettingScreen()];
}
