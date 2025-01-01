import 'package:e_store/common/widget/login_signup/form_divider.dart';
import 'package:e_store/common/widget/login_signup/social_buttons.dart';
import 'package:e_store/common/styles/spacing_style.dart';
import 'package:e_store/features/authentication/screens/login/widget/login_form.dart';
import 'package:e_store/features/authentication/screens/login/widget/login_header.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(padding: ESpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // logo title & subtitle
              const ELoginHeader(),
              const ELoginForm(),
              //-- divider
              EFormDivider(dividerText:ETexts.orSignInWith.capitalize!),
              const SizedBox(width: ESizes.spaceBtwSection,),
              //--Footer
              const ESocialButton()
            ],
          ),
        ),
      ),
    );
  }
}






