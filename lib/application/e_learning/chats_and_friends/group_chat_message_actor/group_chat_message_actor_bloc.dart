import 'dart:async';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'group_chat_message_actor_event.dart';
part 'group_chat_message_actor_state.dart';
part 'group_chat_message_actor_bloc.freezed.dart';

@injectable
class GroupChatMessageActorBloc
    extends Bloc<GroupChatMessageActorEvent, GroupChatMessageActorState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onDeleted(
    _Deleted event,
    Emitter<GroupChatMessageActorState> emit,
  ) async {
    emit(const GroupChatMessageActorState.actionInProgress());
    final possibleFailure =
        await _iChatsAndFriendsRepository.deleteGroupChatMessage(
      event.groupChatMessage,
    );

    emit(
      possibleFailure.fold(
        (f) => GroupChatMessageActorState.deleteFailure(f),
        (_) => const GroupChatMessageActorState.deleteSuccess(),
      ),
    );
  }

  GroupChatMessageActorBloc(this._iChatsAndFriendsRepository)
      : super(const GroupChatMessageActorState.initial()) {
    on<_Deleted>(_onDeleted);
  }
}
