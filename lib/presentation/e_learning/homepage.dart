import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/presentation/e_learning/chats_and_friends/chat_room_page.dart';
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/dashboard_page.dart';
import 'package:academic_master/presentation/e_learning/profile/profile_page.dart';
import 'package:academic_master/presentation/e_learning/subjects/subjects.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

@RoutePage()
class Homepage extends StatefulWidget {
  const Homepage({
    this.intialIndex,
    super.key,
  });

  final int? intialIndex;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PersistentTabController? _controller;

  @override
  void initState() {
    _controller =
        PersistentTabController(initialIndex: widget.intialIndex ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeMap(
              unauthenticated: (_) => AutoRouter.of(context).replace(
                const SignInRoute(),
              ),
              orElse: () {},
            );
          },
        ),
      ],
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          DashboardPage(),
          Subjects(),
          const ChatRoomPage(),
          const ProfilePage(),
        ],
        items: _navBarsItems(),

        resizeToAvoidBottomInset: true,

        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Apptheme.backgroundColor,
        ),

        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 800),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 600),
        ),
        navBarStyle:
            NavBarStyle.style3, // Choose the nav bar style with this property.
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: LineIcon.home(
          size: 35,
        ),
        activeColorPrimary: Apptheme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: LineIcon.bookReader(
          size: 35,
        ),
        activeColorPrimary: Apptheme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: LineIcon.facebookMessenger(
          size: 35,
        ),
        activeColorPrimary: Apptheme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: LineIcon.userGraduate(
          size: 35,
        ),
        activeColorPrimary: Apptheme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
