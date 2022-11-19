import 'package:academic_master/domain/auth/auth_failure.dart';
import 'package:academic_master/domain/auth/i_auth_facade.dart';
import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/auth/value_objects.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/infrastructure/auth/firebase_user_mapper.dart';
import 'package:academic_master/infrastructure/core/firestore_helpers.dart';
import 'package:academic_master/infrastructure/core/user_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn, this._firestore);

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
    required Name name,
    required PhoneNumber phoneNumber,
    required Course course,
    required Branch branch,
    required College college,
    required Year year,
  }) async {
    final emailAddressStr = emailAddress.getorCrash();
    final passwordStr = password.getorCrash();
    final nameStr = name.getorCrash();
    final phoneNumberStr = phoneNumber.getorCrash();
    final branchStr = branch.getorCrash();
    final courseStr = course.getorCrash();
    final collegeStr = college.getorCrash();
    final yearStr = year.getorCrash();

    try {
      final fUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );

      final user = User(
        id: UniqueId.fromUniqueString(fUser.user!.uid),
        email: EmailAddress(emailAddressStr),
        name: Name(nameStr),
        contactNumber: PhoneNumber(phoneNumberStr),
        branch: Branch(branchStr),
        course: Course(courseStr),
        college: College(collegeStr),
        year: Year(yearStr),
      );

      await createUserToFirestore(user);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailAddressStr = emailAddress.getorCrash();
    final passwordStr = password.getorCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddressStr,
        password: passwordStr,
      );
      debugPrint("i m done here");
      return right(unit);
    } on FirebaseAuthException catch (e) {
      debugPrint("i m not done here.......$e");
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail({
    required EmailAddress emailAddress,
  }) async {
    final emailAddressStr = emailAddress.getorCrash();
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: emailAddressStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() => Future.wait(
        [
          _googleSignIn.signOut(),
          _firebaseAuth.signOut(),
        ],
      );

  Future<Either<AuthFailure, Unit>> createUserToFirestore(User user) async {
    try {
      final userCollection = await _firestore.usersCollection();

      final userDto = UserDto.fromDomain(user);

      await userCollection.doc(userDto.id).set(userDto.toJson());

      return right(unit);
    } on FirebaseException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  /// IMPLEMENTS EDIT PROFILE DETAILS METHOD
  ///
  @override
  Future<Either<FirebaseFailure, Unit>> editProfile({
    required EmailAddress emailAddress,
    required Name name,
    required PhoneNumber phoneNumber,
    required Branch branch,
    required Course course,
    required College college,
    required Year year,
  }) async {
    try {
      debugPrint("im gone ....");
      final userCollection = await _firestore.usersCollection();

      // _firebaseAuth.currentUser!.uid;

      debugPrint(
        "this is email ${emailAddress.getorCrash()}nd namestr ${name.getorCrash()}",
      );

      final emailAddressStr = emailAddress.getorCrash();
      final nameStr = name.getorCrash();
      final phoneNumberStr = phoneNumber.getorCrash();
      final branchStr = branch.getorCrash();
      final courseStr = course.getorCrash();
      final collegeStr = college.getorCrash();
      final yearStr = year.getorCrash();

      debugPrint("im......");

      final user = User(
        id: UniqueId.fromUniqueString(_firebaseAuth.currentUser!.uid),
        email: EmailAddress(emailAddressStr),
        name: Name(nameStr),
        contactNumber: PhoneNumber(phoneNumberStr),
        branch: Branch(branchStr),
        course: Course(courseStr),
        college: College(collegeStr),
        year: Year(yearStr),
      );

      final userDto = UserDto.fromDomain(user);

      debugPrint("im gone to edit in infra");

      await userCollection.doc(userDto.id).update(userDto.toJson());
      debugPrint("im gone to edit infra layer done");

      return right(unit);
    } on FirebaseException catch (error) {
      debugPrint("im error in infra...... $error");
      return left(
        const FirebaseFailure.unableToUpdate(),
      );
    }
  }
}
