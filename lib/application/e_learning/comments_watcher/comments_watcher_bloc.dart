import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/user_comment.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'comments_watcher_event.dart';
part 'comments_watcher_state.dart';
part 'comments_watcher_bloc.freezed.dart';

@injectable
class CommentsWatcherBloc
    extends Bloc<CommentsWatcherEvent, CommentsWatcherState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _onWatchComments(
    _watchComments event,
    Emitter<CommentsWatcherState> emit,
  ) async {
    emit(const CommentsWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, KtList<UserComment>>>(
      _iElearningRepository.watchComments(event.questionId),
      onData: (data) => emit(
        data.fold((f) => CommentsWatcherState.loadFailure(f), (comments) {
          if (comments.isEmpty()) {
            return const CommentsWatcherState.empty();
          }
          return CommentsWatcherState.loadSuccess(comments);
        }),
      ),
      onError: (error, stackTrace) =>
          const CommentsWatcherState.loadFailure(FirebaseFailure.unexpected()),
    );
  }

  CommentsWatcherBloc(this._iElearningRepository)
      : super(const CommentsWatcherState.initial()) {
    on<_watchComments>(_onWatchComments);
  }
}
