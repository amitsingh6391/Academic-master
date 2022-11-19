part of 'question_watcher_bloc.dart';

@freezed
class QuestionWatcherState with _$QuestionWatcherState {
  const factory QuestionWatcherState.initial() = _Initial;
  const factory QuestionWatcherState.loadInProgress() = _LoadInProgress;

  const factory QuestionWatcherState.loadSuccess(KtList<Question> questions) =
      _LoadSuccess;

  const factory QuestionWatcherState.loadFailure(
    FirebaseFailure firebaseFailure,
  ) = _LoadFailure;

  const factory QuestionWatcherState.empty() = _Empty;
}
