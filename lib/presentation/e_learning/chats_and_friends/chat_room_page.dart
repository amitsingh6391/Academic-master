import 'package:academic_master/application/e_learning/chats_and_friends/all_chatroom_watcher/all_chatroom_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/watch_all_users_in_our_class/watch_all_users_in_our_class_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/core/user_dp.dart';
import 'package:academic_master/presentation/e_learning/chats_and_friends/widgets/message_card.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/asset_path.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({super.key});

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final userWatcherBloc = getIt<UsersWatcherBloc>();

  final watchAllUsersInOurClass = getIt<WatchAllUsersInOurClassBloc>();

  final watchAllChatrooms = getIt<AllChatroomWatcherBloc>();

  @override
  void initState() {
    userWatcherBloc.add(
      const UsersWatcherEvent.watchCurrentUser(),
    );
    watchAllChatrooms.add(const AllChatroomWatcherEvent.watchAllChatrooms());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    watchAllChatrooms.add(const AllChatroomWatcherEvent.watchAllChatrooms());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    watchAllChatrooms.add(const AllChatroomWatcherEvent.watchAllChatrooms());
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightpadding,
        top: topPadding1,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Friends",
                style: Apptheme(context).lightboldText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: 22,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BlocConsumer<UsersWatcherBloc, UsersWatcherState>(
                listener: (context, state) {
                  state.mapOrNull(
                    loadSuccess: (value) {
                      watchAllUsersInOurClass.add(
                        WatchAllUsersInOurClassEvent
                            .watchAllUsersInOurClassEvent(
                          value.users.first.course.getorCrash(),
                          value.users.first.branch.getorCrash(),
                          value.users.first.year.getorCrash(),
                        ),
                      );
                    },
                  );
                },
                bloc: userWatcherBloc,
                builder: (context, state) {
                  return state.map(
                    empty: (value) => const ErrorCard(),
                    loadFailure: (value) => const ErrorCard(),
                    loadInProgress: (value) => CircleLoading(),
                    loadSuccess: (value) {
                      return BlocBuilder<WatchAllUsersInOurClassBloc,
                          WatchAllUsersInOurClassState>(
                        bloc: watchAllUsersInOurClass,
                        builder: (context, state) {
                          return state.map(
                            empty: (value) => const Text("Empty"),
                            loadFailure: (value) => const ErrorCard(),
                            initial: (value) => CircleLoading(),
                            loadInProgress: (value) => CircleLoading(),
                            loadSuccess: (ourClassUsers) {
                              return Row(
                                children: [
                                  for (int i = 0;
                                      i < ourClassUsers.users.length;
                                      i++)
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: rightpadding - 10,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          AutoRouter.of(context).push(
                                            PersonalChatScreen(
                                              partnerId: ourClassUsers
                                                  .users[i].id
                                                  .getorCrash(),
                                            ),
                                          );
                                        },
                                        child: Userdp(
                                          userName: ourClassUsers.users[i].name
                                              .getorCrash(),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
                    initial: (value) => CircleLoading(),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.1 / 4),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Conversations",
                style: Apptheme(context).lightboldText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: 22,
                    ),
              ),
            ),
            SizedBox(height: size.height * 0.1 / 4),
            BlocBuilder<AllChatroomWatcherBloc, AllChatroomWatcherState>(
              bloc: watchAllChatrooms,
              builder: (context, state) {
                return state.map(
                  empty: (value) => const EmptyScreen(
                    message:
                        "You don't have any personal chats,send one to one msg and clear your doubts!",
                    showLottie: true,
                  ),
                  loadFailure: (value) => const ErrorCard(),
                  initial: (value) => Center(child: CircleLoading()),
                  loadInProgress: (value) => Center(child: FindLoading()),
                  loadSuccess: (chatrooms) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: chatrooms.chatrooms.size,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(
                              PersonalChatScreen(
                                partnerId: chatrooms.chatrooms[index].partnerId
                                    .getorCrash(),
                              ),
                            );
                          },
                          child: MessageCard(
                            currentMsg: size.width > 330
                                ? chatrooms.chatrooms[index].chatroomDescription
                                    .getorCrash()
                                : chatrooms.chatrooms[index].chatroomDescription
                                    .getorCrash(),
                            friendDp: ceoDp,
                            friendId: chatrooms.chatrooms[index].partnerId
                                .getorCrash(),
                            time: chatrooms.chatrooms[index].chatroomAt
                                .getorCrash()
                                .substring(0, 16),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
