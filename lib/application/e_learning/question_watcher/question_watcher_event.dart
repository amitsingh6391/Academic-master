part of 'question_watcher_bloc.dart';

@freezed
class QuestionWatcherEvent with _$QuestionWatcherEvent {
  const factory QuestionWatcherEvent.watchAllQuestions() = _WatchAllQuestions;
}
