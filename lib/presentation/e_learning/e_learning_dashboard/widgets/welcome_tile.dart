import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';

import 'package:academic_master/presentation/core/empty.dart';
import 'package:academic_master/presentation/core/loading.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );

    return BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.map(
              initial: (_) => FindLoading(),
              loadInProgress: (_) => FindLoading(),
              loadSuccess: (state) {
                final name = state.users[0].name.getorCrash();
                return Column(
                  children: [
                    WelcomeTileMessage(name),
                    FindSubjectLine(),
                  ],
                );
              },
              // ignore: avoid_unnecessary_containers
              loadFailure: (state) => Container(
                child: const Text("something wrong"),
              ),
              empty: (state) {
                return const EmptyScreen(
                  message: '''User not found ''',
                  showLottie: false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class FindSubjectLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: ScreenUtil().setHeight(20),
        top: ScreenUtil().setSp(8),
      ),
      child: Row(
        children: [
          Text(
            "Find a Subject you want to learn  ",
            style: ScreenUtil().scaleWidth > 450
                ? Apptheme(context).thinText.copyWith(
                      fontSize: ScreenUtil().setHeight(25),
                    )
                : Apptheme(context).thinText.copyWith(
                      fontSize: ScreenUtil().setHeight(18),
                    ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class WelcomeTileMessage extends StatelessWidget {
  String name;
  WelcomeTileMessage(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: ScreenUtil().setHeight(20)),
      child: Row(
        children: [
          Text(
            "Hey  $name ",
            style: ScreenUtil().scaleWidth > 450
                ? Apptheme(context)
                    .boldText
                    .copyWith(fontSize: ScreenUtil().setHeight(35))
                : Apptheme(context)
                    .boldText
                    .copyWith(fontSize: ScreenUtil().setHeight(30)),
          )
        ],
      ),
    );
  }
}
