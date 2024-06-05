import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:student/features/authentication/models/user_model.dart';
import 'package:student/features/authentication/screens/signup/verify_email.dart';
import 'package:student/navigation_menu.dart';
import 'package:student/utils/popups/full_screen_loader.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'something went wrong. please try again';
    }
  }
}
