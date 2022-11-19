part of 'question_actor_bloc.dart';

@freezed
class QuestionActorState with _$QuestionActorState {
  const factory QuestionActorState.initial() = _Initial;
  const factory QuestionActorState.actionInProgress() = _ActionInProgress;
  const factory QuestionActorState.deleteFailure(
    FirebaseFailure firebaseFailure,
  ) = _DeleteFailure;
  const factory QuestionActorState.deleteSuccess() = _DeleteSuccess;
}
