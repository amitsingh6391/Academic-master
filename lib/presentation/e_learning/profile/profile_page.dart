import 'package:academic_master/application/e_learning/users_watcher/users_watcher_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/e_learning/profile/widgets/profile_tiles.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:academic_master/presentation/utils/utilizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: .2.sh,
            child: Stack(
              children: [
                Positioned(
                  top: topPadding1,
                  left: rightpadding - 10,
                  child: IconButton(
                    onPressed: () {
                      sharelink();
                    },
                    icon: const Icon(
                      FeatherIcons.share2,
                      color: Apptheme.primaryColor,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: toppadding,
                    bottom: bottomPadding,
                  ),
                  child: Center(
                    child: Text(
                      "PROFILE",
                      style: Apptheme(context).boldText.copyWith(
                            fontSize: 20.sp,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  top: topPadding1,
                  right: rightpadding - 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.bell,
                      color: Apptheme.primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/avatar.svg",
              height: 130.h,
            ),
          ),
          BlocProvider(
            create: (context) => getIt<UsersWatcherBloc>()
              ..add(
                const UsersWatcherEvent.watchCurrentUser(),
              ),
            child: BlocBuilder<UsersWatcherBloc, UsersWatcherState>(
              builder: (BuildContext context, state) {
                return state.map(
                  empty: (_) => const Text("empty"),
                  initial: (value) => const Text("loadintial"),
                  loadFailure: (value) => const Text("loadfailure"),
                  loadInProgress: (value) => const Text("loading..."),
                  loadSuccess: (value) {
                    return Column(
                      children: [
                        Text(
                          value.users.first.name.getorCrash(),
                          style: Apptheme(context).boldText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: 20.sp,
                              ),
                        ),
                        Text(
                          value.users.first.college.getorCrash().length > 15
                              ? value.users.first.college
                                  .getorCrash()
                                  .substring(0, 15)
                              : value.users.first.college.getorCrash(),
                          style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: 12.sp,
                              ),
                        ),
                        Text(
                          "${value.users.first.branch.getorCrash()}  /  ${value.users.first.year.getorCrash()}",
                          style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.assentColor,
                                fontSize: 12.sp,
                              ),
                        ),
                        Profileoption(
                          mobileNumber:
                              value.users.first.contactNumber.getorCrash(),
                          email: value.users.first.email.getorCrash(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
