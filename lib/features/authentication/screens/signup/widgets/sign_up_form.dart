import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:student/features/authentication/controllers/signup/sign_up_controller.dart';
import 'package:student/features/authentication/screens/signup/verify_email.dart';
import 'package:student/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:student/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  controller: controller.firstName,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
            ],
          ),
          // USER NAME DROPDOWN
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: "Select section",
              prefixIcon: Icon(Icons.edit),
            ),
            items: ['3A', '3B', '3C', '3D', '3E', '3F'].map((String section) {
              return DropdownMenuItem<String>(
                value: section,
                child: Text(section),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle change logic here
            },
            validator: (value) =>
                value == null ? 'Please select a section' : null,
          ),
          // EMAIL
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.email, // Corrected label text
                prefixIcon: Icon(Icons.email)),
          ),
          // PHONE NUMBER
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Icons.phone)),
          ),
          // PASSWORD
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              obscureText: controller.hiddenPassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hiddenPassword.value =
                          !controller.hiddenPassword.value,
                      icon: Icon(Iconsax.eye_slash))),
            ),
          ),
          // TERMS AND CONDTION
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TermsAndCondtion(dark: dark),
          // SIGN UP BUTTON
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
