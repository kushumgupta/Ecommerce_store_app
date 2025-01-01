

import 'dart:async';

import 'package:e_store/common/widget/success_screen/success_screen.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/constants/text_string.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories_authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance  => Get.find();


// Send Email whenever verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // -- Send Email verification Link
   sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      ELoaders.successSnackBar(title: 'Email send', message: 'Please check your indox and verify your email.');
    }catch(e){
      ELoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
   }

// --- Timer to automatically  redirect on Email Verification
setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1),(timer)async{
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(
            () => SuccessScreen(
                image: EImage.successfullyRegisterAnimation,
                title: ETexts.yourAccountCreatedTitle,
                subtitle: ETexts.yourAccountCreatedSubTitle,
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),

            )
        );
      }

    });
}
// -- manually check if Email Verified

  checkEmailVerificationStatus()async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
              () => SuccessScreen(
            image: EImage.successfullyRegisterAnimation,
            title: ETexts.yourAccountCreatedTitle,
            subtitle: ETexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),

          )
      );

    }
  }
}