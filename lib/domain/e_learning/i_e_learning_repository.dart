import 'dart:io';
import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:academic_master/domain/e_learning/subject.dart';
import 'package:academic_master/domain/e_learning/user_comment.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IElearningRepository {
  Stream<Either<FirebaseFailure, KtList<Subject>>> watchAllSubjects();
  Stream<Either<FirebaseFailure, List<User>>> watchCurrentUser({String? uId});
  Stream<Either<FirebaseFailure, KtList<Question>>> watchAllQuestion();
  Stream<Either<FirebaseFailure, KtList<UserComment>>> watchComments(
    String questionId,
  );
  Future<Either<FirebaseFailure, Unit>> createQuestion(
    File? questionImage,
    Question question,
  );
  Future<Either<FirebaseFailure, Unit>> createComment(
    UserComment comment,
    String questionId,
  );
  Future<Either<FirebaseFailure, Unit>> updateQuestion(Question question);
  Future<Either<FirebaseFailure, Unit>> deleteQuestion(Question question);
}
