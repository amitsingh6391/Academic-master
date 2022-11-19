import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';

import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dtos.freezed.dart';
part 'message_dtos.g.dart';

@freezed
abstract class MessageDto implements _$MessageDto {
  const factory MessageDto({
    required String messageId,
    required String userId,
    required String messageDescription,
    required DateTime messageAt,
  }) = _MessageDto;
  const MessageDto._();

  factory MessageDto.fromDomain(Message message) {
    return MessageDto(
      messageId: message.messageId.getorCrash(),
      userId: message.userId.getorCrash(),
      messageDescription: message.messageDescription.getorCrash(),
      messageAt: DateTime.now(),
    );
  }

  Message toDomain() {
    return Message(
      messageDescription: CommentDescription(messageDescription),
      userId: UniqueId.fromUniqueString(userId),
      messageId: UniqueId.fromUniqueString(messageId),
      messageAt: Time(messageAt.toString()),
    );
  }

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  factory MessageDto.fromFirestore(DocumentSnapshot doc) {
    return MessageDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(
      messageId: doc.id,
    );
  }
}
