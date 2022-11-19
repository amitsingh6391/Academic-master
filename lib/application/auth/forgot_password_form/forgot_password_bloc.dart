import 'dart:async';

import 'package:academic_master/domain/auth/i_auth_facade.dart';
import 'package:academic_master/domain/auth/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

@injectable
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final IAuthFacade _authFacade;

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        isSent: false,
      ),
    );
  }

  Future<void> _onSendPasswordResetEmailPressed(
    SendPasswordResetEmailPressed event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    final isEmailValid = state.emailAddress.isValid();
    if (isEmailValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
        ),
      );
      await _authFacade.sendPasswordResetEmail(
        emailAddress: state.emailAddress,
      );
      emit(
        state.copyWith(
          isSent: true,
          isSubmitting: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSent: false,
          showErrorMessages: true,
        ),
      );
    }
  }

  ForgotPasswordBloc(this._authFacade) : super(ForgotPasswordState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<SendPasswordResetEmailPressed>(_onSendPasswordResetEmailPressed);
  }
}
