import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/error.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/e_learning/chats_and_friends/widgets/students_group_chat_body.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

@RoutePage()
class StudentsGroupChatScreen extends StatefulWidget {
  const StudentsGroupChatScreen({super.key});

  @override
  State<StudentsGroupChatScreen> createState() =>
      _StudentsGroupChatScreenState();
}

class _StudentsGroupChatScreenState extends State<StudentsGroupChatScreen> {
  final userWatcherBloc = getIt<UsersWatcherBloc>();

  @override
  void initState() {
    userWatcherBloc.add(
      const UsersWatcherEvent.watchCurrentUser(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
      bloc: userWatcherBloc,
      builder: (context, state) {
        return state.map(
          initial: (_) => CircleLoading(),
          loadInProgress: (_) => CircleLoading(),
          loadSuccess: (currentUserDetails) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Apptheme.primaryColor,
                ),
              ),
              title: Center(
                child: Text(
                  "${currentUserDetails.users.first.course.getorCrash().toUpperCase()} (Group Chat)",
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: 20,
                      ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    LineIcons.infoCircle,
                    color: Apptheme.primaryColor,
                  ),
                ),
                SizedBox(width: 20.w),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  size.width > 330
                      ? size.height * 0.1 / 4
                      : size.height * 0.1 / 2,
                ),
                child: Column(
                  children: [
                    Text(
                      "(  ${currentUserDetails.users.first.year.getorCrash().toUpperCase()}  )",
                      style: Apptheme(context).lightboldText.copyWith(
                            color: Apptheme.primaryColor,
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            body: StudentGroupChatsBody(size: size),
          ),
          loadFailure: (_) => const ErrorCard(),
          empty: (empty) => const EmptyScreen(
            message: "You don't have access to chat in groups",
            showLottie: false,
          ),
        );
      },
    );
  }
}
