import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/chatroom.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:academic_master/domain/e_learning/value_objects.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_personal_chat_message_event.dart';
part 'add_personal_chat_message_state.dart';
part 'add_personal_chat_message_bloc.freezed.dart';

@injectable
class AddPersonalChatMessageBloc
    extends Bloc<AddPersonalChatMessageEvent, AddPersonalChatMessageState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onMessageDescriptionChanged(
    _MessageDescriptionChanged event,
    Emitter<AddPersonalChatMessageState> emit,
  ) async {
    debugPrint("this is des ${event.description}");
    emit(
      state.copyWith(
        message: state.message.copyWith(
          messageDescription: CommentDescription(event.description),
        ),
        chatroom: state.chatroom.copyWith(
          chatroomDescription: CommentDescription(event.description),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> _onAddMessagepressed(
    _AddMessagepressed event,
    Emitter<AddPersonalChatMessageState> emit,
  ) async {
    late Either<FirebaseFailure, Unit> failureOrSuccess;
    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ),
    );

    if (state.message.failureOption.isNone()) {
      debugPrint("ok nbro i m in application layer ...... ${event.partnerId}");
      failureOrSuccess =
          await _iChatsAndFriendsRepository.createPersonalMessage(
        state.message,
        event.partnerId,
        state.chatroom,
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

  AddPersonalChatMessageBloc(this._iChatsAndFriendsRepository)
      : super(AddPersonalChatMessageState.initial()) {
    on<_MessageDescriptionChanged>(_onMessageDescriptionChanged);
    on<_AddMessagepressed>(_onAddMessagepressed);
  }
}
