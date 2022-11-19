part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.emailChanged(String emailStr) =
      EmailChanged;
  const factory ForgotPasswordEvent.sendPasswordResetEmailPressed() =
      SendPasswordResetEmailPressed;
}
