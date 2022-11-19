// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Message {
  UniqueId get messageId => throw _privateConstructorUsedError;
  UniqueId get userId => throw _privateConstructorUsedError;
  CommentDescription get messageDescription =>
      throw _privateConstructorUsedError;
  Time get messageAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {UniqueId messageId,
      UniqueId userId,
      CommentDescription messageDescription,
      Time messageAt});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? userId = null,
    Object? messageDescription = null,
    Object? messageAt = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      messageDescription: null == messageDescription
          ? _value.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      messageAt: null == messageAt
          ? _value.messageAt
          : messageAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$_MessageCopyWith(
          _$_Message value, $Res Function(_$_Message) then) =
      __$$_MessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId messageId,
      UniqueId userId,
      CommentDescription messageDescription,
      Time messageAt});
}

/// @nodoc
class __$$_MessageCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$_Message>
    implements _$$_MessageCopyWith<$Res> {
  __$$_MessageCopyWithImpl(_$_Message _value, $Res Function(_$_Message) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? userId = null,
    Object? messageDescription = null,
    Object? messageAt = null,
  }) {
    return _then(_$_Message(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      messageDescription: null == messageDescription
          ? _value.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      messageAt: null == messageAt
          ? _value.messageAt
          : messageAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ));
  }
}

/// @nodoc

class _$_Message extends _Message {
  const _$_Message(
      {required this.messageId,
      required this.userId,
      required this.messageDescription,
      required this.messageAt})
      : super._();

  @override
  final UniqueId messageId;
  @override
  final UniqueId userId;
  @override
  final CommentDescription messageDescription;
  @override
  final Time messageAt;

  @override
  String toString() {
    return 'Message(messageId: $messageId, userId: $userId, messageDescription: $messageDescription, messageAt: $messageAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Message &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.messageDescription, messageDescription) ||
                other.messageDescription == messageDescription) &&
            (identical(other.messageAt, messageAt) ||
                other.messageAt == messageAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, messageId, userId, messageDescription, messageAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      __$$_MessageCopyWithImpl<_$_Message>(this, _$identity);
}

abstract class _Message extends Message {
  const factory _Message(
      {required final UniqueId messageId,
      required final UniqueId userId,
      required final CommentDescription messageDescription,
      required final Time messageAt}) = _$_Message;
  const _Message._() : super._();

  @override
  UniqueId get messageId;
  @override
  UniqueId get userId;
  @override
  CommentDescription get messageDescription;
  @override
  Time get messageAt;
  @override
  @JsonKey(ignore: true)
  _$$_MessageCopyWith<_$_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
