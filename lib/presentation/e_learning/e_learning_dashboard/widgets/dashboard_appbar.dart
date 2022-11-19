import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class DashBoardAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: toppadding,
            bottom: bottomPadding,
          ),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/avatar.svg",
              height: 70.h,
              width: 90.h,
            ),
          ),
        ),
        Positioned(
          top: topPadding1,
          right: rightpadding * 3,
          child: IconButton(
            onPressed: () {
              AutoRouter.of(context).push(QuestionFormRoute());
            },
            icon: const Icon(
              FeatherIcons.plusCircle,
              color: Apptheme.primaryColor,
              size: 35,
            ),
          ),
        ),
        Positioned(
          top: topPadding1,
          right: rightpadding,
          child: IconButton(
            onPressed: () {
              AutoRouter.of(context).push(const StudentsGroupChatScreen());
            },
            icon: const Icon(
              LineIcons.telegramPlane,
              color: Apptheme.primaryColor,
              size: 40,
            ),
          ),
        )
      ],
    );
  }
}
