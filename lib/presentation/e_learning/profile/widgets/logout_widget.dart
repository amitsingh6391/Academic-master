import 'dart:ui';
import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/presentation/extension/util_extensions.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget logoutWidget(BuildContext context) {
  return Material(
    color: Colors.white10.withOpacity(0.6),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.transparent,
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              width: 1.sw,
              height: 1.sh / 3.5,
              decoration: const BoxDecoration(
                color: Apptheme.backgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Logout",
                    style: Apptheme(context).boldText,
                  ),
                  24.verticalSpace(),
                  Text(
                    "You want Logout?",
                    style: Apptheme(context).normalText,
                  ),
                  45.verticalSpace(),
                  Row(
                    children: [
                      Expanded(
                        child: _buttons(
                          context,
                          buttonName: "No",
                        ),
                      ),
                      20.horizontalSpace(),
                      Expanded(
                        child: _buttons(
                          context,
                          buttonName: "Yes",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buttons(
  BuildContext context, {
  String buttonName = '',
}) {
  return InkWell(
    onTap: () async {
      if (buttonName == "No") {
        AutoRouter.of(context).pop();
      } else {
        context.read<AuthBloc>().add(const AuthEvent.signOut());
        AutoRouter.of(context).replace(const SignInRoute());
      }
    },
    child: Container(
      height: 1.sh / 15,
      // ignore: sort_child_properties_last
      child: Center(
        child: Text(
          buttonName,
        ),
      ),
      decoration: BoxDecoration(
        color: buttonName == "Yes"
            ? Apptheme.primaryColor
            : Apptheme.backgroundColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Apptheme.primaryColor,
        ),
      ),
    ),
  );
}
