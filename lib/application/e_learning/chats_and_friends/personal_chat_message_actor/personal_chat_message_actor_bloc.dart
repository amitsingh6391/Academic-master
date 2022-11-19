import 'dart:async';
import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
part 'personal_chat_message_actor_event.dart';
part 'personal_chat_message_actor_state.dart';
part 'personal_chat_message_actor_bloc.freezed.dart';

@injectable
class PersonalChatMessageActorBloc
    extends Bloc<PersonalChatMessageActorEvent, PersonalChatMessageActorState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onDeleted(
    _Deleted event,
    Emitter<PersonalChatMessageActorState> emit,
  ) async {
    emit(const PersonalChatMessageActorState.actionInProgress());
    final possibleFailure =
        await _iChatsAndFriendsRepository.deletePersonalChatMessage(
      event.personalChatMessage,
      event.partnerId,
    );

    emit(
      possibleFailure.fold(
        (f) => PersonalChatMessageActorState.deleteFailure(f),
        (_) => const PersonalChatMessageActorState.deleteSuccess(),
      ),
    );
  }

  PersonalChatMessageActorBloc(this._iChatsAndFriendsRepository)
      : super(const PersonalChatMessageActorState.initial()) {
    on<_Deleted>(_onDeleted);
  }
}
