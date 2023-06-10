import 'package:academic_master/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterEx on WidgetTester {
  Future<void> pumpPage(
    Widget widget, {
    String? initialLocation,
    Duration? duration,
    EnginePhase phase = EnginePhase.sendSemanticsUpdate,
    Size size = Size.zero,
    ThemeData? theme,
    List<BlocProvider> providers = const [],
    List<NavigatorObserver>? navigatorObservers,
  }) async {
    final appRouter = AppRouter();
    final child = MaterialApp.router(
      theme: theme,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      routeInformationProvider: appRouter.routeInfoProvider(),
    );
    final testWidget = MediaQuery(
      data: MediaQueryData(size: size),
      child: providers.isEmpty
          ? child
          : MultiBlocProvider(
              providers: providers,
              child: child,
            ),
    );
    await pumpWidget(testWidget, duration, phase);
  }
}

void setWindowSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size * tester.view.devicePixelRatio;
}
