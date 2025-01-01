import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/common/widget/images/Circular_image.dart';
import 'package:e_store/common/widget/text/section_heading.dart';
import 'package:e_store/features/personalization/screens/profile/profile_menu.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_store/features/personalization/controllers/user_controller.dart';

import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const EAppBar(showBackArrow: true, title: Text('Profile'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const ECircularImage(
                      image: EImage.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems /2),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems,),

              // -- Heading Profile info
              const ESectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),

              EProfileMenu(onPressed: () {}, title: "Name",value: controller.user.value.fullName,),
              EProfileMenu(onPressed: () {}, title: "Username",value: controller.user.value.username,),

              const SizedBox(height: ESizes.spaceBtwItems ),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems,),

              // -- Heading Profile info
              const ESectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: ESizes.spaceBtwItems,),

              EProfileMenu(onPressed: () {}, title: "Used ID",value: controller.user.value.id,icon:Iconsax.copy,),
              EProfileMenu(onPressed: () {}, title: "E-mail",value: controller.user.value.email,),
              EProfileMenu(onPressed: () {}, title: "Phone Number ",value: controller.user.value.phoneNumber,),
              EProfileMenu(onPressed: () {}, title: "Gender",value: 'female',),
              EProfileMenu(onPressed: () {}, title: "Date of Birth",value: '11 jun, 2001',),
              const Divider(),
              const SizedBox(height: ESizes.spaceBtwItems),

              Center(child:
              TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child:const Text('Close Account ', style: TextStyle(color: Colors.red),)
              ),)


            ],
          ),
        ),
      ),
    );
  }
}

