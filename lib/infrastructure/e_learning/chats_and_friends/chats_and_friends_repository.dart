import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/chatroom.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:academic_master/infrastructure/core/firestore_helpers.dart';
import 'package:academic_master/infrastructure/core/user_dtos.dart';
import 'package:academic_master/infrastructure/e_learning/chats_and_friends/message_dtos.dart';
import 'package:academic_master/infrastructure/e_learning/chats_and_friends/userchatroom_dtos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IChatsAndFriendsRepository)
class ChatsAndFriendsRepository implements IChatsAndFriendsRepository {
  final FirebaseFirestore _firestore;
  final fbauth.FirebaseAuth _firebaseAuth;

  ChatsAndFriendsRepository(this._firestore, this._firebaseAuth);

  // here we are override our method to fetch all the users who are in same class
  @override
  Stream<Either<FirebaseFailure, List<User>>> watchAllUsersInOurClass(
    String course,
    String? branch,
    String year,
  ) async* {
    final userDoc = await _firestore.usersCollection();

    yield* userDoc
        .where("course", isEqualTo: course)
        .where("branch", isEqualTo: branch)
        .where("year", isEqualTo: year)
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, List<User>>(
            snapshot.docs
                .map((doc) => UserDto.fromFirestore(doc).toDomain())
                .toList(),
          ),
        );

    throw UnimplementedError();
  }

  @override
  Future<Either<FirebaseFailure, Unit>> createGroupMessage(
    Message message,
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

      final groupChatCollection = await _firestore.groupChatCollection(
        user!,
      );

      debugPrint("i m at groupChatcollection $groupChatCollection");

      final messageDto = MessageDto.fromDomain(message).copyWith(
        userId: _firebaseAuth.currentUser!.uid,
        messageAt: DateTime.now(),
      );

      await groupChatCollection
          .doc(messageDto.messageId)
          .set(messageDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

  //**implements methods for getting all messages in groups;

  @override
  Stream<Either<FirebaseFailure, KtList<Message>>>
      watchGroupChatMessages() async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final groupChatCollection = await _firestore.groupChatCollection(
      user!,
    );

    yield* groupChatCollection
        .orderBy(
          "messageAt",
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<Message>>(
            snapshot.docs
                .map((doc) => MessageDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint("i m error  message sections .......................   $e");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

//** WE WILL IMPLEMENTS OUR GROUP CHAT MESSAGE DELETION METHOD ; */
  @override
  Future<Either<FirebaseFailure, Unit>> deleteGroupChatMessage(
    Message message,
  ) async {
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser = _firebaseAuth.currentUser!.uid;
      User? user;
      await userDoc.doc(currentUser).get().then((value) {
        user =
            UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
      });
      final groupChatCollection = await _firestore.groupChatCollection(
        user!,
      );

      final messageId = message.messageId.getorCrash();

      await groupChatCollection.doc(messageId).delete();

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

//*implements methods for creating one to one personal messages;
  @override
  Future<Either<FirebaseFailure, Unit>> createPersonalMessage(
    Message message,
    String partnerId,
    Chatroom userchatroom,
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

      final personalChatCollection = await _firestore.personalChatCollection(
        user!,
        partnerId,
      );

      debugPrint(
        "i m at personalChatCollection $personalChatCollection\nthis is usersId: ${_firebaseAuth.currentUser!.uid} and partnerid: $partnerId",
      );

      final messageDto = MessageDto.fromDomain(message).copyWith(
        userId: _firebaseAuth.currentUser!.uid,
        messageAt: DateTime.now(),
      );

      await personalChatCollection
          .doc(messageDto.messageId)
          .set(messageDto.toJson());

      //**WHEN WE WILL CREATE ANY PERSONAL MESSAGE THEN WE HAVE TO ALLSO CREATE OUR CHAT ROOM ID SO THAT
      //NEXT TIME WHEN WE WANT TO CHAT THEN WE WILL REDIRECT TO CORRECT CHATROOM ID ; */

      final chatroomCollection = await _firestore.chatRoomCollection(
        user!,
      );

      final chatroomDto = ChatroomDto.fromDomain(userchatroom).copyWith(
        partnerId: partnerId,
        chatroomAt: DateTime.now(),
        chatroomId: user!.id.getorCrash() + partnerId,
        usersId: [
          user!.id.getorCrash(),
          partnerId,
        ],
      );
      await chatroomCollection
          .doc(user!.id.getorCrash() + partnerId)
          .set(chatroomDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    }
  }

//*implemnts method to watch all our personal messages;
  @override
  Stream<Either<FirebaseFailure, KtList<Message>>> watchPersonalChatMessages(
    String partnerId,
  ) async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final personalChatCollection = await _firestore.personalChatCollection(
      user!,
      partnerId,
    );

    yield* personalChatCollection
        .orderBy(
          "messageAt",
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<Message>>(
            snapshot.docs
                .map((doc) => MessageDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint("i m error  message sections .......................   $e");
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<FirebaseFailure, KtList<Chatroom>>> watchAllChatrooms() async* {
    final userDoc = await _firestore.usersCollection();
    final currentUser = _firebaseAuth.currentUser!.uid;
    User? user;
    await userDoc.doc(currentUser).get().then((value) {
      user = UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
    });

    final chatRoomCollection = await _firestore.chatRoomCollection(
      user!,
    );

    debugPrint("this is current userid : ${user!.id.getorCrash()}");

    yield* chatRoomCollection
        .orderBy(
          "chatroomAt",
          descending: true,
        )
        .where(
          "usersId",
          arrayContains: currentUser,
        )
        .snapshots()
        .map(
          (snapshot) => right<FirebaseFailure, KtList<Chatroom>>(
            snapshot.docs
                .map((doc) => ChatroomDto.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .handleError((e) {
      debugPrint(
        "i m error  person chat sections .......................   $e",
      );
      if (e is FirebaseException && e.message!.contains('PERMISSION_DENIED')) {
        return left(const FirebaseFailure.insufficientPermission());
      } else {
        return left(const FirebaseFailure.unexpected());
      }
    });
  }

//** WE WILL IMPLEMENTS OUR PERSONAL CHAT MESSAGE DELETION METHOD ; */
  @override
  Future<Either<FirebaseFailure, Unit>> deletePersonalChatMessage(
    Message message,
    String partnerId,
  ) async {
    try {
      final userDoc = await _firestore.usersCollection();
      final currentUser = _firebaseAuth.currentUser!.uid;
      User? user;
      await userDoc.doc(currentUser).get().then((value) {
        user =
            UserDto.fromJson(value.data()! as Map<String, dynamic>).toDomain();
      });
      final messageCollection = await _firestore.personalChatCollection(
        user!,
        partnerId,
      );

      final messageId = message.messageId.getorCrash();

      await messageCollection.doc(messageId).delete();

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
}
