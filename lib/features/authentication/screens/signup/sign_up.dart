import 'package:student/common/widgets/login_divider.dart';
import 'package:student/common/widgets/social_buttons.dart';
import 'package:student/features/authentication/screens/signup/verify_email.dart';
import 'package:student/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:student/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:student/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // FORM
              SignUpForm(dark: dark),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // DIVIDER
              LoginDivider(
                  dark: dark, dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // SOCIAL BUTTON
              LoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
