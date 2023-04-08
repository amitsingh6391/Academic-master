import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            debugPrint('I am authenticated!');

            AutoRouter.of(context).replace(Homepage());
          },
          unauthenticated: (_) {
            debugPrint('I am unthenticated!');
            AutoRouter.of(context).replace(const SignInRoute());
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            "assets/lottiefiles/splash.json",
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
