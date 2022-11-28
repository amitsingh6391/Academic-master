import 'package:academic_master/presentation/core/academic_master_bloc_provider.dart';
import 'package:academic_master/presentation/core/provider_injection.dart';
import 'package:academic_master/presentation/core/responsive.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
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
          builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: PageBreakpoint.tablet,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: const ColoredBox(color: Color(0xFFF5F5F5)),
          ),
        ),
      ),
    );
  }
}
