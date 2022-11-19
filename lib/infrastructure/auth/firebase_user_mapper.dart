import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/auth/value_objects.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User.empty().copyWith(
      id: UniqueId.fromUniqueString(uid),
      name: Name(""),
      email: EmailAddress(""),
      contactNumber: PhoneNumber(""),
      college: College(""),
      course: Course(""),
      branch: Branch(""),
      year: Year(""),
    );
  }
}
