import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/personalization/controllers/user_controller.dart';
import 'package:e_store/features/personalization/screens/profile/profile.dart';
import 'package:e_store/utils/constants/image_strings.dart';
import 'package:e_store/utils/helpers/network_manager.dart';
import 'package:e_store/utils/popups/full_screen_loader.dart';
import 'package:e_store/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames()async{
    firstName.text = userController.user.value.firstName;
    lastName.text =userController.user.value.lastName;
  }

  Future<void>updateUserName()async{
    try{
      EFullScreenLoader.openLoadingDialog('We are updating your information...', EImage.todoListAnimation);

      final isConnected =await NetworkManager.instance.isConnected();
      if(!isConnected){
        EFullScreenLoader.stopLoading();
        return;
      }
      if (!updateUserNameFormKey.currentState!.validate()){
        EFullScreenLoader.stopLoading();
        return;
      }

      Map<String,dynamic> name ={'FirstName':firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      EFullScreenLoader.stopLoading();

      ELoaders.successSnackBar(title: 'Congratulation',message: 'Your Name has been updated');

      Get.off(()=> const ProfileScreen());
    }catch(e){
      EFullScreenLoader.stopLoading();
      ELoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
