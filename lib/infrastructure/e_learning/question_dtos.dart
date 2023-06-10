import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_dtos.freezed.dart';
part 'question_dtos.g.dart';

@freezed
abstract class QuestionDto implements _$QuestionDto {
  const factory QuestionDto({
    required String questionId,
    required String userId,
    required String questionDescription,
    required String mediaUrl,
    required DateTime askAt,
  }) = _QuestionDto;
  const QuestionDto._();

  factory QuestionDto.fromDomain(Question question) {
    return QuestionDto(
      questionId: question.questionId.getorCrash(),
      questionDescription: question.questionDescription.getorCrash(),
      userId: question.userId.getorCrash(),
      mediaUrl: question.mediaUrl.getorCrash(),
      askAt: DateTime.now(),
    );
  }

  Question toDomain() {
    return Question(
      questionDescription: QuestionDescription(questionDescription),
      userId: UniqueId.fromUniqueString(userId),
      questionId: UniqueId.fromUniqueString(questionId),
      mediaUrl: MediaUrl(mediaUrl),
      askAt: Time(askAt.toString()),
    );
  }

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  factory QuestionDto.fromFirestore(DocumentSnapshot doc) {
    return QuestionDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(
      questionId: doc.id,
    );
  }
}
