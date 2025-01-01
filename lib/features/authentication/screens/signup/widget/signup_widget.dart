import 'package:e_store/features/authentication/controllers_onboarding/signup/signup_controller.dart';
import 'package:e_store/features/authentication/screens/signup/widget/term_condition_widget.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child:TextFormField(
                    controller: controller.firstName,
                    validator: (value) => EValidator.validateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: ETexts.firstName, prefixIcon: Icon(Iconsax.user)),
              )),

              const SizedBox(width: ESizes.spaceBtmInputFields),

              Expanded(
                  child:TextFormField(
                    controller: controller.lastName,
                    validator: (value) => EValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: ETexts.lastName, prefixIcon: Icon(Iconsax.user)),
              )),
            ],
          ),
          const SizedBox(height: ESizes.spaceBtmInputFields),

          TextFormField(
            controller: controller.userName,
            validator: (value) => EValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(labelText: ETexts.username, prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(height: ESizes.spaceBtmInputFields),

          TextFormField(
            controller: controller.email,
            validator: (value) => EValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: ETexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(height: ESizes.spaceBtmInputFields),

          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => EValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: ETexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(height: ESizes.spaceBtmInputFields),

          Obx(
                () => TextFormField(
              controller: controller.password,
              validator: (value) => EValidator.validatePassword(value),
              obscureText:controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: ETexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed:() => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
              ),
            ),
          ),
          const SizedBox(height: ESizes.spaceBtmInputFields),

          const TermCondition(),

          const SizedBox(height: ESizes.spaceBtwSection),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(ETexts.createAccount)),
          )
        ],
      ),
    );
  }
}
