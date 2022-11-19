part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required EmailAddress emailAddress,
    required bool showErrorMessages,
    required bool isSent,
    required bool isSubmitting,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() => ForgotPasswordState(
        emailAddress: EmailAddress(''),
        showErrorMessages: false,
        isSent: false,
        isSubmitting: false,
      );
}
