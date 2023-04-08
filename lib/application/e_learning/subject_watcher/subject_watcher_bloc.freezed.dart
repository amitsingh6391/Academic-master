// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubjectWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllSubject,
    required TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)
        subjectsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllSubject,
    TResult? Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllSubject,
    TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllSubject value) watchAllSubject,
    required TResult Function(_SubjectsReceived value) subjectsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllSubject value)? watchAllSubject,
    TResult? Function(_SubjectsReceived value)? subjectsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllSubject value)? watchAllSubject,
    TResult Function(_SubjectsReceived value)? subjectsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectWatcherEventCopyWith<$Res> {
  factory $SubjectWatcherEventCopyWith(
          SubjectWatcherEvent value, $Res Function(SubjectWatcherEvent) then) =
      _$SubjectWatcherEventCopyWithImpl<$Res, SubjectWatcherEvent>;
}

/// @nodoc
class _$SubjectWatcherEventCopyWithImpl<$Res, $Val extends SubjectWatcherEvent>
    implements $SubjectWatcherEventCopyWith<$Res> {
  _$SubjectWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_WatchAllSubjectCopyWith<$Res> {
  factory _$$_WatchAllSubjectCopyWith(
          _$_WatchAllSubject value, $Res Function(_$_WatchAllSubject) then) =
      __$$_WatchAllSubjectCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_WatchAllSubjectCopyWithImpl<$Res>
    extends _$SubjectWatcherEventCopyWithImpl<$Res, _$_WatchAllSubject>
    implements _$$_WatchAllSubjectCopyWith<$Res> {
  __$$_WatchAllSubjectCopyWithImpl(
      _$_WatchAllSubject _value, $Res Function(_$_WatchAllSubject) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_WatchAllSubject implements _WatchAllSubject {
  const _$_WatchAllSubject();

  @override
  String toString() {
    return 'SubjectWatcherEvent.watchAllSubject()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_WatchAllSubject);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllSubject,
    required TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)
        subjectsReceived,
  }) {
    return watchAllSubject();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllSubject,
    TResult? Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
  }) {
    return watchAllSubject?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllSubject,
    TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
    required TResult orElse(),
  }) {
    if (watchAllSubject != null) {
      return watchAllSubject();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllSubject value) watchAllSubject,
    required TResult Function(_SubjectsReceived value) subjectsReceived,
  }) {
    return watchAllSubject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllSubject value)? watchAllSubject,
    TResult? Function(_SubjectsReceived value)? subjectsReceived,
  }) {
    return watchAllSubject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllSubject value)? watchAllSubject,
    TResult Function(_SubjectsReceived value)? subjectsReceived,
    required TResult orElse(),
  }) {
    if (watchAllSubject != null) {
      return watchAllSubject(this);
    }
    return orElse();
  }
}

abstract class _WatchAllSubject implements SubjectWatcherEvent {
  const factory _WatchAllSubject() = _$_WatchAllSubject;
}

/// @nodoc
abstract class _$$_SubjectsReceivedCopyWith<$Res> {
  factory _$$_SubjectsReceivedCopyWith(
          _$_SubjectsReceived value, $Res Function(_$_SubjectsReceived) then) =
      __$$_SubjectsReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<FirebaseFailure, KtList<Subject>> failureOrSubjects});
}

/// @nodoc
class __$$_SubjectsReceivedCopyWithImpl<$Res>
    extends _$SubjectWatcherEventCopyWithImpl<$Res, _$_SubjectsReceived>
    implements _$$_SubjectsReceivedCopyWith<$Res> {
  __$$_SubjectsReceivedCopyWithImpl(
      _$_SubjectsReceived _value, $Res Function(_$_SubjectsReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrSubjects = null,
  }) {
    return _then(_$_SubjectsReceived(
      null == failureOrSubjects
          ? _value.failureOrSubjects
          : failureOrSubjects // ignore: cast_nullable_to_non_nullable
              as Either<FirebaseFailure, KtList<Subject>>,
    ));
  }
}

/// @nodoc

class _$_SubjectsReceived implements _SubjectsReceived {
  const _$_SubjectsReceived(this.failureOrSubjects);

  @override
  final Either<FirebaseFailure, KtList<Subject>> failureOrSubjects;

  @override
  String toString() {
    return 'SubjectWatcherEvent.subjectsReceived(failureOrSubjects: $failureOrSubjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectsReceived &&
            (identical(other.failureOrSubjects, failureOrSubjects) ||
                other.failureOrSubjects == failureOrSubjects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrSubjects);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectsReceivedCopyWith<_$_SubjectsReceived> get copyWith =>
      __$$_SubjectsReceivedCopyWithImpl<_$_SubjectsReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllSubject,
    required TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)
        subjectsReceived,
  }) {
    return subjectsReceived(failureOrSubjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAllSubject,
    TResult? Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
  }) {
    return subjectsReceived?.call(failureOrSubjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllSubject,
    TResult Function(
            Either<FirebaseFailure, KtList<Subject>> failureOrSubjects)?
        subjectsReceived,
    required TResult orElse(),
  }) {
    if (subjectsReceived != null) {
      return subjectsReceived(failureOrSubjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WatchAllSubject value) watchAllSubject,
    required TResult Function(_SubjectsReceived value) subjectsReceived,
  }) {
    return subjectsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WatchAllSubject value)? watchAllSubject,
    TResult? Function(_SubjectsReceived value)? subjectsReceived,
  }) {
    return subjectsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WatchAllSubject value)? watchAllSubject,
    TResult Function(_SubjectsReceived value)? subjectsReceived,
    required TResult orElse(),
  }) {
    if (subjectsReceived != null) {
      return subjectsReceived(this);
    }
    return orElse();
  }
}

abstract class _SubjectsReceived implements SubjectWatcherEvent {
  const factory _SubjectsReceived(
          final Either<FirebaseFailure, KtList<Subject>> failureOrSubjects) =
      _$_SubjectsReceived;

  Either<FirebaseFailure, KtList<Subject>> get failureOrSubjects;
  @JsonKey(ignore: true)
  _$$_SubjectsReceivedCopyWith<_$_SubjectsReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SubjectWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<Subject> subjects) loadSuccess,
    required TResult Function(FirebaseFailure firbaseFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<Subject> subjects)? loadSuccess,
    TResult? Function(FirebaseFailure firbaseFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<Subject> subjects)? loadSuccess,
    TResult Function(FirebaseFailure firbaseFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectWatcherStateCopyWith<$Res> {
  factory $SubjectWatcherStateCopyWith(
          SubjectWatcherState value, $Res Function(SubjectWatcherState) then) =
      _$SubjectWatcherStateCopyWithImpl<$Res, SubjectWatcherState>;
}

/// @nodoc
class _$SubjectWatcherStateCopyWithImpl<$Res, $Val extends SubjectWatcherState>
    implements $SubjectWatcherStateCopyWith<$Res> {
  _$SubjectWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SubjectWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SubjectWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<Subject> subjects) loadSuccess,
    required TResult Function(FirebaseFailure firbaseFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<Subject> subjects)? loadSuccess,
    TResult? Function(FirebaseFailure firbaseFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<Subject> subjects)? loadSuccess,
    TResult Function(FirebaseFailure firbaseFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SubjectWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$SubjectWatcherStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'SubjectWatcherState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<Subject> subjects) loadSuccess,
    required TResult Function(FirebaseFailure firbaseFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<Subject> subjects)? loadSuccess,
    TResult? Function(FirebaseFailure firbaseFailure)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<Subject> subjects)? loadSuccess,
    TResult Function(FirebaseFailure firbaseFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements SubjectWatcherState {
  const factory _LoadInProgress() = _$_LoadInProgress;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<Subject> subjects});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$SubjectWatcherStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = null,
  }) {
    return _then(_$_LoadSuccess(
      null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as KtList<Subject>,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.subjects);

  @override
  final KtList<Subject> subjects;

  @override
  String toString() {
    return 'SubjectWatcherState.loadSuccess(subjects: $subjects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.subjects, subjects) ||
                other.subjects == subjects));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subjects);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<Subject> subjects) loadSuccess,
    required TResult Function(FirebaseFailure firbaseFailure) loadFailure,
  }) {
    return loadSuccess(subjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<Subject> subjects)? loadSuccess,
    TResult? Function(FirebaseFailure firbaseFailure)? loadFailure,
  }) {
    return loadSuccess?.call(subjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<Subject> subjects)? loadSuccess,
    TResult Function(FirebaseFailure firbaseFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(subjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements SubjectWatcherState {
  const factory _LoadSuccess(final KtList<Subject> subjects) = _$_LoadSuccess;

  KtList<Subject> get subjects;
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<$Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure value, $Res Function(_$_LoadFailure) then) =
      __$$_LoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseFailure firbaseFailure});

  $FirebaseFailureCopyWith<$Res> get firbaseFailure;
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<$Res>
    extends _$SubjectWatcherStateCopyWithImpl<$Res, _$_LoadFailure>
    implements _$$_LoadFailureCopyWith<$Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure _value, $Res Function(_$_LoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firbaseFailure = null,
  }) {
    return _then(_$_LoadFailure(
      null == firbaseFailure
          ? _value.firbaseFailure
          : firbaseFailure // ignore: cast_nullable_to_non_nullable
              as FirebaseFailure,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FirebaseFailureCopyWith<$Res> get firbaseFailure {
    return $FirebaseFailureCopyWith<$Res>(_value.firbaseFailure, (value) {
      return _then(_value.copyWith(firbaseFailure: value));
    });
  }
}

/// @nodoc

class _$_LoadFailure implements _LoadFailure {
  const _$_LoadFailure(this.firbaseFailure);

  @override
  final FirebaseFailure firbaseFailure;

  @override
  String toString() {
    return 'SubjectWatcherState.loadFailure(firbaseFailure: $firbaseFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure &&
            (identical(other.firbaseFailure, firbaseFailure) ||
                other.firbaseFailure == firbaseFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firbaseFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      __$$_LoadFailureCopyWithImpl<_$_LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(KtList<Subject> subjects) loadSuccess,
    required TResult Function(FirebaseFailure firbaseFailure) loadFailure,
  }) {
    return loadFailure(firbaseFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(KtList<Subject> subjects)? loadSuccess,
    TResult? Function(FirebaseFailure firbaseFailure)? loadFailure,
  }) {
    return loadFailure?.call(firbaseFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(KtList<Subject> subjects)? loadSuccess,
    TResult Function(FirebaseFailure firbaseFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(firbaseFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_LoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure implements SubjectWatcherState {
  const factory _LoadFailure(final FirebaseFailure firbaseFailure) =
      _$_LoadFailure;

  FirebaseFailure get firbaseFailure;
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<_$_LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
