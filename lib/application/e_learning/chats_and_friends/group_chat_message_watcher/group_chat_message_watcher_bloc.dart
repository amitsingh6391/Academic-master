import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'group_chat_message_watcher_event.dart';
part 'group_chat_message_watcher_state.dart';
part 'group_chat_message_watcher_bloc.freezed.dart';

@injectable
class GroupChatMessageWatcherBloc
    extends Bloc<GroupChatMessageWatcherEvent, GroupChatMessageWatcherState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onWatchGroupChatMessages(
    _WatchGroupChatMessages event,
    Emitter<GroupChatMessageWatcherState> emit,
  ) async {
    emit(const GroupChatMessageWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, KtList<Message>>>(
      _iChatsAndFriendsRepository.watchGroupChatMessages(),
      onData: (data) => emit(
        data.fold((f) => GroupChatMessageWatcherState.loadFailure(f),
            (messages) {
          if (messages.isEmpty()) {
            return const GroupChatMessageWatcherState.empty();
          }
          return GroupChatMessageWatcherState.loadSuccess(messages);
        }),
      ),
      onError: (error, stackTrace) =>
          const GroupChatMessageWatcherState.loadFailure(
        FirebaseFailure.unexpected(),
      ),
    );

    // _iChatsAndFriendsRepository.watchGroupChatMessages().map(
    //       (failureOrMessages) => failureOrMessages.fold(
    //         (f) => emit(GroupChatMessageWatcherState.loadFailure(f)),
    //         (messages) {
    //           if (messages.isEmpty()) {
    //             emit(const GroupChatMessageWatcherState.empty());
    //           }
    //           emit(GroupChatMessageWatcherState.loadSuccess(messages));
    //         },
    //       ),
    //     );
  }

  GroupChatMessageWatcherBloc(this._iChatsAndFriendsRepository)
      : super(const GroupChatMessageWatcherState.initial()) {
    on<_WatchGroupChatMessages>(_onWatchGroupChatMessages);
  }
}
