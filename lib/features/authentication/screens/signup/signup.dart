import 'package:e_store/common/widget/login_signup/form_divider.dart';
import 'package:e_store/common/widget/login_signup/social_buttons.dart';
import 'package:e_store/features/authentication/screens/signup/widget/signup_widget.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.arrow_left))],
      ),
      body: SingleChildScrollView(
        child: Padding(padding:const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ETexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: ESizes.spaceBtwSection),
            // -- form
            const SignupForm(),
            const SizedBox(height: ESizes.spaceBtwSection),
            //--divider
            EFormDivider(dividerText: ETexts.orSignInWith.capitalize!),
            const SizedBox(height: ESizes.spaceBtwSection),
            //-- social
            const ESocialButton(),

          ],
        ),),
      ),
    );
  }
}


