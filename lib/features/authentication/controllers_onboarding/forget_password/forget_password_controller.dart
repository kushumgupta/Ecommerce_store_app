import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();


  // variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
   sendPasswordResetEmail()async{
     try{
       EFullScreenLoader.openLoadingDialog('Processing your request...', EImage.todoListAnimation);
       // check internet Connectivity
       final isConnected =await NetworkManager.instance.isConnected();
       if(!isConnected){
         EFullScreenLoader.stopLoading();
         return;
       }
       // form validation
       if(!forgetPasswordFormKey.currentState!.validate()){
         EFullScreenLoader.stopLoading();
         return;
       }
        // send email to reset password
       await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
       // remove loader
       EFullScreenLoader.stopLoading();
       // show success screen
       ELoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

       //Redirect
       Get.to(()=> ResetPassword(email: email.text.trim()));

     } catch (e){
       //remove loader
       EFullScreenLoader.stopLoading();
       ELoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
     }
   }



  resendPasswordResetEmail(String email)async{
    try{
      EFullScreenLoader.openLoadingDialog('Processing your request...', EImage.todoListAnimation);
      // check internet Connectivity
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }
      // send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      // remove loader
      EFullScreenLoader.stopLoading();
      // show success screen
      ELoaders.successSnackBar(title: 'Email Sent', message: 'Email link sent to reset your password'.tr);

    } catch (e){
      //remove loader
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

}