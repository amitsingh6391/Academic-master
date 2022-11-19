import 'dart:async';

import 'package:academic_master/domain/auth/i_auth_facade.dart';
import 'package:academic_master/domain/auth/value_objects.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import "package:academic_master/domain/core/value_objects.dart";
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'edit_profile_bloc.freezed.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final IAuthFacade _authFacade;

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onNameChanged(
    NameChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        name: Name(event.nameStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onPhoneNumberChanged(
    PhoneNumberChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumberStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onBranchChanged(
    BranchChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        branch: Branch(event.branchStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onCourseChanged(
    CourseChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        course: Course(event.courseStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onCollegeChanged(
    CollegeChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        college: College(event.collegeStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onYearChanged(
    YearChanged event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        year: Year(event.yearStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onEditProfilePressed(
    EditProfilePressed event,
    Emitter<EditProfileState> emit,
  ) async {
    Either<FirebaseFailure, Unit>? failureOrSuccess;

    emit(
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ),
    );

    debugPrint("im gone to edit in applicatio layer");

    failureOrSuccess = await _authFacade.editProfile(
      emailAddress: state.emailAddress,
      name: state.name,
      phoneNumber: state.phoneNumber,
      branch: state.branch,
      course: state.course,
      college: state.college,
      year: state.year,
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  EditProfileBloc(this._authFacade) : super(EditProfileState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<NameChanged>(_onNameChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<BranchChanged>(_onBranchChanged);
    on<CourseChanged>(_onCourseChanged);
    on<CollegeChanged>(_onCollegeChanged);
    on<YearChanged>(_onYearChanged);
    on<EditProfilePressed>(_onEditProfilePressed);
  }
}
