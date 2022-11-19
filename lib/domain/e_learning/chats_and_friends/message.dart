import 'package:academic_master/domain/core/failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

@freezed
abstract class Message implements _$Message {
  const Message._();

  // ignore: sort_unnamed_constructors_first
  const factory Message({
    required UniqueId messageId,
    required UniqueId userId,
    required CommentDescription messageDescription,
    required Time messageAt,
  }) = _Message;

  factory Message.empty() => Message(
        messageDescription: CommentDescription(" "),
        messageId: UniqueId(),
        userId: UniqueId(),
        messageAt: Time(""),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return messageDescription.failureOrUnit.fold(
      (f) => some(f),
      (r) => none(),
    );
  }
}
