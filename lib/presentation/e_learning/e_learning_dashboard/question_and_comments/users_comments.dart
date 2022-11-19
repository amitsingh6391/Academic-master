import 'package:academic_master/application/e_learning/add_user_comment/add_user_comment_bloc.dart';
import 'package:academic_master/application/e_learning/comments_watcher/comments_watcher_bloc.dart';
import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/custum_textfield.dart';
import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/core/user_dp.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:selectable_autolink_text/selectable_autolink_text.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersComments extends StatefulWidget {
  final String questionId;
  final String questionUserId;
  const UsersComments({
    Key? key,
    required this.questionId,
    required this.questionUserId,
  }) : super(key: key);

  @override
  State<UsersComments> createState() => _UsersCommentsState();
}

class _UsersCommentsState extends State<UsersComments> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<AddUserCommentBloc, AddUserCommentState>(
      builder: (BuildContext context, pAddUserCommentState) {
        return SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: SizedBox(
            height: 0.7.sh,
            child: Stack(
              alignment: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                  ? Alignment.topCenter
                  : Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 0.68.sh,
                  child: BlocProvider(
                    create: (context) => getIt<UsersWatcherBloc>()
                      ..add(
                        const UsersWatcherEvent.watchCurrentUser(),
                      ),
                    child: BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
                      builder: (context, currentUserState) {
                        return currentUserState.map(
                          initial: (_) => CircleLoading(),
                          loadInProgress: (_) => CircleLoading(),
                          loadSuccess: (currentLoginUser) => BlocProvider(
                            create: (context) => getIt<CommentsWatcherBloc>()
                              ..add(
                                CommentsWatcherEvent.watchComments(
                                  widget.questionId,
                                ),
                              ),
                            child: BlocBuilder<CommentsWatcherBloc,
                                CommentsWatcherState>(
                              builder:
                                  (BuildContext context, commentWatcherstate) {
                                return commentWatcherstate.map(
                                  initial: (_) {
                                    return CircleLoading();
                                  },
                                  loadInProgress: (_) => CircleLoading(),
                                  loadSuccess: (value) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 80.0),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        reverse: true,
                                        itemCount: value.comments.size,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.fromLTRB(
                                              leftPadding.w - 8.w,
                                              0,
                                              rightpadding.w - 8.w,
                                              bottomPadding,
                                            ),
                                            child: Row(
                                              children: [
                                                if (currentLoginUser
                                                        .users.first.id
                                                        .getorCrash() !=
                                                    value.comments[index].userId
                                                        .getorCrash())
                                                  BlocProvider(
                                                    create: (context) => getIt<
                                                        UsersWatcherBloc>()
                                                      ..add(
                                                        UsersWatcherEvent
                                                            .watchCurrentUser(
                                                          uId: value
                                                              .comments[index]
                                                              .userId
                                                              .getorCrash(),
                                                        ),
                                                      ),
                                                    child: const Userdp(),
                                                  )
                                                else
                                                  const SizedBox(),
                                                SizedBox(
                                                  width: size.width > 400
                                                      ? size.width * 0.7
                                                      : size.width * 0.7,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: (currentLoginUser
                                                                  .users
                                                                  .first
                                                                  .id
                                                                  .getorCrash() !=
                                                              value
                                                                  .comments[
                                                                      index]
                                                                  .userId
                                                                  .getorCrash())
                                                          ? Apptheme
                                                              .lightCardColor
                                                          : Apptheme
                                                              .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        15.0,
                                                      ),
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
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child:
                                                                SelectableAutoLinkText(
                                                              value
                                                                  .comments[
                                                                      index]
                                                                  .commentDescription
                                                                  .getorCrash(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: Apptheme(
                                                                context,
                                                              )
                                                                  .normalText
                                                                  .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    color: Apptheme
                                                                        .assentColor,
                                                                  ),
                                                              linkStyle:
                                                                  Apptheme(
                                                                context,
                                                              )
                                                                      .boldText
                                                                      .copyWith(
                                                                        color: Apptheme
                                                                            .secondaryColor,
                                                                      ),
                                                              onTransformDisplayLink:
                                                                  AutoLinkUtils
                                                                      .shrinkUrl,
                                                              onTap:
                                                                  (url) async {
                                                                if (await canLaunchUrl(
                                                                  Uri.parse(
                                                                    url,
                                                                  ),
                                                                )) {
                                                                  launchUrl(
                                                                    Uri.parse(
                                                                      url,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Text(
                                                              value
                                                                  .comments[
                                                                      index]
                                                                  .commentAt
                                                                  .getorCrash()
                                                                  .substring(
                                                                    0,
                                                                    11,
                                                                  ),
                                                              style: Apptheme(
                                                                context,
                                                              )
                                                                  .normalText
                                                                  .copyWith(
                                                                    fontSize:
                                                                        11,
                                                                    color: (currentLoginUser.users.first.id.getorCrash() !=
                                                                            value.comments[index].userId
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
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                if (currentLoginUser
                                                        .users.first.id
                                                        .getorCrash() ==
                                                    value.comments[index].userId
                                                        .getorCrash())
                                                  BlocProvider(
                                                    create: (context) => getIt<
                                                        UsersWatcherBloc>()
                                                      ..add(
                                                        UsersWatcherEvent
                                                            .watchCurrentUser(
                                                          uId: value
                                                              .comments[index]
                                                              .userId
                                                              .getorCrash(),
                                                        ),
                                                      ),
                                                    child: const Userdp(),
                                                  )
                                                else
                                                  const SizedBox(),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  loadFailure: (loadFailure) =>
                                      const ErrorCard(),
                                  empty: (empty) => const Center(
                                    child: EmptyScreen(
                                      message:
                                          "This Question does not have any answer",
                                      showLottie: true,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          loadFailure: (_) => const ErrorCard(),
                          empty: (_) => const EmptyScreen(
                            message: "This Question does not have any answer",
                            showLottie: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: bottomPadding,
                    left: leftPadding,
                    right: rightpadding,
                    top: topPadding1 * 4,
                  ),
                  child: InputField(
                    backgroundColor: Apptheme.backgroundColor,
                    controller: commentController,
                    hintText: "Type Something..",
                    onChanged: (value) {
                      context.read<AddUserCommentBloc>().add(
                            AddUserCommentEvent.commentDescriptionChanged(
                              value!,
                            ),
                          );
                    },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        right: 18,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          context.read<AddUserCommentBloc>().add(
                                AddUserCommentEvent.addCommentPressed(
                                  pAddUserCommentState.comment,
                                  widget.questionId,
                                ),
                              );
                          commentController.clear();
                        },
                        child: CircleAvatar(
                          backgroundColor: Apptheme.primaryColor,
                          radius: 16.r,
                          child: Icon(
                            Icons.arrow_upward,
                            size: 17.h,
                            color: Apptheme.backgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
