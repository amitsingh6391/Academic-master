import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/core/value_objects.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:academic_master/domain/e_learning/user_comment.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_user_comment_bloc.freezed.dart';
part 'add_user_comment_event.dart';
part 'add_user_comment_state.dart';

@injectable
class AddUserCommentBloc
    extends Bloc<AddUserCommentEvent, AddUserCommentState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _onCommentDescriptionChanged(
    _CommentDescriptionChanged event,
    Emitter<AddUserCommentState> emit,
  ) async {
    debugPrint("this is des ${event.description}");
    emit(
      state.copyWith(
        comment: state.comment.copyWith(
          commentDescription: CommentDescription(event.description),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onAddCommentpressed(
    _AddCommentpressed event,
    Emitter<AddUserCommentState> emit,
  ) async {
    late Either<FirebaseFailure, Unit> failureOrSuccess;
    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ),
    );

    if (state.comment.failureOption.isNone()) {
      debugPrint(
        "ok nbro i m in application layer ...... ${state.comment}",
      );
      failureOrSuccess = await _iElearningRepository.createComment(
        state.comment.copyWith(commentId: UniqueId()),
        event.questionId,
      );
    } else {
      debugPrint("i m got error in application error");
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: true,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  AddUserCommentBloc(this._iElearningRepository)
      : super(AddUserCommentState.initial()) {
    on<_CommentDescriptionChanged>(_onCommentDescriptionChanged);
    on<_AddCommentpressed>(_onAddCommentpressed);
  }
}
