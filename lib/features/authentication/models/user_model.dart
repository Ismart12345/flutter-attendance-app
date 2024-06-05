import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  static List<String> nameParts(fullName) => fullName.split(" ");
  String get formatedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static UserModel empty() => UserModel(
      email: '',
      firstName: '',
      lastName: '',
      id: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture
    };
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;
  //     return UserModel(
  //         id: document.id,
  //         firstName: data['firstName'] ?? '',
  //         lastName: data['lastName'] ?? '',
  //         email: data['email'] ?? '',
  //         phoneNumber: data['phoneNumber'] ?? '',
  //         profilePicture: data['profilePicture'] ?? '');
  //   } else
  //     return
  // }
}
