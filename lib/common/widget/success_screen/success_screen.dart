import 'package:e_store/common/styles/spacing_style.dart';
import 'package:e_store/utils/constants/sizes.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key , required this.image, required this.title ,required this.subtitle,required this.onPressed});

  final String image, title , subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: ESpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(image:AssetImage(image),width: EHelperFunction.screnWidth() * 0.6,),
              const SizedBox(height: ESizes.spaceBtwSection,),
              Text(title,style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwItems,),
              Text(subtitle,style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: ESizes.spaceBtwSection,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed:onPressed, child: const Text(ETexts.eContinue)),),



            ],
          ),
        ),
      ),
    );
  }
}
