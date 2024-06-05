import 'package:student/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:student/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADINGS
            Text(
              TTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.loginSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),
            // TEXT FIELDS
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                validator: TValidator.validateEmail,
                controller: controller.email,
                decoration: InputDecoration(
                    labelText: TTexts.email, prefixIcon: Icon(Icons.email)),
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            // SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.sendPasswordResetEmail(),
                  child: Text(TTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}
