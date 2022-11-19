import 'dart:async';
import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/i_e_learning_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'users_watcher_event.dart';
part 'users_watcher_state.dart';
part 'users_watcher_bloc.freezed.dart';

@injectable
class UsersWatcherBloc extends Bloc<UsersWatcherEvent, UsersWatcherState> {
  final IElearningRepository _iElearningRepository;

  Future<void> _watchCurrentUser(
    _Started event,
    Emitter<UsersWatcherState> emit,
  ) async {
    debugPrint("@@@@@this is user id ${event.uId}");
    emit(const UsersWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, List<User>>>(
      _iElearningRepository.watchCurrentUser(uId: event.uId.toString()),
      onData: (data) => emit(
        data.fold((f) => UsersWatcherState.loadFailure(f), (users) {
          if (users.isEmpty) {
            return const UsersWatcherState.empty();
          }
          return UsersWatcherState.loadSuccess(users);
        }),
      ),
      onError: (error, stackTrace) =>
          const UsersWatcherState.loadFailure(FirebaseFailure.unexpected()),
    );
  }

  UsersWatcherBloc(this._iElearningRepository)
      : super(
          const UsersWatcherState.initial(),
        ) {
    on<_Started>(_watchCurrentUser);
  }
}
