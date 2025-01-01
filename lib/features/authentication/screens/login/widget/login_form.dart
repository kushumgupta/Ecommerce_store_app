import 'package:e_store/features/authentication/controllers_onboarding/login/login_controller.dart';
import 'package:e_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_store/features/authentication/screens/signup/signup.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ELoginForm extends StatelessWidget {
  const ELoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dark = EHelperFunction.isDarkMode(context);
    return Form(
      key: controller.loginFormKey,
        child:Padding(
          padding: const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSection),
          child: Column(
            children: [
              //email
              TextFormField(
                controller: controller.email,
                validator: (value) => EValidator.validateEmail(value),
                decoration:const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),
                    labelText: ETexts.email),
              ),
              const SizedBox(height: ESizes.spaceBtmInputFields),
              // -- password
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
              const SizedBox(height: ESizes.spaceBtmInputFields/2),

              //-- Rememxber me & forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(
                            ()=>Checkbox(value: controller.rememberMe.value,
                              onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value,
                          activeColor: dark ? EColors.white : EColors.primary,),
                      ),
                      const Text(ETexts.rememberMe),
                    ],
                  ),
                  // -- forget password
                  TextButton(onPressed:() =>  Get.to(() => const ForgetPassword()), child: const Text(ETexts.forgetPassword)),
                ],
              ),
              const SizedBox(height: ESizes.spaceBtwSection),
              // -- Sign in Button
              SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed:() => controller.emailAndPasswordSignIn(), child:const Text(ETexts.singIn)),),
              // -- Create Account Button
              const SizedBox(height: ESizes.spaceBtwItems,),
              SizedBox(width: double.infinity,
                  child: OutlinedButton(onPressed:()=> Get.to(const SignUp()), child:const Text(ETexts.createAccount))),
              const SizedBox(height: ESizes.spaceBtwItems,)
            ],
          ),
        )
    );
  }
}


