import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:student/common/widgets/success_screen.dart';
import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:student/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  // Send Email Whenever Verify Screen Appears & Set Timer For AUto redirect.

  @override
  void onInit() {
    // TODO: implement onInit
    sendEmailVerification();
    setTimerForAutoRedirected();
    super.onInit();
  }

  // SEND EMAIL VERIFICATION LINK
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please check you inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'ERROR', message: e.toString());
    }
  }

  // TIMER TO AUTOMATICATING REDIRECT ON EMAIL CERIFICATION
  setTimerForAutoRedirected() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance
                .screenRedirect(FirebaseAuth.instance.currentUser)));
      }
    });
  }

  // MANUALLY CHECK IF EMAIL VERIFIED
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: TImages.successfullyRegisterAnimation,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance
              .screenRedirect(FirebaseAuth.instance.currentUser)));
    }
  }
}
