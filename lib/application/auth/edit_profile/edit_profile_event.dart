part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.emailChanged(String emailStr) = EmailChanged;

  const factory EditProfileEvent.nameChanged(String nameStr) = NameChanged;
  const factory EditProfileEvent.phoneNumberChanged(String phoneNumberStr) =
      PhoneNumberChanged;
  const factory EditProfileEvent.branchChanged(String branchStr) =
      BranchChanged;
  const factory EditProfileEvent.courseChanged(String courseStr) =
      CourseChanged;
  const factory EditProfileEvent.collegeChanged(String collegeStr) =
      CollegeChanged;
  const factory EditProfileEvent.yearChanged(String yearStr) = YearChanged;
  const factory EditProfileEvent.editProfilePressed() = EditProfilePressed;
}
