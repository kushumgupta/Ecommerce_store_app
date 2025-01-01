import 'package:e_store/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/repositories_authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async{

  // add binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // -- GetX Local  Storage
  await GetStorage.init();
  // Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize  Firebase
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo: Initialize authentication

  
  runApp(const App());
}

