import 'package:academic_master/domain/core/firebase_failures.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/i_chats_and_friends_repository.dart';
import 'package:academic_master/domain/e_learning/chats_and_friends/message.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'personal_chat_message_watcher_event.dart';
part 'personal_chat_message_watcher_state.dart';
part 'personal_chat_message_watcher_bloc.freezed.dart';

@injectable
class PersonalChatMessageWatcherBloc extends Bloc<
    PersonalChatMessageWatcherEvent, PersonalChatMessageWatcherState> {
  final IChatsAndFriendsRepository _iChatsAndFriendsRepository;

  Future<void> _onWatchPersonalChatMessages(
    _WatchPersonalChatMessages event,
    Emitter<PersonalChatMessageWatcherState> emit,
  ) async {
    emit(const PersonalChatMessageWatcherState.loadInProgress());

    await emit.onEach<Either<FirebaseFailure, KtList<Message>>>(
      _iChatsAndFriendsRepository.watchPersonalChatMessages(event.partnerId),
      onData: (data) => emit(
        data.fold((f) => PersonalChatMessageWatcherState.loadFailure(f),
            (messages) {
          if (messages.isEmpty()) {
            return const PersonalChatMessageWatcherState.empty();
          }
          return PersonalChatMessageWatcherState.loadSuccess(messages);
        }),
      ),
      onError: (error, stackTrace) =>
          const PersonalChatMessageWatcherState.loadFailure(
        FirebaseFailure.unexpected(),
      ),
    );

    // _iChatsAndFriendsRepository.watchPersonalChatMessages(event.partnerId).map(
    //       (failureOrMessages) => failureOrMessages.fold(
    //         (f) => emit(PersonalChatMessageWatcherState.loadFailure(f)),
    //         (messages) {
    //           if (messages.isEmpty()) {
    //             emit(const PersonalChatMessageWatcherState.empty());
    //           }
    //           emit(PersonalChatMessageWatcherState.loadSuccess(messages));
    //         },
    //       ),
    //     );
  }

  PersonalChatMessageWatcherBloc(this._iChatsAndFriendsRepository)
      : super(const PersonalChatMessageWatcherState.initial()) {
    on<_WatchPersonalChatMessages>(_onWatchPersonalChatMessages);
  }
}
