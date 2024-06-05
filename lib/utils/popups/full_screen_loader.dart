// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../common/widgets/loaders/animation_loader.dart';
// import '../../common/widgets/loaders/circular_loader.dart';
// import '../constants/colors.dart';
// import '../helpers/helper_functions.dart';

// /// A utility class for managing a full-screen loading dialog.
// class TFullScreenLoader {
//   /// Open a full-screen loading dialog with a given text and animation.
//   /// This method doesn't return anything.
//   ///
//   /// Parameters:
//   ///   - text: The text to be displayed in the loading dialog.
//   ///   - animation: The Lottie animation to be shown.
//   static void openLoadingDialog(String text, String animation) {
//     showDialog(
//       context:
//           Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
//       barrierDismissible:
//           false, // The dialog can't be dismissed by tapping outside it
//       builder: (_) => PopScope(
//         canPop: false, // Disable popping with the back button
//         child: Container(
//           color: THelperFunctions.isDarkMode(Get.context!)
//               ? TColors.dark
//               : TColors.white,
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             children: [
//               const SizedBox(height: 250), // Adjust the spacing as needed
//               TAnimationLoaderWidget(text: text, animation: animation),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   static void popUpCircular() {
//     Get.defaultDialog(
//       title: '',
//       onWillPop: () async => false,
//       content: const TCircularLoader(),
//       backgroundColor: Colors.transparent,
//     );
//   }

//   /// Stop the currently open loading dialog.
//   /// This method doesn't return anything.
//   static stopLoading() {
//     Navigator.of(Get.overlayContext!)
//         .pop(); // Close the dialog using the Navigator
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../../common/widgets/loaders/circular_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class TFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  /// - text: The text to be displayed in the loading dialog.
  /// - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    // Check if a dialog is already open and dismiss it if necessary
    if (Get.isDialogOpen!) {
      Get.back();
    }

    // Open the new loading dialog
    Get.dialog(
      PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), // Adjust the spacing as needed
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
    );
  }

  static void popUpCircular() {
    Get.defaultDialog(
      title: '',
      onWillPop: () async => false,
      content: const TCircularLoader(),
      backgroundColor: Colors.transparent,
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static void stopLoading() {
    if (Get.isDialogOpen!) {
      Get.back(); // Use Get.back() to dismiss the current dialog
    }
  }
}
