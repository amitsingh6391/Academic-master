part of 'add_question_form_bloc.dart';

@freezed
class AddQuestionFormState with _$AddQuestionFormState {
  const factory AddQuestionFormState({
    required Question question,
    required bool showErrorMessages,
    required bool isSaving,
    required bool isEditing,
    required Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption,
  }) = _AddQuestionFormState;

  factory AddQuestionFormState.initial() => AddQuestionFormState(
        question: Question.empty(),
        showErrorMessages: false,
        isSaving: false,
        isEditing: false,
        saveFailureOrSuccessOption: none(),
      );
}
