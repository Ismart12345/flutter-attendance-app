import 'package:get/get.dart';
import 'package:student/features/authentication/controllers/login/login_controller.dart';
import 'package:student/utils/constants/colors.dart';
import 'package:student/utils/constants/image_strings.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: TColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () => controller.googleLogin(),
              icon: Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.google)),
            )),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.facebook)),
          ),
        ),
      ],
    );
  }
}
