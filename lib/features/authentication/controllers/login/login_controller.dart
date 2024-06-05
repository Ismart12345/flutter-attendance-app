// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
// import 'package:student/features/personalization/controllers/user_controller.dart';
// import 'package:student/utils/constants/image_strings.dart';
// import 'package:student/utils/popups/full_screen_loader.dart';
// import 'package:student/utils/popups/loaders.dart';

// class LoginController extends GetxController {
//   // VARIABLES
//   final remeberMe = false.obs;
//   final hidePassword = true.obs;
//   final localStorage = GetStorage();
//   final email = TextEditingController();
//   final password = TextEditingController();
//   GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
//   final userController = Get.put(UserController());

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
//     password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
//     super.onInit();
//   }

//   Future<void> emailAndPasswordSignIn() async {
//     try {
//       // START LOADING
//       TFullScreenLoader.openLoadingDialog(
//           'Logging You In', TImages.docerAnimation);
//       // FORM VALIDATION
//       if (!loginFormKey.currentState!.validate()) {
//         TFullScreenLoader.stopLoading();
//         return;
//       }
//       // SAVE DATA IF REMEMBER ME IN SELECTED
//       if (remeberMe.value) {
//         localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
//         localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
//       }

//       // LOGIN USER USEING EMAIL & PASSWORD AUTHENTICATION
//       final userCredential = await AuthenticationRepository.instance
//           .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
//       // REMOVE LOADER
//       TFullScreenLoader.stopLoading();
//       // REDIRECT
//       AuthenticationRepository.instance
//           .screenRedirect(FirebaseAuth.instance.currentUser);
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
//     }
//   }

//   // GOOGLE SIGN IN
//   Future<void> googleLogin() async {
//     try {
//       // START LOADING
//       TFullScreenLoader.openLoadingDialog(
//           'Logging You In', TImages.docerAnimation);
//       // GOOGLE AUTHENTICATION
//       final userCredentials =
//           AuthenticationRepository.instance.loginWithGoogle();
//       // SAVE USER RECORD
//       await userController.saveUserRecord(userCredentials as UserCredential?);

//       TFullScreenLoader.stopLoading();
//       // REDIRECT
//       AuthenticationRepository.instance
//           .screenRedirect(FirebaseAuth.instance.currentUser);
//     } catch (e) {
//       TFullScreenLoader.stopLoading();
//       TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
//     }
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/features/personalization/controllers/user_controller.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/popups/full_screen_loader.dart';
import 'package:student/utils/popups/loaders.dart';

class LoginController extends GetxController {
  // VARIABLES
  final remeberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // Load remembered credentials if available
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // START LOADING
      TFullScreenLoader.openLoadingDialog(
          'Logging You In', TImages.docerAnimation);
      // FORM VALIDATION
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // SAVE DATA IF REMEMBER ME IS SELECTED
      if (remeberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // LOGIN USER USING EMAIL & PASSWORD AUTHENTICATION
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // REMOVE LOADER
      TFullScreenLoader.stopLoading();

      // REDIRECT
      AuthenticationRepository.instance
          .screenRedirect(FirebaseAuth.instance.currentUser);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
    }
  }

  // GOOGLE SIGN IN
  Future<void> googleLogin() async {
    try {
      // START LOADING
      TFullScreenLoader.openLoadingDialog(
          'Logging You In', TImages.docerAnimation);

      // GOOGLE AUTHENTICATION
      final userCredentials =
          await AuthenticationRepository.instance.loginWithGoogle();

      // SAVE USER RECORD
      await userController.saveUserRecord(userCredentials);

      // REMOVE LOADER
      TFullScreenLoader.stopLoading();

      // REDIRECT
      AuthenticationRepository.instance
          .screenRedirect(FirebaseAuth.instance.currentUser);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      print('chininani');
      TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
    }
  }
}
