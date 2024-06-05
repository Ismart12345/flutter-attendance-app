import 'package:student/common/styles/spacing_styles.dart';
import 'package:student/common/widgets/login_divider.dart';
import 'package:student/common/widgets/social_buttons.dart';
import 'package:student/features/authentication/controllers/login/login_controller.dart';
import 'package:student/features/authentication/screens/login/widgets/login_form.dart';
import 'package:student/features/authentication/screens/login/widgets/login_header.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:student/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // LOGO , TITLE & SUB TITLE
              LoginHeader(dark: dark),

              // FORM
              LoginForm(),
              // DIVIDER
              LoginDivider(
                dark: dark,
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              // FOOTER
              LoginFooter()
            ],
          ),
        ),
      ),
    );
  }
}
