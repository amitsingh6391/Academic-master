import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/chatroom.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

// we will define this abstract class in domain level  here we will do all the things which are
// related to students chats .
abstract class IChatsAndFriendsRepository {
  /// In this method we will watch the students who are in same branch and year
  ///
  /// We need 3 things  course year and branch where branch is optional field bcs bpharma and
  ///
  /// does not have any branch

  Stream<Either<FirebaseFailure, List<User>>> watchAllUsersInOurClass(
    String course,
    String? branch,
    String year,
  );

//create group message to disscuss their doubts in same class ;
  Future<Either<FirebaseFailure, Unit>> createGroupMessage(Message message);

  Stream<Either<FirebaseFailure, KtList<Message>>> watchGroupChatMessages();

  //** THIS METHOD WILL HELP US TO DELETE OUR GROUP CHAT MESSAGE WHEN WE COMMUNICATE WITH OUR FRIEDNS;  */
  Future<Either<FirebaseFailure, Unit>> deleteGroupChatMessage(Message message);

  //** CREATE PERSONAL CHAT MESSAGES ; */
  Future<Either<FirebaseFailure, Unit>> createPersonalMessage(
    Message message,
    String partnerId,
    Chatroom chatroom,
  );

//** WATCH PERSONAL CHAT MESSAGES : */
  Stream<Either<FirebaseFailure, KtList<Message>>> watchPersonalChatMessages(
    String partnerId,
  );

  //** THIS METHOD WILL HELP US TO DELETE OUR PERSONAL CHAT MESSAGE WHEN WE COMMUNICATE WITH OUR FRIEDNS;  */
  Future<Either<FirebaseFailure, Unit>> deletePersonalChatMessage(
    Message question,
    String partnerId,
  );
//** WATCH ALL CHATROOMS SO THAT WE CAN QUICKLY CHATS WITH OUR FRIENDS;  */
  Stream<Either<FirebaseFailure, KtList<Chatroom>>> watchAllChatrooms();
}
