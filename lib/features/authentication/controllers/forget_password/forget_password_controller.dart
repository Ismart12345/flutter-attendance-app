import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/popups/full_screen_loader.dart';
import 'package:student/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // VARIABLES
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // SEND RESET PASSWORD EMAIL
  sendPasswordResetEmail() async {
    try {
      // START LOADING
      TFullScreenLoader.openLoadingDialog(
          'Processing You Request', TImages.docerAnimation);

      // FORM VALIDATION
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // SEND EMAIL TO RESET PASSWORD
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      // REMOVE LOADER

      // SHOW SUCCESS SCREEN
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link Sent to Reset Your Password');
      TFullScreenLoader.stopLoading();
      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
    }
  }

  resetPassowordAndResetEmail(String email) async {
    try {
      try {
        // START LOADING
        TFullScreenLoader.openLoadingDialog(
            'Processing You Request', TImages.docerAnimation);

        // SEND EMAIL TO RESET PASSWORD
        await AuthenticationRepository.instance.sendPasswordResetEmail(email);
        // REMOVE LOADER

        // SHOW SUCCESS SCREEN
        TLoaders.successSnackBar(
            title: 'Email Sent',
            message: 'Email Link Sent to Reset Your Password');
        TFullScreenLoader.stopLoading();
      } catch (e) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
      }
    } catch (e) {}
  }
}
