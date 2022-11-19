part of 'subject_watcher_bloc.dart';

@freezed
class SubjectWatcherEvent with _$SubjectWatcherEvent {
  const factory SubjectWatcherEvent.watchAllSubject() = _WatchAllSubject;
  const factory SubjectWatcherEvent.subjectsReceived(
    Either<FirebaseFailure, KtList<Subject>> failureOrSubjects,
  ) = _SubjectsReceived;
}
