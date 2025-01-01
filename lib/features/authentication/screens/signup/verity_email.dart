import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers_onboarding/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: SingleChildScrollView(
         child: Padding(padding: const EdgeInsets.all(ESizes.defaultSpace),
         child: Column(
           children: [
             Image(image: const AssetImage(EImage.emailVerify),width: EHelperFunction.screnWidth() * 0.6,),
             const SizedBox(height: ESizes.spaceBtwSection,),
             Text(ETexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
             const SizedBox(height: ESizes.spaceBtwItems,),
             Text(email ?? '',style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
             const SizedBox(height: ESizes.spaceBtwItems,),
             Text(ETexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
             const SizedBox(height: ESizes.spaceBtwSection,),

             SizedBox(
               width: double.infinity,
               child: ElevatedButton(onPressed:  () => controller.checkEmailVerificationStatus(),
                   child: const Text(ETexts.eContinue)),),
             const SizedBox(height: ESizes.spaceBtwItems,),
             SizedBox(width: double.infinity,child: TextButton(onPressed: ()=> controller.sendEmailVerification(), child: const Text(ETexts.resendEmail)),),


           ],
         ),),
      ),
    );
  }
}
