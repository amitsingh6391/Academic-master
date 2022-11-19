import 'dart:io';

import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/domain/auth/user.dart' as loacal;
import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:academic_master/domain/e_learning/subject.dart';
import 'package:academic_master/domain/e_learning/user_comment.dart';
import 'package:academic_master/infrastructure/core/firestore_helpers.dart';
import 'package:academic_master/infrastructure/core/user_dtos.dart';
import 'package:academic_master/infrastructure/e_learning/question_dtos.dart';
import 'package:academic_master/infrastructure/e_learning/subject_dtos.dart';
import 'package:academic_master/infrastructure/e_learning/user_comment_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IElearningRepository)
class ElearningRepository implements IElearningRepository {
  final FirebaseFirestore _firestore;
  final fbauth.FirebaseAuth _firebaseAuth;

  ElearningRepository(this._firestore, this._firebaseAuth);

  @override
  Stream<Either<FirebaseFailure, List<loacal.User>>> watchCurrentUser({
    String? uId,
  }) async* {
    final userDoc = await _firestore.usersCollection();
    debugPrint("this is my userId $uId");
    debugPrint("this is my authuserId ${_firebaseAuth.currentUser!.uid}");

    yield* userDoc
        .where(
          'id',
          isEqualTo: uId != "null" ? uId : _firebaseAuth.currentUser!.uid,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, List<loacal.User>>(
            snapshot.docs
                .map((doc) => UserDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        )
        .handleError((e) {
      debugPrint(".......$e ");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<FirebaseFailure, KtList<Subject>>> watchAllSubjects() async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final subjectCollection = await _firestore.subjectCollection(user!);
    debugPrint(".......subjectcollection {$subjectCollection.toString()}");

    yield* subjectCollection
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<Subject>>(
            snapshot.docs.map((doc) {
              debugPrint("this iiiiiiiiiii doc :${doc.data()}");
              return SubjectDto.fromFirestore(doc).toDomain();
            }).toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint("i m error subject not got .......................   $e");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<FirebaseFailure, KtList<Question>>> watchAllQuestion() async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final questionCollection = await _firestore.questionCollection(user!);

    yield* questionCollection
        .orderBy(
          "askAt",
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<Question>>(
            snapshot.docs
                .map((doc) => QuestionDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint("i m error  question sections .......................   $e");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<FirebaseFailure, KtList<UserComment>>> watchComments(
    String questionId,
  ) async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final commentCollection = await _firestore.commentCollection(
      user!,
      questionId,
    );

    yield* commentCollection
        .orderBy(
          "commentAt",
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<UserComment>>(
            snapshot.docs
                .map((doc) => UserCommentDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint("i m error  question sections .......................   $e");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

//**  Defin method for user comments */
  @override
  Future<Either<FirebaseFailure, Unit>> createComment(
    UserComment comment,
    String questionId,
  ) async {
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser =
          _firebaseAuth.currentUser!.uid; //Get the current login user in app.
      User? user;

      await userDoc.doc(currentUser).get().then(
        (value) {
          user = UserDto.fromJson(value.data()! as Map<String, dynamic>)
              .toDomain();
        },
      );

      final commentCollection = await _firestore.commentCollection(
        // Get the comment collection:
        user!,
        questionId,
      );

      debugPrint("i m at commentcollection $commentCollection");

      final commentDto = UserCommentDto.fromDomain(comment).copyWith(
        userId: _firebaseAuth.currentUser!.uid,
        commentAt: DateTime.now(),
      );
      // debugPrint("now my questiondto are >>>>>>>>>>.$questionDto");

      await commentCollection
          .doc(commentDto.commentId)
          .set(commentDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> createQuestion(
    File? questionImage,
    Question question,
  ) async {
    debugPrint("i m goin gto create");
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser = _firebaseAuth.currentUser!.uid;
      User? user;

      await userDoc.doc(currentUser).get().then((value) {
        user =
            UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
      });

      final questionsCollection = await _firestore.questionCollection(user!);

      debugPrint("i m at questioncollection $questionsCollection");

      if (questionImage != null) {
        final uriOrFailure = await uploadQuestionImage(
          questionImage,
        );
        debugPrint(" i m at  uriorfailure $uriOrFailure");

        final uriPath =
            uriOrFailure.getOrElse(() => throw const Unauthenticated());

        debugPrint("........uripath........$uriPath");

        debugPrint(_firebaseAuth.currentUser!.uid);
        final questionDto = QuestionDto.fromDomain(question).copyWith(
          mediaUrl: uriPath,
          userId: _firebaseAuth.currentUser!.uid,
          askAt: DateTime.now(),
        );
        debugPrint("now my questiondto are >>>>>>>>>>.$questionDto");

        await questionsCollection
            .doc(questionDto.questionId)
            .set(questionDto.toJson());

        return right(unit);
      } else {
        final questionDto = QuestionDto.fromDomain(question).copyWith(
          mediaUrl: "null",
          userId: _firebaseAuth.currentUser!.uid,
          askAt: DateTime.now(),
        );
        debugPrint("now my questiondto are >>>>>>>>>>.$questionDto");

        await questionsCollection
            .doc(questionDto.questionId)
            .set(questionDto.toJson());

        return right(unit);
      }
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> updateQuestion(
    Question question,
  ) async {
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser = _firebaseAuth.currentUser!.uid;
      User? user;
      await userDoc.doc(currentUser).get().then((value) {
        user =
            UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
      });
      final questionsCollection = await _firestore.questionCollection(user!);
      final questionDto = QuestionDto.fromDomain(question);

      await questionsCollection
          .doc(questionDto.questionId)
          .update(questionDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const FirebaseFailure.unableToUpdate());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<FirebaseFailure, Unit>> deleteQuestion(
    Question question,
  ) async {
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser = _firebaseAuth.currentUser!.uid;
      User? user;
      await userDoc.doc(currentUser).get().then((value) {
        user =
            UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
      });
      final questionCollection = await _firestore.questionCollection(user!);
      final questionId = question.questionId.getorCrash();

      await questionCollection.doc(questionId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else if (e.message!.contains('NOT_FOUND')) {
        return left(const FirebaseFailure.unableToUpdate());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

  Future<Either<FirebaseFailure, String>> uploadQuestionImage(
    File questionImage,
  ) async {
    try {
      final storage.UploadTask uploadTask = storage.FirebaseStorage.instance
          .ref('questions')
          .child("questionImage/questionImage_$questionImage.jpg")
          .putFile(questionImage);

      final storage.TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => this);

      debugPrint("this is our snapshot of task $taskSnapshot");
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      debugPrint("this is our url$downloadUrl");
      return right(downloadUrl);
    } on FirebaseException catch (_) {
      debugPrint(">>>>>>>>>>. i m sorry i could not store $_");
      return left(const FirebaseFailure.unexpected());
    }
  }
}
