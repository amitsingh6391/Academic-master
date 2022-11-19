import 'dart:async';

import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/subject.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

part 'subject_watcher_event.dart';
part 'subject_watcher_state.dart';
part 'subject_watcher_bloc.freezed.dart';

@injectable
class SubjectWatcherBloc
    extends Bloc<SubjectWatcherEvent, SubjectWatcherState> {
  final IElearningRepository _iElearningRepository;

  StreamSubscription<Either<FirebaseFailure, KtList<Subject>>>?
      _subjectStreamSubscription;

  Future<void> _onWatchAllSubject(
    _WatchAllSubject event,
    Emitter<SubjectWatcherState> emit,
  ) async {
    emit(const SubjectWatcherState.loadInProgress());

    await _subjectStreamSubscription?.cancel();
    _subjectStreamSubscription =
        _iElearningRepository.watchAllSubjects().listen(
              (failureOrSubjects) => add(
                SubjectWatcherEvent.subjectsReceived(failureOrSubjects),
              ),
            );
  }

  Future<void> __onSubjectsReceived(
    _SubjectsReceived event,
    Emitter<SubjectWatcherState> emit,
  ) async {
    emit(
      event.failureOrSubjects.fold(
        (f) => SubjectWatcherState.loadFailure(f),
        (subjects) => SubjectWatcherState.loadSuccess(subjects),
      ),
    );
  }

  SubjectWatcherBloc(this._iElearningRepository)
      : super(const SubjectWatcherState.initial()) {
    on<_WatchAllSubject>(_onWatchAllSubject);
    on<_SubjectsReceived>(__onSubjectsReceived);
  }

  @override
  Future<void> close() async {
    await _subjectStreamSubscription?.cancel();
    return super.close();
  }
}
