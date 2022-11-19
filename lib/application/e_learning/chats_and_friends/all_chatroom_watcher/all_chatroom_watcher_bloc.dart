import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/chatroom.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'all_chatroom_watcher_event.dart';
part 'all_chatroom_watcher_state.dart';
part 'all_chatroom_watcher_bloc.freezed.dart';

@injectable
class AllChatroomWatcherBloc
    extends Bloc<AllChatroomWatcherEvent, AllChatroomWatcherState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onWatchAllChatrooms(
    _WatchAllChatrooms event,
    Emitter<AllChatroomWatcherState> emit,
  ) async {
    emit(const AllChatroomWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, KtList<Chatroom>>>(
      _iChatsAndFriendsRepository.watchAllChatrooms(),
      onData: (data) => emit(
        data.fold((f) => AllChatroomWatcherState.loadFailure(f), (chatroom) {
          if (chatroom.isEmpty()) {
            return const AllChatroomWatcherState.empty();
          }
          return AllChatroomWatcherState.loadSuccess(chatroom);
        }),
      ),
      onError: (error, stackTrace) => const AllChatroomWatcherState.loadFailure(
        FirebaseFailure.unexpected(),
      ),
    );
  }

  AllChatroomWatcherBloc(this._iChatsAndFriendsRepository)
      : super(const AllChatroomWatcherState.initial()) {
    on<_WatchAllChatrooms>(_onWatchAllChatrooms);
  }
}
