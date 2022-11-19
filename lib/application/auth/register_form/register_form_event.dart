part of 'register_form_bloc.dart';

@freezed
class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.emailChanged(String emailStr) = EmailChanged;
  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory RegisterFormEvent.nameChanged(String nameStr) = NameChanged;
  const factory RegisterFormEvent.phoneNumberChanged(String phoneNumberStr) =
      PhoneNumberChanged;
  const factory RegisterFormEvent.branchChanged(String branchStr) =
      BranchChanged;
  const factory RegisterFormEvent.courseChanged(String courseStr) =
      CourseChanged;
  const factory RegisterFormEvent.collegeChanged(String collegeStr) =
      CollegeChanged;
  const factory RegisterFormEvent.yearChanged(String yearStr) = YearChanged;
  const factory RegisterFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
