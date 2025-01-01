import 'package:e_store/features/authentication/controllers_onboarding/forget_password/forget_password_controller.dart';
import 'package:e_store/features/authentication/screens/login/login_screen.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))

        ],
      ),
      body:SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
          child: Column(
            children: [
              //--image with 60% of screen  width
              Image(image:const AssetImage(EImage.emailVerify),width: EHelperFunction.screnWidth() * 0.6,),
              const SizedBox(height: ESizes.spaceBtwSection,),
              //-- Title and SubTitle
              Text(ETexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwItems,),
              Text(ETexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwSection,),
              // -- Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed:()=> Get.offAll(()=>const LoginScreen()), child: const Text(ETexts.done)),),
              const SizedBox(height: ESizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed:() => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(ETexts.resendEmail)),),


            ],
          ),
        ),
      ),
    );
  }
}
