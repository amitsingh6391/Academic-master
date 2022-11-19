import 'package:academic_master/domain/auth/user.dart';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'watch_all_users_in_our_class_event.dart';
part 'watch_all_users_in_our_class_state.dart';
part 'watch_all_users_in_our_class_bloc.freezed.dart';

@injectable
class WatchAllUsersInOurClassBloc
    extends Bloc<WatchAllUsersInOurClassEvent, WatchAllUsersInOurClassState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onWatchAllUsersInOurClassEvent(
    _Started event,
    Emitter<WatchAllUsersInOurClassState> emit,
  ) async {
    emit(const WatchAllUsersInOurClassState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, List<User>>>(
      _iChatsAndFriendsRepository.watchAllUsersInOurClass(
        event.course,
        event.branch,
        event.year,
      ),
      onData: (data) => emit(
        data.fold((f) => WatchAllUsersInOurClassState.loadFailure(f), (users) {
          if (users.isEmpty) {
            return const WatchAllUsersInOurClassState.empty();
          }
          return WatchAllUsersInOurClassState.loadSuccess(users);
        }),
      ),
      onError: (error, stackTrace) =>
          const WatchAllUsersInOurClassState.loadFailure(
        FirebaseFailure.unexpected(),
      ),
    );

    // _iChatsAndFriendsRepository
    // .watchAllUsersInOurClass(
    //   event.course,
    //   event.branch,
    //   event.year,
    // )
    // .map(
    //   (failureOrUsers) => failureOrUsers.fold(
    //     (f) => emit(WatchAllUsersInOurClassState.loadFailure(f)),
    //     (users) {
    //       if (users.isEmpty) {
    //         emit(const WatchAllUsersInOurClassState.empty());
    //       }

    //       emit(WatchAllUsersInOurClassState.loadSuccess(users));
    //     },
    //   ),
    // );
  }

  WatchAllUsersInOurClassBloc(this._iChatsAndFriendsRepository)
      : super(const WatchAllUsersInOurClassState.initial()) {
    on<_Started>(_onWatchAllUsersInOurClassEvent);
  }
}
