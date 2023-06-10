import 'package:academic_master/presentation/core/academic_master_bloc_provider.dart';
import 'package:academic_master/presentation/core/provider_injection.dart';
import 'package:academic_master/presentation/core/responsive.dart';
import 'package:academic_master/presentation/routes/router.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return AcademicmasterBlocProvider(
      child: MultiProvider(
        providers: providers,
        child: MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          title: 'Academic master',
          debugShowCheckedModeBanner: false,
          theme: Apptheme.theme,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(
                start: PageBreakpoint.MOBILE_MIN,
                end: PageBreakpoint.MOBILE_MAX,
                name: MOBILE,
              ),
              const Breakpoint(
                start: PageBreakpoint.TABLET_MIN,
                end: PageBreakpoint.TABLET_MAX,
                name: TABLET,
              ),
              const Breakpoint(
                start: PageBreakpoint.DESKTOP_MIN,
                end: PageBreakpoint.DESKTOP_MAX,
                name: DESKTOP,
              ),
              const Breakpoint(
                start: PageBreakpoint.UHD_MIN,
                end: PageBreakpoint.UHD_MAX,
                name: '4K',
              ),
              const Breakpoint(
                start: PageBreakpoint.BEYOND_UHD_MIN,
                end: PageBreakpoint.MAX,
                name: '>4K',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
