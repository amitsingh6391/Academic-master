part of 'add_question_form_bloc.dart';

@freezed
class AddQuestionFormEvent with _$AddQuestionFormEvent {
  const factory AddQuestionFormEvent.initialized(
    Option<Question> initialQuestionOption,
  ) = _Initialized;

  const factory AddQuestionFormEvent.questionDescriptionChanged(
    String description,
  ) = _QuestionDescriptionChanged;

  const factory AddQuestionFormEvent.pickImage() = _PickImage;

  const factory AddQuestionFormEvent.addQuestionPressed(
    File? file,
    Question question,
  ) = _AddQuestionpressed;
}
