import 'dart:async';

import 'package:academic_master/application/auth/auth_bloc.dart';
import 'package:academic_master/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:academic_master/presentation/auth/provider/auth_tab_provider.dart';
import 'package:academic_master/presentation/auth/sign_in_page.dart';
import 'package:academic_master/presentation/auth/widgets/sign_in_form.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockSignInFormBloc extends MockBloc<SignInFormEvent, SignInFormState>
    implements SignInFormBloc {}

void main() {
  testWidgets(
    'Sign in page test',
    (tester) async {
      final StreamController<AuthState> authStreamController =
          StreamController<AuthState>.broadcast();

      final StreamController<SignInFormState> signInFormStreamController =
          StreamController<SignInFormState>.broadcast();

      final mockAuthBloc = MockAuthBloc();

      final mockSignInFormBloc = MockSignInFormBloc();

      whenListen(
        mockAuthBloc,
        authStreamController.stream,
        initialState: const AuthState.authenticated(),
      );

      whenListen(
        mockSignInFormBloc,
        signInFormStreamController.stream,
        initialState: SignInFormState.initial(),
      );

      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (_) => mockAuthBloc,
            ),
            BlocProvider<SignInFormBloc>(
              create: (_) => mockSignInFormBloc,
            ),
            ChangeNotifierProvider(
              create: (_) => AuthTabProvider(),
            ),
          ],
          child: MaterialApp(
            home: SignInPage(),
          ),
        ),
      );

      await tester.pump();

      await tester.pump();

      expect(find.text('Login'), findsOneWidget);
      expect(find.byKey(emailKey), findsOneWidget);

      await tester.enterText(find.byKey(emailKey), 'amit.singh@kuhoo.com');
      await tester.pump();
      expect(find.byKey(passwordKey), findsOneWidget);
      await tester.enterText(find.byKey(passwordKey), 'Singh@6391');
      await tester.pump();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await authStreamController.close();
      await signInFormStreamController.close();
    },
  );
}
