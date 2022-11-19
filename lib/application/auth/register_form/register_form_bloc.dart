import 'dart:async';

import 'package:academic_master/domain/auth/auth_failure.dart';
import 'package:academic_master/domain/auth/i_auth_facade.dart';
import 'package:academic_master/domain/auth/value_objects.dart';
import "package:academic_master/domain/core/value_objects.dart";
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_form_bloc.freezed.dart';
part 'register_form_event.dart';
part 'register_form_state.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthFacade _authFacade;

  Future<void> _onEmailChanged(
    EmailChanged event,
    Emitter<RegisterFormState> emit,
  ) async {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.emailStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onPasswordChanged(
    PasswordChanged event,
    Emitter<RegisterFormState> emit,
  ) async {
    emit(
      state.copyWith(
        password: Password(event.passwordStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onNameChanged(
    NameChanged event,
    Emitter<RegisterFormState> emit,
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
    Emitter<RegisterFormState> emit,
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
    Emitter<RegisterFormState> emit,
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
    Emitter<RegisterFormState> emit,
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
    Emitter<RegisterFormState> emit,
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
    Emitter<RegisterFormState> emit,
  ) async {
    emit(
      state.copyWith(
        year: Year(event.yearStr),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onRegisterWithEmailAndPasswordPressed(
    RegisterWithEmailAndPasswordPressed event,
    Emitter<RegisterFormState> emit,
  ) async {
    debugPrint(state.emailAddress.toString());
    debugPrint(state.password.toString());
    debugPrint(state.name.toString());
    debugPrint(state.phoneNumber.toString());
    debugPrint(state.branch.toString());
    debugPrint(state.college.toString());
    debugPrint(state.year.toString());

    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isNameValid = state.name.isValid();
    final isPhoneNumberValid = state.phoneNumber.isValid();
    final isBranchValid = state.branch.isValid();
    final isCourseValid = state.course.isValid();
    final isCollegeValid = state.college.isValid();
    final isYearValid = state.year.isValid();

    if (isEmailValid &&
        isPasswordValid &&
        isNameValid &&
        isPhoneNumberValid &&
        isBranchValid &&
        isCourseValid &&
        isCollegeValid &&
        isYearValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
        emailAddress: state.emailAddress,
        password: state.password,
        name: state.name,
        phoneNumber: state.phoneNumber,
        branch: state.branch,
        course: state.course,
        college: state.college,
        year: state.year,
      );
    }

    emit(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  RegisterFormBloc(this._authFacade) : super(RegisterFormState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<BranchChanged>(_onBranchChanged);
    on<CourseChanged>(_onCourseChanged);
    on<CollegeChanged>(_onCollegeChanged);
    on<YearChanged>(_onYearChanged);
    on<RegisterWithEmailAndPasswordPressed>(
      _onRegisterWithEmailAndPasswordPressed,
    );
  }
}
