import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/core/user_dp.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageCard extends StatelessWidget {
  final String currentMsg;
  final String friendDp;
  final String? time;
  final String friendId;
  const MessageCard({
    Key? key,
    required this.currentMsg,
    required this.friendDp,
    this.time,
    required this.friendId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UsersWatcherBloc>()
        ..add(
          UsersWatcherEvent.watchCurrentUser(uId: friendId),
        ),
      child: BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
        builder: (context, state) {
          return state.map(
            initial: (value) => CircleLoading(),
            empty: (value) => const ErrorCard(),
            loadFailure: (value) => const ErrorCard(),
            loadInProgress: (value) => CircleLoading(),
            loadSuccess: (value) {
              return Container(
                margin: EdgeInsets.only(bottom: bottomPadding - 5),
                decoration: BoxDecoration(
                  color: Apptheme.secondaryColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: toppadding,
                        left: leftPadding - 15,
                        right: 8,
                        bottom: 2 * bottomPadding,
                      ),
                      child: Userdp(
                        userName: value.users.first.name.getorCrash(),
                        circleAvatarColor: Apptheme.backgroundColor,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 8,
                          bottom: bottomPadding,
                          right: rightpadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value.users[0].name.getorCrash(),
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 15,
                                    color: Apptheme.assentColor,
                                  ),
                            ),
                            SizedBox(height: 15.h),
                            Row(
                              children: [
                                Text(
                                  currentMsg.length > 28
                                      // ignore: prefer_interpolation_to_compose_strings
                                      ? currentMsg.substring(0, 27) + "..."
                                      : currentMsg,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  style:
                                      Apptheme(context).lightboldText.copyWith(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                          ),
                                ),
                                const Spacer(),
                                if (time != null)
                                  Text(
                                    "$time",
                                    style: Apptheme(context)
                                        .lightboldText
                                        .copyWith(
                                          fontSize: 12,
                                          color: Apptheme.primaryColor,
                                        ),
                                  )
                                else
                                  const SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
