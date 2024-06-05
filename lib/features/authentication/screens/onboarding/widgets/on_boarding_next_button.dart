import 'package:student/features/authentication/controllers/onboarding_controller.dart';
import 'package:student/utils/constants/colors.dart';
import 'package:student/utils/constants/sizes.dart';
import 'package:student/utils/devices/device_utility.dart';
import 'package:student/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: dark ? TColors.primary : Colors.black),
            onPressed: () => OnBoardingController.instance.nextPage(),
            child: Icon(
              Icons.arrow_right_outlined,
            )));
  }
}
