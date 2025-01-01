

import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/features/personalization/controllers/user_controller.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/network_manager.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  final rememberMe =false.obs;
  final hidePassword = false.obs;
  final localStorage =GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey =GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void>emailAndPasswordSignIn() async{
    try{
      // start loading
      EFullScreenLoader.openLoadingDialog('Loading you in....', EImage.todoListAnimation);
      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if(!loginFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }
      // save data if remember me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL',email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredentials =await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      EFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  Future<void> googleSignIn() async{
    try{
      // start loading
      EFullScreenLoader.openLoadingDialog('Loading you in...', EImage.todoListAnimation);

      // check internet connectivity
      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }
      //Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();
      // save user Record
      await userController.saveUserRecord(userCredentials);
      //remove loader
      EFullScreenLoader.stopLoading();
      //redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e){
      //remove loader
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}