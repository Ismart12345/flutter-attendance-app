import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:student/data/repositories/user/user_repository.dart';
import 'package:student/features/authentication/models/user_model.dart';
import 'package:student/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  // SAVE USER RECORD FROM ANY REGISTRATION PROVIDER
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // CONVERT NAME TO FIRST AND LAST NAME
        final nameParts =
            UserModel.nameParts(userCredential.user?.displayName ?? '');
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            // lastName: nameParts[1],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            email: userCredential.user?.email ?? '',
            phoneNumber: userCredential.user?.phoneNumber ?? '',
            profilePicture: '');

        // SAVE USER DATA
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data Not Saved',
          message:
              'Something went wrong while saving your information. You can res-ave your data in you profile.');
    }
  }
}
