import 'package:academic_master/presentation/e_learning/e_learning_dashboard/question_and_comments/users_questions.dart';
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/widgets/dashboard_appbar.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Apptheme.backgroundColor,
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DashBoardAppBar(),
                UsersQuestions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
