import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nil/nil.dart';

PreferredSizeWidget myAppBar() {
  return AppBar(
    elevation: 0,
    leading: ScreenUtil().screenWidth < 451
        ? Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
            ),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Apptheme.secondaryColor,
              ),
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          )
        : nil,
  );
}
