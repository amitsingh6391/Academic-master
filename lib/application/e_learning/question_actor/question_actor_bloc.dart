import 'dart:async';

import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/question.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'question_actor_event.dart';
part 'question_actor_state.dart';
part 'question_actor_bloc.freezed.dart';

@injectable
class QuestionActorBloc extends Bloc<QuestionActorEvent, QuestionActorState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _onDeleted(
    _Deleted event,
    Emitter<QuestionActorState> emit,
  ) async {
    emit(const QuestionActorState.actionInProgress());
    final possibleFailure =
        await _iElearningRepository.deleteQuestion(event.question);

    emit(
      possibleFailure.fold(
        (f) => QuestionActorState.deleteFailure(f),
        (_) => const QuestionActorState.deleteSuccess(),
      ),
    );
  }

  QuestionActorBloc(this._iElearningRepository)
      : super(const QuestionActorState.initial()) {
    on<_Deleted>(_onDeleted);
  }
}
