// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Question {
  UniqueId get questionId => throw _privateConstructorUsedError;
  UniqueId get userId => throw _privateConstructorUsedError;
  QuestionDescription get questionDescription =>
      throw _privateConstructorUsedError;
  MediaUrl get mediaUrl => throw _privateConstructorUsedError;
  Time get askAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {UniqueId questionId,
      UniqueId userId,
      QuestionDescription questionDescription,
      MediaUrl mediaUrl,
      Time askAt});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? userId = null,
    Object? questionDescription = null,
    Object? mediaUrl = null,
    Object? askAt = null,
  }) {
    return _then(_value.copyWith(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      questionDescription: null == questionDescription
          ? _value.questionDescription
          : questionDescription // ignore: cast_nullable_to_non_nullable
              as QuestionDescription,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as MediaUrl,
      askAt: null == askAt
          ? _value.askAt
          : askAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$$_QuestionCopyWith(
          _$_Question value, $Res Function(_$_Question) then) =
      __$$_QuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId questionId,
      UniqueId userId,
      QuestionDescription questionDescription,
      MediaUrl mediaUrl,
      Time askAt});
}

/// @nodoc
class __$$_QuestionCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$_Question>
    implements _$$_QuestionCopyWith<$Res> {
  __$$_QuestionCopyWithImpl(
      _$_Question _value, $Res Function(_$_Question) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? userId = null,
    Object? questionDescription = null,
    Object? mediaUrl = null,
    Object? askAt = null,
  }) {
    return _then(_$_Question(
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      questionDescription: null == questionDescription
          ? _value.questionDescription
          : questionDescription // ignore: cast_nullable_to_non_nullable
              as QuestionDescription,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as MediaUrl,
      askAt: null == askAt
          ? _value.askAt
          : askAt // ignore: cast_nullable_to_non_nullable
              as Time,
    ));
  }
}

/// @nodoc

class _$_Question extends _Question {
  const _$_Question(
      {required this.questionId,
      required this.userId,
      required this.questionDescription,
      required this.mediaUrl,
      required this.askAt})
      : super._();

  @override
  final UniqueId questionId;
  @override
  final UniqueId userId;
  @override
  final QuestionDescription questionDescription;
  @override
  final MediaUrl mediaUrl;
  @override
  final Time askAt;

  @override
  String toString() {
    return 'Question(questionId: $questionId, userId: $userId, questionDescription: $questionDescription, mediaUrl: $mediaUrl, askAt: $askAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Question &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.questionDescription, questionDescription) ||
                other.questionDescription == questionDescription) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.askAt, askAt) || other.askAt == askAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, userId, questionDescription, mediaUrl, askAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      __$$_QuestionCopyWithImpl<_$_Question>(this, _$identity);
}

abstract class _Question extends Question {
  const factory _Question(
      {required final UniqueId questionId,
      required final UniqueId userId,
      required final QuestionDescription questionDescription,
      required final MediaUrl mediaUrl,
      required final Time askAt}) = _$_Question;
  const _Question._() : super._();

  @override
  UniqueId get questionId;
  @override
  UniqueId get userId;
  @override
  QuestionDescription get questionDescription;
  @override
  MediaUrl get mediaUrl;
  @override
  Time get askAt;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionCopyWith<_$_Question> get copyWith =>
      throw _privateConstructorUsedError;
}
