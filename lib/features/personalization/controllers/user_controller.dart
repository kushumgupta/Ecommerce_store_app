
import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/authentication/screens/login/login_screen.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/network_manager.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/sizes.dart';
import '../models/user_model.dart';
import '../screens/profile/re_auth_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword =TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override onInit(){
    super.onInit();
    fetchUserRecord();
  }
  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value =true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }finally{
      profileLoading.value =false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(
            userCredentials.user!.displayName ?? '');

        final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join('') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? ''
        );
        // saved user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      ELoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. you can re-save your data in your profile '
      );
    }
  }
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(ESizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async =>deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: ESizes.lg),child:Text('Delete'),)
      ),
      cancel: OutlinedButton(
          child:const Text('Cancel'),
      onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }
  void deleteUserAccount()async{
    try{
      EFullScreenLoader.openLoadingDialog("Processing",EImage.todoListAnimation);
      //first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if(provider.isNotEmpty){
        // re verify auth email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          EFullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());
        }else if(provider == 'password'){
          EFullScreenLoader.stopLoading();
          Get.offAll(() => const ReAuthLoginForm());
        }
      }
    }catch (e){
      EFullScreenLoader.stopLoading();
      ELoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser()async{
    try{
      EFullScreenLoader.openLoadingDialog("Processing",EImage.todoListAnimation);
      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }
      if(!reAuthFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      EFullScreenLoader.stopLoading();
      Get.offAll(()=> const LoginScreen());
    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
}