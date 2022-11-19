part of 'question_actor_bloc.dart';

@freezed
class QuestionActorEvent with _$QuestionActorEvent {
  const factory QuestionActorEvent.deleted(Question question) = _Deleted;
}
