// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserComment {
  UniqueId get commentId => throw _privateConstructorUsedError;
  UniqueId get userId => throw _privateConstructorUsedError;
  CommentDescription get commentDescription =>
      throw _privateConstructorUsedError;
  Time get commentAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCommentCopyWith<UserComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCommentCopyWith<$Res> {
  factory $UserCommentCopyWith(
          UserComment value, $Res Function(UserComment) then) =
      _$UserCommentCopyWithImpl<$Res, UserComment>;
  @useResult
  $Res call(
      {UniqueId commentId,
      UniqueId userId,
      CommentDescription commentDescription,
      Time commentAt});
}

/// @nodoc
class _$UserCommentCopyWithImpl<$Res, $Val extends UserComment>
    implements $UserCommentCopyWith<$Res> {
  _$UserCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? userId = null,
    Object? commentDescription = null,
    Object? commentAt = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      commentDescription: null == commentDescription
          ? _value.commentDescription
          : commentDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      commentAt: null == commentAt
          ? _value.commentAt
          : commentAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCommentCopyWith<$Res>
    implements $UserCommentCopyWith<$Res> {
  factory _$$_UserCommentCopyWith(
          _$_UserComment value, $Res Function(_$_UserComment) then) =
      __$$_UserCommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId commentId,
      UniqueId userId,
      CommentDescription commentDescription,
      Time commentAt});
}

/// @nodoc
class __$$_UserCommentCopyWithImpl<$Res>
    extends _$UserCommentCopyWithImpl<$Res, _$_UserComment>
    implements _$$_UserCommentCopyWith<$Res> {
  __$$_UserCommentCopyWithImpl(
      _$_UserComment _value, $Res Function(_$_UserComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? userId = null,
    Object? commentDescription = null,
    Object? commentAt = null,
  }) {
    return _then(_$_UserComment(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      commentDescription: null == commentDescription
          ? _value.commentDescription
          : commentDescription // ignore: cast_nullable_to_non_nullable
              as CommentDescription,
      commentAt: null == commentAt
          ? _value.commentAt
          : commentAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ));
  }
}

/// @nodoc

class _$_UserComment extends _UserComment {
  const _$_UserComment(
      {required this.commentId,
      required this.userId,
      required this.commentDescription,
      required this.commentAt})
      : super._();

  @override
  final UniqueId commentId;
  @override
  final UniqueId userId;
  @override
  final CommentDescription commentDescription;
  @override
  final Time commentAt;

  @override
  String toString() {
    return 'UserComment(commentId: $commentId, userId: $userId, commentDescription: $commentDescription, commentAt: $commentAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserComment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.commentDescription, commentDescription) ||
                other.commentDescription == commentDescription) &&
            (identical(other.commentAt, commentAt) ||
                other.commentAt == commentAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, commentId, userId, commentDescription, commentAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCommentCopyWith<_$_UserComment> get copyWith =>
      __$$_UserCommentCopyWithImpl<_$_UserComment>(this, _$identity);
}

abstract class _UserComment extends UserComment {
  const factory _UserComment(
      {required final UniqueId commentId,
      required final UniqueId userId,
      required final CommentDescription commentDescription,
      required final Time commentAt}) = _$_UserComment;
  const _UserComment._() : super._();

  @override
  UniqueId get commentId;
  @override
  UniqueId get userId;
  @override
  CommentDescription get commentDescription;
  @override
  Time get commentAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCommentCopyWith<_$_UserComment> get copyWith =>
      throw _privateConstructorUsedError;
}
