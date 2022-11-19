// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_user_comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddUserCommentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) commentDescriptionChanged,
    required TResult Function(UserComment comment, String questionId)
        addCommentPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? commentDescriptionChanged,
    TResult? Function(UserComment comment, String questionId)?
        addCommentPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? commentDescriptionChanged,
    TResult Function(UserComment comment, String questionId)? addCommentPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommentDescriptionChanged value)
        commentDescriptionChanged,
    required TResult Function(_AddCommentpressed value) addCommentPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult? Function(_AddCommentpressed value)? addCommentPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult Function(_AddCommentpressed value)? addCommentPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserCommentEventCopyWith<$Res> {
  factory $AddUserCommentEventCopyWith(
          AddUserCommentEvent value, $Res Function(AddUserCommentEvent) then) =
      _$AddUserCommentEventCopyWithImpl<$Res, AddUserCommentEvent>;
}

/// @nodoc
class _$AddUserCommentEventCopyWithImpl<$Res, $Val extends AddUserCommentEvent>
    implements $AddUserCommentEventCopyWith<$Res> {
  _$AddUserCommentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CommentDescriptionChangedCopyWith<$Res> {
  factory _$$_CommentDescriptionChangedCopyWith(
          _$_CommentDescriptionChanged value,
          $Res Function(_$_CommentDescriptionChanged) then) =
      __$$_CommentDescriptionChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$_CommentDescriptionChangedCopyWithImpl<$Res>
    extends _$AddUserCommentEventCopyWithImpl<$Res,
        _$_CommentDescriptionChanged>
    implements _$$_CommentDescriptionChangedCopyWith<$Res> {
  __$$_CommentDescriptionChangedCopyWithImpl(
      _$_CommentDescriptionChanged _value,
      $Res Function(_$_CommentDescriptionChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$_CommentDescriptionChanged(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommentDescriptionChanged implements _CommentDescriptionChanged {
  const _$_CommentDescriptionChanged(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'AddUserCommentEvent.commentDescriptionChanged(description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentDescriptionChanged &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentDescriptionChangedCopyWith<_$_CommentDescriptionChanged>
      get copyWith => __$$_CommentDescriptionChangedCopyWithImpl<
          _$_CommentDescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) commentDescriptionChanged,
    required TResult Function(UserComment comment, String questionId)
        addCommentPressed,
  }) {
    return commentDescriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? commentDescriptionChanged,
    TResult? Function(UserComment comment, String questionId)?
        addCommentPressed,
  }) {
    return commentDescriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? commentDescriptionChanged,
    TResult Function(UserComment comment, String questionId)? addCommentPressed,
    required TResult orElse(),
  }) {
    if (commentDescriptionChanged != null) {
      return commentDescriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommentDescriptionChanged value)
        commentDescriptionChanged,
    required TResult Function(_AddCommentpressed value) addCommentPressed,
  }) {
    return commentDescriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult? Function(_AddCommentpressed value)? addCommentPressed,
  }) {
    return commentDescriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult Function(_AddCommentpressed value)? addCommentPressed,
    required TResult orElse(),
  }) {
    if (commentDescriptionChanged != null) {
      return commentDescriptionChanged(this);
    }
    return orElse();
  }
}

abstract class _CommentDescriptionChanged implements AddUserCommentEvent {
  const factory _CommentDescriptionChanged(final String description) =
      _$_CommentDescriptionChanged;

  String get description;
  @JsonKey(ignore: true)
  _$$_CommentDescriptionChangedCopyWith<_$_CommentDescriptionChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddCommentpressedCopyWith<$Res> {
  factory _$$_AddCommentpressedCopyWith(_$_AddCommentpressed value,
          $Res Function(_$_AddCommentpressed) then) =
      __$$_AddCommentpressedCopyWithImpl<$Res>;
  @useResult
  $Res call({UserComment comment, String questionId});

  $UserCommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$_AddCommentpressedCopyWithImpl<$Res>
    extends _$AddUserCommentEventCopyWithImpl<$Res, _$_AddCommentpressed>
    implements _$$_AddCommentpressedCopyWith<$Res> {
  __$$_AddCommentpressedCopyWithImpl(
      _$_AddCommentpressed _value, $Res Function(_$_AddCommentpressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? questionId = null,
  }) {
    return _then(_$_AddCommentpressed(
      null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as UserComment,
      null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCommentCopyWith<$Res> get comment {
    return $UserCommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value));
    });
  }
}

/// @nodoc

class _$_AddCommentpressed implements _AddCommentpressed {
  const _$_AddCommentpressed(this.comment, this.questionId);

  @override
  final UserComment comment;
  @override
  final String questionId;

  @override
  String toString() {
    return 'AddUserCommentEvent.addCommentPressed(comment: $comment, questionId: $questionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddCommentpressed &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comment, questionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddCommentpressedCopyWith<_$_AddCommentpressed> get copyWith =>
      __$$_AddCommentpressedCopyWithImpl<_$_AddCommentpressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description) commentDescriptionChanged,
    required TResult Function(UserComment comment, String questionId)
        addCommentPressed,
  }) {
    return addCommentPressed(comment, questionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String description)? commentDescriptionChanged,
    TResult? Function(UserComment comment, String questionId)?
        addCommentPressed,
  }) {
    return addCommentPressed?.call(comment, questionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description)? commentDescriptionChanged,
    TResult Function(UserComment comment, String questionId)? addCommentPressed,
    required TResult orElse(),
  }) {
    if (addCommentPressed != null) {
      return addCommentPressed(comment, questionId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CommentDescriptionChanged value)
        commentDescriptionChanged,
    required TResult Function(_AddCommentpressed value) addCommentPressed,
  }) {
    return addCommentPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult? Function(_AddCommentpressed value)? addCommentPressed,
  }) {
    return addCommentPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CommentDescriptionChanged value)?
        commentDescriptionChanged,
    TResult Function(_AddCommentpressed value)? addCommentPressed,
    required TResult orElse(),
  }) {
    if (addCommentPressed != null) {
      return addCommentPressed(this);
    }
    return orElse();
  }
}

abstract class _AddCommentpressed implements AddUserCommentEvent {
  const factory _AddCommentpressed(
          final UserComment comment, final String questionId) =
      _$_AddCommentpressed;

  UserComment get comment;
  String get questionId;
  @JsonKey(ignore: true)
  _$$_AddCommentpressedCopyWith<_$_AddCommentpressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddUserCommentState {
  UserComment get comment => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing =>
      throw _privateConstructorUsedError; // required String questionId,
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddUserCommentStateCopyWith<AddUserCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddUserCommentStateCopyWith<$Res> {
  factory $AddUserCommentStateCopyWith(
          AddUserCommentState value, $Res Function(AddUserCommentState) then) =
      _$AddUserCommentStateCopyWithImpl<$Res, AddUserCommentState>;
  @useResult
  $Res call(
      {UserComment comment,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  $UserCommentCopyWith<$Res> get comment;
}

/// @nodoc
class _$AddUserCommentStateCopyWithImpl<$Res, $Val extends AddUserCommentState>
    implements $AddUserCommentStateCopyWith<$Res> {
  _$AddUserCommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as UserComment,
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
  $UserCommentCopyWith<$Res> get comment {
    return $UserCommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddUserCommentStateCopyWith<$Res>
    implements $AddUserCommentStateCopyWith<$Res> {
  factory _$$_AddUserCommentStateCopyWith(_$_AddUserCommentState value,
          $Res Function(_$_AddUserCommentState) then) =
      __$$_AddUserCommentStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserComment comment,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $UserCommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$_AddUserCommentStateCopyWithImpl<$Res>
    extends _$AddUserCommentStateCopyWithImpl<$Res, _$_AddUserCommentState>
    implements _$$_AddUserCommentStateCopyWith<$Res> {
  __$$_AddUserCommentStateCopyWithImpl(_$_AddUserCommentState _value,
      $Res Function(_$_AddUserCommentState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddUserCommentState(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as UserComment,
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

class _$_AddUserCommentState implements _AddUserCommentState {
  const _$_AddUserCommentState(
      {required this.comment,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

  @override
  final UserComment comment;
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
    return 'AddUserCommentState(comment: $comment, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddUserCommentState &&
            (identical(other.comment, comment) || other.comment == comment) &&
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
  int get hashCode => Object.hash(runtimeType, comment, showErrorMessages,
      isSaving, isEditing, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddUserCommentStateCopyWith<_$_AddUserCommentState> get copyWith =>
      __$$_AddUserCommentStateCopyWithImpl<_$_AddUserCommentState>(
          this, _$identity);
}

abstract class _AddUserCommentState implements AddUserCommentState {
  const factory _AddUserCommentState(
      {required final UserComment comment,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<FirebaseFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AddUserCommentState;

  @override
  UserComment get comment;
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
  _$$_AddUserCommentStateCopyWith<_$_AddUserCommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
