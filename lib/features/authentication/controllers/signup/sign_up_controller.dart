// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:student/data/repositories/user/user_repository.dart';
// import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
// import 'package:student/features/authentication/models/user_model.dart';
// import 'package:student/features/authentication/screens/signup/verify_email.dart';
// import 'package:student/navigation_menu.dart';
// import 'package:student/utils/constants/image_strings.dart';
// import 'package:student/utils/popups/full_screen_loader.dart';
// import 'package:student/utils/popups/loaders.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

//   // VARIABLES
//   final hiddenPassword = true.obs;
//   final privacyPolicy = true.obs;
//   final email = TextEditingController();
//   final lastName = TextEditingController();
//   final firstName = TextEditingController();
//   final password = TextEditingController();
//   final phoneNumber = TextEditingController();

//   GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

//   // SIGNUP
//   Future<void> signUp() async {
//     try {
//       //START LOADING
//       TFullScreenLoader.openLoadingDialog(
//           'We are processing you information', TImages.docerAnimation);

//       final authRepository = Get.put(AuthenticationRepository());

//       // CHECK INTERNET CONNECTIVITY
//       // final isConnected = await NetworkManager.instance.isConnected();
//       // if (!isConnected) {
//       //   return;
//       // }

//       // FORM VALIDATION
//       if (!signUpFormKey.currentState!.validate()) {
//         return;
//       }
//       print('behera');

//       // PRIVACY POLICY CHECK
//       if (!privacyPolicy.value) {
//         TLoaders.warningSnackBar(
//             title: 'Accept Privacy Policy',
//             message:
//                 'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.');
//         return;
//       }
//       //REGISTER USER IN THE FIREBASE AUTHENTICAION & SAVE USER DATA IN THE FIREBASE
//       final UserCredential = await authRepository.registerWithEmailAndPassoword(
//           email.text.trim(), password.text.trim());

//       //SAVE AUTHENTICATION USER DATA IN THE FIREBASE FIRESTORE
//       final newUser = UserModel(
//           id: UserCredential.user!.uid,
//           firstName: firstName.text.trim(),
//           lastName: lastName.text.trim(),
//           email: email.text.trim(),
//           phoneNumber: phoneNumber.text.trim(),
//           profilePicture: '');

//       final userRepository = Get.put(UserRepository());
//       userRepository.saveUserRecord(newUser);
//       Get.to(() => VerifyEmail());
//       //SHOW SUCCESS MESSAGE
//       TLoaders.successSnackBar(
//           title: 'Congratulations',
//           message: 'Your accound has been created verity email to continue.');
//     } catch (e) {
//       TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
//     } finally {
//       // REMOVE LOADING
//       print('sankar');
//       TFullScreenLoader.stopLoading();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/data/repositories/user/user_repository.dart';
import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/features/authentication/models/user_model.dart';
import 'package:student/features/authentication/screens/signup/verify_email.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/popups/full_screen_loader.dart';
import 'package:student/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // VARIABLES
  final hiddenPassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  // SIGNUP
  Future<void> signUp() async {
    try {
      // START LOADING
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information',
        TImages.docerAnimation,
      );

      final authRepository = Get.put(AuthenticationRepository());

      // CHECK INTERNET CONNECTIVITY
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   return;
      // }

      // FORM VALIDATION
      if (!signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading(); // Pass the BuildContext
        return;
      }

      // PRIVACY POLICY CHECK
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading(); // Pass the BuildContext
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must read and accept the Privacy Policy & Terms of Use.',
        );
        return;
      }

      // REGISTER USER IN THE FIREBASE AUTHENTICATION & SAVE USER DATA IN FIREBASE
      final userCredential = await authRepository.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // SAVE AUTHENTICATED USER DATA IN FIREBASE FIRESTORE
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // SHOW SUCCESS MESSAGE AND NAVIGATE
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continue.',
      );
      TFullScreenLoader.stopLoading(); // Pass the BuildContext
      Get.to(() => VerifyEmail(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading(); // Pass the BuildContext
      TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
    }
  }
}
