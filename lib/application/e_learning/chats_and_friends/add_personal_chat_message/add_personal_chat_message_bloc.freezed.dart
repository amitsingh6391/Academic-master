// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_personal_chat_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPersonalChatMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) messageDescriptionChanged,
    required TResult Function(Message message, String partnerId)
        addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message, String partnerId)? addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message, String partnerId)? addMessagePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MessageDescriptionChanged value)
        messageDescriptionChanged,
    required TResult Function(_AddMessagepressed value) addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult? Function(_AddMessagepressed value)? addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult Function(_AddMessagepressed value)? addMessagePressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPersonalChatMessageEventCopyWith<$Res> {
  factory $AddPersonalChatMessageEventCopyWith(
          AddPersonalChatMessageEvent value,
          $Res Function(AddPersonalChatMessageEvent) then) =
      _$AddPersonalChatMessageEventCopyWithImpl<$Res,
          AddPersonalChatMessageEvent>;
}

/// @nodoc
class _$AddPersonalChatMessageEventCopyWithImpl<$Res,
        $Val extends AddPersonalChatMessageEvent>
    implements $AddPersonalChatMessageEventCopyWith<$Res> {
  _$AddPersonalChatMessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MessageDescriptionChangedCopyWith<$Res> {
  factory _$$_MessageDescriptionChangedCopyWith(
          _$_MessageDescriptionChanged value,
          $Res Function(_$_MessageDescriptionChanged) then) =
      __$$_MessageDescriptionChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$_MessageDescriptionChangedCopyWithImpl<$Res>
    extends _$AddPersonalChatMessageEventCopyWithImpl<$Res,
        _$_MessageDescriptionChanged>
    implements _$$_MessageDescriptionChangedCopyWith<$Res> {
  __$$_MessageDescriptionChangedCopyWithImpl(
      _$_MessageDescriptionChanged _value,
      $Res Function(_$_MessageDescriptionChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$_MessageDescriptionChanged(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MessageDescriptionChanged implements _MessageDescriptionChanged {
  const _$_MessageDescriptionChanged(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'AddPersonalChatMessageEvent.messageDescriptionChanged(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageDescriptionChanged &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDescriptionChangedCopyWith<_$_MessageDescriptionChanged>
      get copyWith => __$$_MessageDescriptionChangedCopyWithImpl<
          _$_MessageDescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) messageDescriptionChanged,
    required TResult Function(Message message, String partnerId)
        addMessagePressed,
  }) {
    return messageDescriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message, String partnerId)? addMessagePressed,
  }) {
    return messageDescriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message, String partnerId)? addMessagePressed,
    required TResult orElse(),
  }) {
    if (messageDescriptionChanged != null) {
      return messageDescriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MessageDescriptionChanged value)
        messageDescriptionChanged,
    required TResult Function(_AddMessagepressed value) addMessagePressed,
  }) {
    return messageDescriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult? Function(_AddMessagepressed value)? addMessagePressed,
  }) {
    return messageDescriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult Function(_AddMessagepressed value)? addMessagePressed,
    required TResult orElse(),
  }) {
    if (messageDescriptionChanged != null) {
      return messageDescriptionChanged(this);
    }
    return orElse();
  }
}

abstract class _MessageDescriptionChanged
    implements AddPersonalChatMessageEvent {
  const factory _MessageDescriptionChanged(final String description) =
      _$_MessageDescriptionChanged;

  String get description;
  @JsonKey(ignore: true)
  _$$_MessageDescriptionChangedCopyWith<_$_MessageDescriptionChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddMessagepressedCopyWith<$Res> {
  factory _$$_AddMessagepressedCopyWith(_$_AddMessagepressed value,
          $Res Function(_$_AddMessagepressed) then) =
      __$$_AddMessagepressedCopyWithImpl<$Res>;
  @useResult
  $Res call({Message message, String partnerId});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$_AddMessagepressedCopyWithImpl<$Res>
    extends _$AddPersonalChatMessageEventCopyWithImpl<$Res,
        _$_AddMessagepressed> implements _$$_AddMessagepressedCopyWith<$Res> {
  __$$_AddMessagepressedCopyWithImpl(
      _$_AddMessagepressed _value, $Res Function(_$_AddMessagepressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? partnerId = null,
  }) {
    return _then(_$_AddMessagepressed(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$_AddMessagepressed implements _AddMessagepressed {
  const _$_AddMessagepressed(this.message, this.partnerId);

  @override
  final Message message;
  @override
  final String partnerId;

  @override
  String toString() {
    return 'AddPersonalChatMessageEvent.addMessagePressed(message: $message, partnerId: $partnerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddMessagepressed &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, partnerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddMessagepressedCopyWith<_$_AddMessagepressed> get copyWith =>
      __$$_AddMessagepressedCopyWithImpl<_$_AddMessagepressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) messageDescriptionChanged,
    required TResult Function(Message message, String partnerId)
        addMessagePressed,
  }) {
    return addMessagePressed(message, partnerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message, String partnerId)? addMessagePressed,
  }) {
    return addMessagePressed?.call(message, partnerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message, String partnerId)? addMessagePressed,
    required TResult orElse(),
  }) {
    if (addMessagePressed != null) {
      return addMessagePressed(message, partnerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MessageDescriptionChanged value)
        messageDescriptionChanged,
    required TResult Function(_AddMessagepressed value) addMessagePressed,
  }) {
    return addMessagePressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult? Function(_AddMessagepressed value)? addMessagePressed,
  }) {
    return addMessagePressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MessageDescriptionChanged value)?
        messageDescriptionChanged,
    TResult Function(_AddMessagepressed value)? addMessagePressed,
    required TResult orElse(),
  }) {
    if (addMessagePressed != null) {
      return addMessagePressed(this);
    }
    return orElse();
  }
}

abstract class _AddMessagepressed implements AddPersonalChatMessageEvent {
  const factory _AddMessagepressed(
      final Message message, final String partnerId) = _$_AddMessagepressed;

  Message get message;
  String get partnerId;
  @JsonKey(ignore: true)
  _$$_AddMessagepressedCopyWith<_$_AddMessagepressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPersonalChatMessageState {
  Message get message => throw _privateConstructorUsedError;
  Chatroom get chatroom => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  String get partnerId =>
      throw _privateConstructorUsedError; // required String questionId,
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPersonalChatMessageStateCopyWith<AddPersonalChatMessageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPersonalChatMessageStateCopyWith<$Res> {
  factory $AddPersonalChatMessageStateCopyWith(
          AddPersonalChatMessageState value,
          $Res Function(AddPersonalChatMessageState) then) =
      _$AddPersonalChatMessageStateCopyWithImpl<$Res,
          AddPersonalChatMessageState>;
  @useResult
  $Res call(
      {Message message,
      Chatroom chatroom,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      String partnerId,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  $MessageCopyWith<$Res> get message;
  $ChatroomCopyWith<$Res> get chatroom;
}

/// @nodoc
class _$AddPersonalChatMessageStateCopyWithImpl<$Res,
        $Val extends AddPersonalChatMessageState>
    implements $AddPersonalChatMessageStateCopyWith<$Res> {
  _$AddPersonalChatMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? chatroom = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? partnerId = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      chatroom: null == chatroom
          ? _value.chatroom
          : chatroom // ignore: cast_nullable_to_non_nullable
              as Chatroom,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatroomCopyWith<$Res> get chatroom {
    return $ChatroomCopyWith<$Res>(_value.chatroom, (value) {
      return _then(_value.copyWith(chatroom: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddPersonalChatMessageStateCopyWith<$Res>
    implements $AddPersonalChatMessageStateCopyWith<$Res> {
  factory _$$_AddPersonalChatMessageStateCopyWith(
          _$_AddPersonalChatMessageState value,
          $Res Function(_$_AddPersonalChatMessageState) then) =
      __$$_AddPersonalChatMessageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Message message,
      Chatroom chatroom,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      String partnerId,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $MessageCopyWith<$Res> get message;
  @override
  $ChatroomCopyWith<$Res> get chatroom;
}

/// @nodoc
class __$$_AddPersonalChatMessageStateCopyWithImpl<$Res>
    extends _$AddPersonalChatMessageStateCopyWithImpl<$Res,
        _$_AddPersonalChatMessageState>
    implements _$$_AddPersonalChatMessageStateCopyWith<$Res> {
  __$$_AddPersonalChatMessageStateCopyWithImpl(
      _$_AddPersonalChatMessageState _value,
      $Res Function(_$_AddPersonalChatMessageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? chatroom = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? partnerId = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddPersonalChatMessageState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      chatroom: null == chatroom
          ? _value.chatroom
          : chatroom // ignore: cast_nullable_to_non_nullable
              as Chatroom,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddPersonalChatMessageState implements _AddPersonalChatMessageState {
  const _$_AddPersonalChatMessageState(
      {required this.message,
      required this.chatroom,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.partnerId,
      required this.saveFailureOrSuccessOption});

  @override
  final Message message;
  @override
  final Chatroom chatroom;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
  @override
  final String partnerId;
// required String questionId,
  @override
  final Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddPersonalChatMessageState(message: $message, chatroom: $chatroom, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, partnerId: $partnerId, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPersonalChatMessageState &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatroom, chatroom) ||
                other.chatroom == chatroom) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      chatroom,
      showErrorMessages,
      isSaving,
      isEditing,
      partnerId,
      saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPersonalChatMessageStateCopyWith<_$_AddPersonalChatMessageState>
      get copyWith => __$$_AddPersonalChatMessageStateCopyWithImpl<
          _$_AddPersonalChatMessageState>(this, _$identity);
}

abstract class _AddPersonalChatMessageState
    implements AddPersonalChatMessageState {
  const factory _AddPersonalChatMessageState(
      {required final Message message,
      required final Chatroom chatroom,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final String partnerId,
      required final Option<Either<FirebaseFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AddPersonalChatMessageState;

  @override
  Message get message;
  @override
  Chatroom get chatroom;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  String get partnerId;
  @override // required String questionId,
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddPersonalChatMessageStateCopyWith<_$_AddPersonalChatMessageState>
      get copyWith => throw _privateConstructorUsedError;
}
