import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/features/personalization/screens/address/address_screen/add_new_address.dart';
import 'package:e_store/features/personalization/screens/address/address_screen/single_address.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: EColors.primary,
          onPressed: () => Get.to(const AddNewAddressScreen()),
        child: const Icon(Iconsax.add,color: EColors.white),
      ),
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Addresses',style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              ESingleAddress(selectedAddress: true),
              ESingleAddress(selectedAddress: true),

            ],
          ),
        ),
      ),

    );
  }
}
