import 'package:student/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:student/features/authentication/screens/login/login.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:student/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // IMAGE
            Image(
              image: AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth() * 0.6,
            ),
            // TEXTS AND SUBTITLE
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: Text(TTexts.done)),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () =>
                      controller.resetPassowordAndResetEmail(email),
                  child: Text(TTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
