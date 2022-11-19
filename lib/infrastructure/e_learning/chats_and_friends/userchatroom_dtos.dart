import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/chatroom.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'userchatroom_dtos.freezed.dart';
part 'userchatroom_dtos.g.dart';

@freezed
abstract class ChatroomDto implements _$ChatroomDto {
  const ChatroomDto._();

  // ignore: sort_unnamed_constructors_first
  const factory ChatroomDto({
    required String chatroomId,
    required String partnerId,
    required String chatroomDescription,
    required DateTime chatroomAt,
    required List<String> usersId,
  }) = _ChatroomDto;

  factory ChatroomDto.fromDomain(Chatroom chatroom) {
    return ChatroomDto(
      chatroomId: chatroom.chatroomId.getorCrash(),
      partnerId: chatroom.partnerId.getorCrash(),
      chatroomDescription: chatroom.chatroomDescription.getorCrash(),
      chatroomAt: DateTime.now(),
      usersId: chatroom.usersId,
    );
  }

  Chatroom toDomain() {
    return Chatroom(
      chatroomDescription: CommentDescription(chatroomDescription),
      partnerId: UniqueId.fromUniqueString(partnerId),
      chatroomId: UniqueId.fromUniqueString(chatroomId),
      chatroomAt: Time(chatroomAt.toString()),
      usersId: usersId,
    );
  }

  factory ChatroomDto.fromJson(Map<String, dynamic> json) =>
      _$ChatroomDtoFromJson(json);

  factory ChatroomDto.fromFirestore(DocumentSnapshot doc) {
    return ChatroomDto.fromJson(doc.data()! as Map<String, dynamic>).copyWith(
      chatroomId: doc.id,
    );
  }
}
