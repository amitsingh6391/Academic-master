// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatroom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Chatroom {
  UniqueId get chatroomId => throw _privateConstructorUsedError;
  UniqueId get partnerId => throw _privateConstructorUsedError;
  CommentDescription get chatroomDescription =>
      throw _privateConstructorUsedError;
  Time get chatroomAt => throw _privateConstructorUsedError;
  List<String> get usersId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatroomCopyWith<Chatroom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatroomCopyWith<$Res> {
  factory $ChatroomCopyWith(Chatroom value, $Res Function(Chatroom) then) =
      _$ChatroomCopyWithImpl<$Res, Chatroom>;
  @useResult
  $Res call(
      {UniqueId chatroomId,
      UniqueId partnerId,
      CommentDescription chatroomDescription,
      Time chatroomAt,
      List<String> usersId});
}

/// @nodoc
class _$ChatroomCopyWithImpl<$Res, $Val extends Chatroom>
    implements $ChatroomCopyWith<$Res> {
  _$ChatroomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatroomId = null,
    Object? partnerId = null,
    Object? chatroomDescription = null,
    Object? chatroomAt = null,
    Object? usersId = null,
  }) {
    return _then(_value.copyWith(
      chatroomId: null == chatroomId
          ? _value.chatroomId
          : chatroomId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      chatroomDescription: null == chatroomDescription
          ? _value.chatroomDescription
          : chatroomDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      chatroomAt: null == chatroomAt
          ? _value.chatroomAt
          : chatroomAt // ignore: cast_nullable_to_non_nullable
              as Time,
      usersId: null == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatroomCopyWith<$Res> implements $ChatroomCopyWith<$Res> {
  factory _$$_ChatroomCopyWith(
          _$_Chatroom value, $Res Function(_$_Chatroom) then) =
      __$$_ChatroomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId chatroomId,
      UniqueId partnerId,
      CommentDescription chatroomDescription,
      Time chatroomAt,
      List<String> usersId});
}

/// @nodoc
class __$$_ChatroomCopyWithImpl<$Res>
    extends _$ChatroomCopyWithImpl<$Res, _$_Chatroom>
    implements _$$_ChatroomCopyWith<$Res> {
  __$$_ChatroomCopyWithImpl(
      _$_Chatroom _value, $Res Function(_$_Chatroom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatroomId = null,
    Object? partnerId = null,
    Object? chatroomDescription = null,
    Object? chatroomAt = null,
    Object? usersId = null,
  }) {
    return _then(_$_Chatroom(
      chatroomId: null == chatroomId
          ? _value.chatroomId
          : chatroomId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      chatroomDescription: null == chatroomDescription
          ? _value.chatroomDescription
          : chatroomDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      chatroomAt: null == chatroomAt
          ? _value.chatroomAt
          : chatroomAt // ignore: cast_nullable_to_non_nullable
              as Time,
      usersId: null == usersId
          ? _value._usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Chatroom extends _Chatroom {
  const _$_Chatroom(
      {required this.chatroomId,
      required this.partnerId,
      required this.chatroomDescription,
      required this.chatroomAt,
      required final List<String> usersId})
      : _usersId = usersId,
        super._();

  @override
  final UniqueId chatroomId;
  @override
  final UniqueId partnerId;
  @override
  final CommentDescription chatroomDescription;
  @override
  final Time chatroomAt;
  final List<String> _usersId;
  @override
  List<String> get usersId {
    if (_usersId is EqualUnmodifiableListView) return _usersId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersId);
  }

  @override
  String toString() {
    return 'Chatroom(chatroomId: $chatroomId, partnerId: $partnerId, chatroomDescription: $chatroomDescription, chatroomAt: $chatroomAt, usersId: $usersId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chatroom &&
            (identical(other.chatroomId, chatroomId) ||
                other.chatroomId == chatroomId) &&
            (identical(other.partnerId, partnerId) ||
                other.partnerId == partnerId) &&
            (identical(other.chatroomDescription, chatroomDescription) ||
                other.chatroomDescription == chatroomDescription) &&
            (identical(other.chatroomAt, chatroomAt) ||
                other.chatroomAt == chatroomAt) &&
            const DeepCollectionEquality().equals(other._usersId, _usersId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatroomId,
      partnerId,
      chatroomDescription,
      chatroomAt,
      const DeepCollectionEquality().hash(_usersId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatroomCopyWith<_$_Chatroom> get copyWith =>
      __$$_ChatroomCopyWithImpl<_$_Chatroom>(this, _$identity);
}

abstract class _Chatroom extends Chatroom {
  const factory _Chatroom(
      {required final UniqueId chatroomId,
      required final UniqueId partnerId,
      required final CommentDescription chatroomDescription,
      required final Time chatroomAt,
      required final List<String> usersId}) = _$_Chatroom;
  const _Chatroom._() : super._();

  @override
  UniqueId get chatroomId;
  @override
  UniqueId get partnerId;
  @override
  CommentDescription get chatroomDescription;
  @override
  Time get chatroomAt;
  @override
  List<String> get usersId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatroomCopyWith<_$_Chatroom> get copyWith =>
      throw _privateConstructorUsedError;
}
