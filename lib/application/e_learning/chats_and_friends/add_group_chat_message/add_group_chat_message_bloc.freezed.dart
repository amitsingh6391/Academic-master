// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_group_chat_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddGroupChatMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) messageDescriptionChanged,
    required TResult Function(Message message) addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message)? addMessagePressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message)? addMessagePressed,
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
abstract class $AddGroupChatMessageEventCopyWith<$Res> {
  factory $AddGroupChatMessageEventCopyWith(AddGroupChatMessageEvent value,
          $Res Function(AddGroupChatMessageEvent) then) =
      _$AddGroupChatMessageEventCopyWithImpl<$Res, AddGroupChatMessageEvent>;
}

/// @nodoc
class _$AddGroupChatMessageEventCopyWithImpl<$Res,
        $Val extends AddGroupChatMessageEvent>
    implements $AddGroupChatMessageEventCopyWith<$Res> {
  _$AddGroupChatMessageEventCopyWithImpl(this._value, this._then);

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
    extends _$AddGroupChatMessageEventCopyWithImpl<$Res,
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
    return 'AddGroupChatMessageEvent.messageDescriptionChanged(description: $description)';
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
    required TResult Function(Message message) addMessagePressed,
  }) {
    return messageDescriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message)? addMessagePressed,
  }) {
    return messageDescriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message)? addMessagePressed,
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

abstract class _MessageDescriptionChanged implements AddGroupChatMessageEvent {
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
  $Res call({Message message});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$_AddMessagepressedCopyWithImpl<$Res>
    extends _$AddGroupChatMessageEventCopyWithImpl<$Res, _$_AddMessagepressed>
    implements _$$_AddMessagepressedCopyWith<$Res> {
  __$$_AddMessagepressedCopyWithImpl(
      _$_AddMessagepressed _value, $Res Function(_$_AddMessagepressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_AddMessagepressed(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
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
  const _$_AddMessagepressed(this.message);

  @override
  final Message message;

  @override
  String toString() {
    return 'AddGroupChatMessageEvent.addMessagePressed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddMessagepressed &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

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
    required TResult Function(Message message) addMessagePressed,
  }) {
    return addMessagePressed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? messageDescriptionChanged,
    TResult? Function(Message message)? addMessagePressed,
  }) {
    return addMessagePressed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? messageDescriptionChanged,
    TResult Function(Message message)? addMessagePressed,
    required TResult orElse(),
  }) {
    if (addMessagePressed != null) {
      return addMessagePressed(message);
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

abstract class _AddMessagepressed implements AddGroupChatMessageEvent {
  const factory _AddMessagepressed(final Message message) =
      _$_AddMessagepressed;

  Message get message;
  @JsonKey(ignore: true)
  _$$_AddMessagepressedCopyWith<_$_AddMessagepressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddGroupChatMessageState {
  Message get message => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing =>
      throw _privateConstructorUsedError; // required String questionId,
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddGroupChatMessageStateCopyWith<AddGroupChatMessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddGroupChatMessageStateCopyWith<$Res> {
  factory $AddGroupChatMessageStateCopyWith(AddGroupChatMessageState value,
          $Res Function(AddGroupChatMessageState) then) =
      _$AddGroupChatMessageStateCopyWithImpl<$Res, AddGroupChatMessageState>;
  @useResult
  $Res call(
      {Message message,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$AddGroupChatMessageStateCopyWithImpl<$Res,
        $Val extends AddGroupChatMessageState>
    implements $AddGroupChatMessageStateCopyWith<$Res> {
  _$AddGroupChatMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
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
}

/// @nodoc
abstract class _$$_AddGroupChatMessageStateCopyWith<$Res>
    implements $AddGroupChatMessageStateCopyWith<$Res> {
  factory _$$_AddGroupChatMessageStateCopyWith(
          _$_AddGroupChatMessageState value,
          $Res Function(_$_AddGroupChatMessageState) then) =
      __$$_AddGroupChatMessageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Message message,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$_AddGroupChatMessageStateCopyWithImpl<$Res>
    extends _$AddGroupChatMessageStateCopyWithImpl<$Res,
        _$_AddGroupChatMessageState>
    implements _$$_AddGroupChatMessageStateCopyWith<$Res> {
  __$$_AddGroupChatMessageStateCopyWithImpl(_$_AddGroupChatMessageState _value,
      $Res Function(_$_AddGroupChatMessageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddGroupChatMessageState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
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
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<FirebaseFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AddGroupChatMessageState implements _AddGroupChatMessageState {
  const _$_AddGroupChatMessageState(
      {required this.message,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

  @override
  final Message message;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
// required String questionId,
  @override
  final Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'AddGroupChatMessageState(message: $message, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddGroupChatMessageState &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, showErrorMessages,
      isSaving, isEditing, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddGroupChatMessageStateCopyWith<_$_AddGroupChatMessageState>
      get copyWith => __$$_AddGroupChatMessageStateCopyWithImpl<
          _$_AddGroupChatMessageState>(this, _$identity);
}

abstract class _AddGroupChatMessageState implements AddGroupChatMessageState {
  const factory _AddGroupChatMessageState(
      {required final Message message,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<FirebaseFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AddGroupChatMessageState;

  @override
  Message get message;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override // required String questionId,
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddGroupChatMessageStateCopyWith<_$_AddGroupChatMessageState>
      get copyWith => throw _privateConstructorUsedError;
}
