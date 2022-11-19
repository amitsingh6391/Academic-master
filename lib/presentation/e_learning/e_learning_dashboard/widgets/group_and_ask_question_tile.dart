import 'package:academic_master/application/e_learning/question_watcher/question_watcher_bloc.dart';

import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupAndAskQuestionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return BlocBuilder<QuestionWatcherBloc, QuestionWatcherState>(
      builder: (context, state) {
        return 1.sw < 451
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ImageBoxTile("group.jpg", "Groups")),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(QuestionFormRoute());
                    },
                    child: Expanded(
                      child: ImageBoxTile("girl.jpg", "Ask a Doubt"),
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Flexible(
                    child: ImageBoxTile("group.jpg", "Groups"),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        AutoRouter.of(context).push(QuestionFormRoute());
                      },
                      child: ImageBoxTile("girl.jpg", "Ask a Doubt"),
                    ),
                  )
                ],
              );
      },
    );
  }
}

// ignore: must_be_immutable
class ImageBoxTile extends StatelessWidget {
  String image;
  String title;
  ImageBoxTile(this.image, this.title);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20.h,
        top: 1.sw > 450 ? 38.h : 5.h,
        right: 20.h,
        bottom: 1.sw > 450 ? 1.h : 5.h,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 8.h,
            ),
            child: Text(
              title,
              style: Apptheme(context).thinText.copyWith(
                    fontSize: 20.sp,
                  ),
            ),
          ),
          Image(
            image: AssetImage("assets/images/$image"),
            width: 1.sw / 2.5,
            height: 1.sw > 450 ? 1.sh / 3 : 1.sh / 5,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
