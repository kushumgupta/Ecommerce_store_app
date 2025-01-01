import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store/data/repositories/repositories_authentication/authentication_repository.dart';
import 'package:e_store/features/personalization/models/user_model.dart';
import 'package:e_store/utils/exceptions/firebase_exceptions.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

 // function to save user data to firebase.
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }

  // function to fetch user details base on user ID.
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }
  // Function to update user data in firestore.
  Future<void> updateUserDetails(UserModel updatedUser) async{
    try{
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }
  // update any field in specific user collection.
  Future<void> updateSingleField(Map<String, dynamic>json) async{
    try{
      await _db.collection('Users').doc().update(json);
    } on FirebaseException catch (e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }
// function to remove user data from firestore.
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }
}