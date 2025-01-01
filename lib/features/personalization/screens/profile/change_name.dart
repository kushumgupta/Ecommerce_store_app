import 'package:e_store/common/widget/appbar/appbar.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_string.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/update_name_controller.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: EAppBar(
        showBackArrow: true,
        title: Text('Change Name',style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
          padding:const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Use real name of easy verification. This name will appear on several pages.',
            style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: ESizes.spaceBtwSection,),

            Form(
                child:Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => EValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: ETexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                    SizedBox(height: ESizes.spaceBtmInputFields,),
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => EValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(labelText: ETexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                ),
            ),
            const SizedBox(height: ESizes.spaceBtwSection,),

            SizedBox(width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
