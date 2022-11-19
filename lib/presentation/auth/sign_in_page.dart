import 'package:academic_master/presentation/auth/provider/auth_tab_provider.dart';
import 'package:academic_master/presentation/auth/widgets/forgot_password.dart';
import 'package:academic_master/presentation/auth/widgets/register_form.dart';
import 'package:academic_master/presentation/auth/widgets/sign_in_form.dart';
import 'package:academic_master/presentation/core/appbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: myAppBar(),
          body: Container(
            constraints: BoxConstraints(
              maxWidth: ScreenUtil().screenWidth,
            ),
            child: Consumer<AuthTabProvider>(
              builder: (context, value, child) => getForm(value.tab),
            ),
          ),
        ),
      ),
    );
  }

  Widget getForm(int index) {
    if (index == 0) {
      return SignInForm();
    } else if (index == 1) {
      return RegisterForm();
    }
    return ForgotPasswordForm();
  }
}
