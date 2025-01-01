import 'package:e_store/features/authentication/controllers_onboarding/forget_password/forget_password_controller.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-- Header
            Text(ETexts.forgetPasswordTitle,style:Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: ESizes.spaceBtwItems,),
            Text(ETexts.forgetPasswordSubTitle,style:Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: ESizes.spaceBtwSection * 2),
            // -- TextField
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: EValidator.validateEmail,
                decoration:const InputDecoration(labelText: ETexts.email,prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwSection,),

            //-- Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(),
                  child: const Text(ETexts.submit)),)
          ],
        ),
      ),
    );
  }
}
