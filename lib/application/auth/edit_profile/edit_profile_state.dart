part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    required EmailAddress emailAddress,
 
    required Name name,
    required PhoneNumber phoneNumber,
    required Course course,
    required Branch branch,
    required College college,
    required Year year,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<FirebaseFailure, Unit>> authFailureOrSuccessOption,
  }) = _EditProfileState;

  factory EditProfileState.initial() => EditProfileState(
        emailAddress: EmailAddress(""),
    
        name: Name(""),
        phoneNumber: PhoneNumber(""),
        course: Course(""),
        branch: Branch(""),
        college: College(""),
        year: Year(""),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
