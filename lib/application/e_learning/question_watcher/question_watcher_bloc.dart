import 'dart:async';

import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/question.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'question_watcher_event.dart';
part 'question_watcher_state.dart';
part 'question_watcher_bloc.freezed.dart';

@injectable
class QuestionWatcherBloc
    extends Bloc<QuestionWatcherEvent, QuestionWatcherState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _onWatchAllQuestions(
    _WatchAllQuestions event,
    Emitter<QuestionWatcherState> emit,
  ) async {
    emit(const QuestionWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, KtList<Question>>>(
      _iElearningRepository.watchAllQuestion(),
      onData: (data) => emit(
        data.fold((f) => QuestionWatcherState.loadFailure(f), (question) {
          if (question.isEmpty()) {
            return const QuestionWatcherState.empty();
          }
          return QuestionWatcherState.loadSuccess(question);
        }),
      ),
      onError: (error, stackTrace) =>
          const QuestionWatcherState.loadFailure(FirebaseFailure.unexpected()),
    );
  }

  QuestionWatcherBloc(this._iElearningRepository)
      : super(const QuestionWatcherState.initial()) {
    on<_WatchAllQuestions>(
      _onWatchAllQuestions,
    );
  }
}
