import 'package:academic_master/presentation/e_learning/e_learning_dashboard/dashboard_page.dart';
import 'package:academic_master/presentation/e_learning/e_learning_dashboard/widgets/dashboard_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class Dashboard extends HookWidget {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        //  style: DrawerStyle.Style5,
        menuScreen: DashboardDrawer(),
        mainScreen: DashboardPage(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        drawerShadowsBackgroundColor: Colors.grey[300]!,
        // slideWidth: MediaQuery.of(context).size.width *
        //     (ZoomDrawer.isRTL() ? .45 : 0.25),
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}
