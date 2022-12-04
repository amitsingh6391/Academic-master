import 'package:academic_master/application/e_learning/chats_and_friends/personal_chat_message_actor/personal_chat_message_actor_bloc.dart';
import 'package:academic_master/application/e_learning/chats_and_friends/personal_chat_message_watcher/personal_chat_message_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/core/user_dp.dart';
import 'package:academic_master/presentation/e_learning/chats_and_friends/widgets/personal_type_box.dart';
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/widgets/delete_confirmatation_pop_up.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalChatBody extends StatefulWidget {
  const PersonalChatBody({
    super.key,
    required this.size,
    required this.partnerId,
  });

  final Size size;
  final String partnerId;

  @override
  State<PersonalChatBody> createState() => _PersonalChatBodyState();
}

class _PersonalChatBodyState extends State<PersonalChatBody> {
  final personalChatMessageWatcherBloc =
      getIt<PersonalChatMessageWatcherBloc>();

  final userWatcherBloc = getIt<UsersWatcherBloc>();

  @override
  void initState() {
    personalChatMessageWatcherBloc.add(
      PersonalChatMessageWatcherEvent.watchPersonalChatMessages(
        widget.partnerId,
      ),
    );

    userWatcherBloc.add(
      const UsersWatcherEvent.watchCurrentUser(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: toppadding,
      ),
      child: Stack(
        children: [
          BlocBuilder<PersonalChatMessageWatcherBloc,
              PersonalChatMessageWatcherState>(
            bloc: personalChatMessageWatcherBloc,
            builder: (context, state) {
              return state.map(
                empty: (_) => const Center(
                  child: EmptyScreen(
                    message: "You dont't have any message",
                    showLottie: true,
                  ),
                ),
                initial: (value) => CircleLoading(),
                loadFailure: (value) => const ErrorCard(),
                loadInProgress: (value) => Center(child: CircleLoading()),
                loadSuccess: (value) => SizedBox(
                  height: 1.sh / 1.4,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: value.message.size,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
                        bloc: userWatcherBloc,
                        builder: (context, currentLoginUserState) {
                          return currentLoginUserState.map(
                            empty: (_) => const EmptyScreen(
                              message: "You dont't have any message",
                              showLottie: true,
                            ),
                            initial: (value) => CircleLoading(),
                            loadFailure: (value) => const ErrorCard(),
                            loadInProgress: (value) => CircleLoading(),
                            loadSuccess: (currentLoginUser) => Padding(
                              padding: EdgeInsets.fromLTRB(
                                leftPadding.w - 8.w,
                                0,
                                rightpadding.w - 8.w,
                                bottomPadding,
                              ),
                              child: Row(
                                children: [
                                  if (currentLoginUser
                                          .copyWith()
                                          .users
                                          .first
                                          .id
                                          .getorCrash() !=
                                      value.message[index].userId.getorCrash())
                                    BlocProvider(
                                      create: (context) => getIt<
                                          UsersWatcherBloc>()
                                        ..add(
                                          UsersWatcherEvent.watchCurrentUser(
                                            uId: value.message[index].userId
                                                .getorCrash(),
                                          ),
                                        ),
                                      child: const Userdp(),
                                    )
                                  else
                                    const SizedBox(),
                                  SizedBox(
                                    width: widget.size.width > 400
                                        ? widget.size.width * 0.7
                                        : widget.size.width * 0.7,
                                    child: SwipeActionCell(
                                      key: UniqueKey(),
                                      leadingActions: [
                                        SwipeAction(
                                          widthSpace: 120,
                                          color: Colors.transparent,
                                          content: Container(
                                            height: 48.h,
                                            width: 118.w,
                                            decoration: BoxDecoration(
                                              color: Apptheme.secondaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Image(
                                                  color: Apptheme.primaryColor,
                                                  image: AssetImage(
                                                    "assets/images/cancel.png",
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                const Text(
                                                  "DELETE",
                                                )
                                              ],
                                            ),
                                          ),
                                          onTap: (handler) {
                                            (currentLoginUser.users.first.id
                                                        .getorCrash() !=
                                                    value.message[index].userId
                                                        .getorCrash())
                                                ? showGeneralDialog(
                                                    barrierLabel: "Barrier",
                                                    barrierDismissible: true,
                                                    barrierColor: Colors.black
                                                        .withOpacity(0.5),
                                                    transitionDuration:
                                                        const Duration(
                                                      milliseconds: 800,
                                                    ),
                                                    context: context,
                                                    pageBuilder: (_, __, ___) {
                                                      return PostDeleteConfirmatationPopup(
                                                        message:
                                                            "You don't have permission to delete this message.",
                                                      );
                                                    },
                                                    transitionBuilder:
                                                        (_, anim, __, child) {
                                                      return SlideTransition(
                                                        position: Tween(
                                                          begin: const Offset(
                                                            1,
                                                            3,
                                                          ),
                                                          end: Offset.zero,
                                                        ).animate(anim),
                                                        child: child,
                                                      );
                                                    },
                                                  )
                                                : context
                                                    .read<
                                                        PersonalChatMessageActorBloc>()
                                                    .add(
                                                      PersonalChatMessageActorEvent
                                                          .deleted(
                                                        value.message[index],
                                                        widget.partnerId,
                                                      ),
                                                    );
                                          },
                                        ),
                                      ],
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: (currentLoginUser
                                                      .users.first.id
                                                      .getorCrash() !=
                                                  value.message[index].userId
                                                      .getorCrash())
                                              ? Apptheme.lightCardColor
                                              : Apptheme.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: leftPadding,
                                            right: rightpadding,
                                            top: toppadding,
                                            bottom: bottomPadding,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              BlocProvider(
                                                create: (context) =>
                                                    getIt<UsersWatcherBloc>()
                                                      ..add(
                                                        UsersWatcherEvent
                                                            .watchCurrentUser(
                                                          uId: value
                                                              .message[index]
                                                              .userId
                                                              .getorCrash(),
                                                        ),
                                                      ),
                                                child: BlocBuilder<
                                                    UsersWatcherBloc,
                                                    UsersWatcherState>(
                                                  builder: (
                                                    context,
                                                    messageByState,
                                                  ) {
                                                    return messageByState.map(
                                                      initial: (_) =>
                                                          const SizedBox(),
                                                      loadInProgress: (_) =>
                                                          const SizedBox(),
                                                      loadFailure: (_) =>
                                                          const SizedBox(),
                                                      empty: (_) =>
                                                          const SizedBox(),
                                                      loadSuccess:
                                                          (messageBy) =>
                                                              Container(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          messageBy
                                                              .users.first.name
                                                              .getorCrash(),
                                                          style: Apptheme(
                                                            context,
                                                          ).boldText.copyWith(
                                                                fontSize: 13,
                                                                color: (currentLoginUser
                                                                            .users
                                                                            .first
                                                                            .id
                                                                            .getorCrash() !=
                                                                        value
                                                                            .message[
                                                                                index]
                                                                            .userId
                                                                            .getorCrash())
                                                                    ? Apptheme
                                                                        .primaryColor
                                                                    : Apptheme
                                                                        .backgroundColor,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: SelectableAutoLinkText(
                                                  value.message[index]
                                                      .messageDescription
                                                      .getorCrash(),
                                                  textAlign: TextAlign.start,
                                                  style: Apptheme(context)
                                                      .normalText
                                                      .copyWith(
                                                        fontSize: 14,
                                                        color: Apptheme
                                                            .assentColor,
                                                      ),
                                                  linkStyle: Apptheme(context)
                                                      .boldText
                                                      .copyWith(
                                                        color: Apptheme
                                                            .secondaryColor,
                                                      ),
                                                  onTransformDisplayLink:
                                                      AutoLinkUtils.shrinkUrl,
                                                  onTap: (url) async {
                                                    if (await canLaunchUrl(
                                                      Uri.parse(url),
                                                    )) {
                                                      launchUrl(
                                                        Uri.parse(url),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Container(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Text(
                                                  value.message[index].messageAt
                                                      .getorCrash()
                                                      .substring(0, 11),
                                                  style: Apptheme(context)
                                                      .normalText
                                                      .copyWith(
                                                        fontSize: 11,
                                                        color: (currentLoginUser
                                                                    .users
                                                                    .first
                                                                    .id
                                                                    .getorCrash() !=
                                                                value
                                                                    .message[
                                                                        index]
                                                                    .userId
                                                                    .getorCrash())
                                                            ? Apptheme
                                                                .primaryColor
                                                            : Apptheme
                                                                .backgroundColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  if (currentLoginUser.users.first.id
                                          .getorCrash() ==
                                      value.message[index].userId.getorCrash())
                                    BlocProvider(
                                      create: (context) => getIt<
                                          UsersWatcherBloc>()
                                        ..add(
                                          UsersWatcherEvent.watchCurrentUser(
                                            uId: value.message[index].userId
                                                .getorCrash(),
                                          ),
                                        ),
                                      child: const Userdp(),
                                    )
                                  else
                                    const SizedBox(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: PersonalTypeBoxField(
              partnerId: widget.partnerId,
            ),
          ),
        ],
      ),
    );
  }
}
