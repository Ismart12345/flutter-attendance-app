import 'package:iconsax/iconsax.dart';
import 'package:student/features/authentication/controllers/login/login_controller.dart';
import 'package:student/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:student/features/authentication/screens/signup/sign_up.dart';
import 'package:student/navigation_menu.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              // EMAIL
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: TTexts.email),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // PASSWORD
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(Iconsax.eye_slash))),
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),
              // REMEMBER ME AND FORGET PASSWORD
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // REMEMBER ME
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.remeberMe.value,
                          onChanged: (value) => controller.remeberMe.value =
                              !controller.remeberMe.value)),
                      Text(TTexts.rememberMe)
                    ],
                  ),
                  // FORGET PASSWORD
                  TextButton(
                      onPressed: () => Get.to(ForgetPassword()),
                      child: Text(TTexts.forgetPassword))
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // SIGN IN BUTTON
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: Text(TTexts.signIn))),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // SIGN UP BUTTON
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {
                        Get.to(SignUpScreen());
                      },
                      child: Text(TTexts.createAccount))),
            ],
          ),
        ));
  }
}
