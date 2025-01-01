import 'package:e_store/data/repositories/user/user_repository.dart';
import 'package:e_store/features/authentication/screens/login/login_screen.dart';
import 'package:e_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_store/navigation_menu.dart';
import 'package:e_store/utils/exceptions/firebase_exceptions.dart';
import 'package:e_store/utils/exceptions/format_exceptions.dart';
import 'package:e_store/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../features/authentication/screens/signup/verity_email.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  /// variable
   final deviceStorage = GetStorage();
   final _auth = FirebaseAuth.instance;

   // get Authenticated User data
  User? get authUser => _auth.currentUser;

   @override
   void onReady() {
     FlutterNativeSplash.remove();
     screenRedirect();
   }
   screenRedirect() async{
     final user = _auth.currentUser;
     if(user != null){
       if(user.emailVerified){
         Get.offAll(()=> const NavigationMenu());
       }else{
         Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email,));
       }
     } else {
       // Local Storage
       deviceStorage.writeIfNull('IsFirstTime', true);
       // Check if it's the first time launching the app
       deviceStorage.read('IsFirstTime')!= true
           ? Get.offAll(const LoginScreen())// Redirect to Login Screen if not the first time
           : Get.offAll(const Onboarding()); //Redirect to OnBoarding Screen if it's the first time

     }

   }

/*   -------------------------------Email & password sign-in -------------------------------------- */

// --  [EmailAuthentication] -SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email , String password)async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      throw EFirebaseException(e.code).message;
    }on FirebaseException catch(e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }


// -- [EmailAuthentication] - REGISTER
    Future<UserCredential> registerWithEmailAndPassword(String email , String password)async{
      try{
        return await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch(e){
        throw EFirebaseException(e.code).message;
      }on FirebaseException catch(e){
        throw EFirebaseException(e.code).message;
      }on FormatException catch(_){
        throw const EFormatException();
      } on EPlatformException catch(e){
        throw EPlatformException(e.code).message;
      }catch (e){
        throw 'Something went wrong, Please try again';
      }
    }

    // -- [EmailVerification] - MAIL VERIFICATION
    Future<void> sendEmailVerification() async{
      try{
        await _auth.currentUser?.sendEmailVerification();
      } on FirebaseAuthException catch(e){
        throw EFirebaseAuthException(e.code).message;
      }on FirebaseException catch(e){
        throw EFirebaseException(e.code).message;
      }on FormatException catch(_){
        throw const EFormatException();
      } on EPlatformException catch(e){
        throw EPlatformException(e.code).message;
      }catch (e){
        throw 'Something went wrong, Please try again';
      }
  }

  // [EMAIL AUTHENTICATION] -FORGOT PASSWORD
  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw EFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }
  //  [RE AUTHENTICATION ] -RE Authentication USER

  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      //create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      // re authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch(e){
      throw EFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }



  /* ------------------------- Federated identity & social Sign-in ----------------------------*/

  // -- [GOOGLE AUTHENTICATION] - GOOGLE

  Future<UserCredential?> signInWithGoogle() async{
    try{
      //trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //obtain the auth detail from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;
      // create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken,idToken: googleAuth?.idToken);
      // once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch(e){
      throw EFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      if(kDebugMode)print('Something went wrong: $e');
      return null;
    }
  }

  // -- [FACEBOOK AUTHENTICATION] -FACEBOOK

  /* ------------------------- ./END Federated identity & social Sign-in ----------------------------*/
  //-- [LOGOUT USER] - Valid for any authentication
  Future<void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginScreen());
    } on FirebaseAuthException catch(e){
      throw EFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
      throw EFirebaseException(e.code).message;
    }on FormatException catch(_){
      throw const EFormatException();
    } on EPlatformException catch(e){
      throw EPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong, Please try again';
    }
  }

  // Delete user - remove user auth and firestore account.

  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e){
      throw EFirebaseAuthException(e.code).message;
    }on FirebaseException catch(e){
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