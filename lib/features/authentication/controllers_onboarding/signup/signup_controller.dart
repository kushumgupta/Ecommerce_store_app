import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/authentication/screens/signup/verity_email.dart';
import 'package:e_store/features/personalization/models/user_model.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/network_manager.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //-- variables
  final hidePassword = true.obs;// Observable for hiding/ showing password
  final privacyPolice = true.obs;
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final userName = TextEditingController(); // Controller for user name input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // -- SIGNUP

  void signup() async{
    try{
      //Starts Loading
      EFullScreenLoader.openLoadingDialog('we are processing your information...', EImage.todoListAnimation);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }


      //form Validation
      if(!signupFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }



      // privacy policy check
      if(!privacyPolice.value){
        ELoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
        message: 'In order to create account, you must have to read and accept the Privacy policy & term of use.',
        );
        return;
      }

      // Register use in firebase Authentication & save user data  in the firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authentication user data in the Firebase Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: userName.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture:'',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      EFullScreenLoader.stopLoading();

      // Show Success Message
      ELoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! Verify email to continue.');

      // Move to verify Email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    }catch(e) {
      // Remove loader
      EFullScreenLoader.stopLoading();

      // Show  some Generic Error to the user
      ELoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }
  }
}