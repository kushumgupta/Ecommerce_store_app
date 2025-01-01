import 'package:e_store/features/authentication/controllers_onboarding/login/login_controller.dart';
import 'package:e_store/utils/constants/colors.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ESocialButton extends StatelessWidget {
  const ESocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border:Border.all(color: EColors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon:const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImage.google),),
          ),
        ),
        const SizedBox(width: ESizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(border:Border.all(color: EColors.grey),borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: (){},
            icon:const Image(
              width: ESizes.iconMd,
              height: ESizes.iconMd,
              image: AssetImage(EImage.facebook),),
          ),
        ),
      ],
    );
  }
}
