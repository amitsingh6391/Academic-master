import 'dart:async';
import 'dart:io';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_question_form_event.dart';
part 'add_question_form_state.dart';
part 'add_question_form_bloc.freezed.dart';

@injectable
class AddQuestionFormBloc
    extends Bloc<AddQuestionFormEvent, AddQuestionFormState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _onInitialized(
    _Initialized event,
    Emitter<AddQuestionFormState> emit,
  ) async {
    emit(
      event.initialQuestionOption.fold(
        () => state,
        (intialQuestion) => state.copyWith(
          question: intialQuestion,
          isEditing: true,
        ),
      ),
    );
  }

  Future<void> _onQuestionDescriptionChanged(
    _QuestionDescriptionChanged event,
    Emitter<AddQuestionFormState> emit,
  ) async {
    emit(
      state.copyWith(
        question: state.question.copyWith(
          questionDescription: QuestionDescription(event.description),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onPickImage(
    _PickImage event,
    Emitter<AddQuestionFormState> emit,
  ) async {}

  Future<void> _onAddQuestionpressed(
    _AddQuestionpressed event,
    Emitter<AddQuestionFormState> emit,
  ) async {
    late Either<FirebaseFailure, Unit> failureOrSuccess;
    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ),
    );

    if (state.question.failureOption.isNone()) {
      debugPrint(
        'ok  i m in application layer ....... ${event.file} ${state.question}',
      );
      failureOrSuccess = await _iElearningRepository.createQuestion(
        event.file,
        state.question,
      );
      state.isEditing
          ? await _iElearningRepository.updateQuestion(state.question)
          : await _iElearningRepository.createQuestion(
              event.file,
              state.question,
            );
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  AddQuestionFormBloc(this._iElearningRepository)
      : super(AddQuestionFormState.initial()) {
    on<_Initialized>(_onInitialized);
    on<_QuestionDescriptionChanged>(_onQuestionDescriptionChanged);
    on<_PickImage>(_onPickImage);
    on<_AddQuestionpressed>(_onAddQuestionpressed);
  }
}
