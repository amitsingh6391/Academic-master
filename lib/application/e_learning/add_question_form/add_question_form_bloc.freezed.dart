// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_question_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddQuestionFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Question> initialQuestionOption)
        initialized,
    required TResult Function(String description) questionDescriptionChanged,
    required TResult Function() pickImage,
    required TResult Function(File? file, Question question) addQuestionPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Question> initialQuestionOption)? initialized,
    TResult? Function(String description)? questionDescriptionChanged,
    TResult? Function()? pickImage,
    TResult? Function(File? file, Question question)? addQuestionPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Question> initialQuestionOption)? initialized,
    TResult Function(String description)? questionDescriptionChanged,
    TResult Function()? pickImage,
    TResult Function(File? file, Question question)? addQuestionPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_QuestionDescriptionChanged value)
        questionDescriptionChanged,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_AddQuestionpressed value) addQuestionPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_AddQuestionpressed value)? addQuestionPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_AddQuestionpressed value)? addQuestionPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddQuestionFormEventCopyWith<$Res> {
  factory $AddQuestionFormEventCopyWith(AddQuestionFormEvent value,
          $Res Function(AddQuestionFormEvent) then) =
      _$AddQuestionFormEventCopyWithImpl<$Res, AddQuestionFormEvent>;
}

/// @nodoc
class _$AddQuestionFormEventCopyWithImpl<$Res,
        $Val extends AddQuestionFormEvent>
    implements $AddQuestionFormEventCopyWith<$Res> {
  _$AddQuestionFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call({Option<Question> initialQuestionOption});
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$AddQuestionFormEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialQuestionOption = null,
  }) {
    return _then(_$_Initialized(
      null == initialQuestionOption
          ? _value.initialQuestionOption
          : initialQuestionOption // ignore: cast_nullable_to_non_nullable
              as Option<Question>,
    ));
  }
}

/// @nodoc

class _$_Initialized with DiagnosticableTreeMixin implements _Initialized {
  const _$_Initialized(this.initialQuestionOption);

  @override
  final Option<Question> initialQuestionOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddQuestionFormEvent.initialized(initialQuestionOption: $initialQuestionOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddQuestionFormEvent.initialized'))
      ..add(
          DiagnosticsProperty('initialQuestionOption', initialQuestionOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.initialQuestionOption, initialQuestionOption) ||
                other.initialQuestionOption == initialQuestionOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialQuestionOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Question> initialQuestionOption)
        initialized,
    required TResult Function(String description) questionDescriptionChanged,
    required TResult Function() pickImage,
    required TResult Function(File? file, Question question) addQuestionPressed,
  }) {
    return initialized(initialQuestionOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Question> initialQuestionOption)? initialized,
    TResult? Function(String description)? questionDescriptionChanged,
    TResult? Function()? pickImage,
    TResult? Function(File? file, Question question)? addQuestionPressed,
  }) {
    return initialized?.call(initialQuestionOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Question> initialQuestionOption)? initialized,
    TResult Function(String description)? questionDescriptionChanged,
    TResult Function()? pickImage,
    TResult Function(File? file, Question question)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(initialQuestionOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_QuestionDescriptionChanged value)
        questionDescriptionChanged,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_AddQuestionpressed value) addQuestionPressed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_AddQuestionpressed value)? addQuestionPressed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_AddQuestionpressed value)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AddQuestionFormEvent {
  const factory _Initialized(final Option<Question> initialQuestionOption) =
      _$_Initialized;

  Option<Question> get initialQuestionOption;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_QuestionDescriptionChangedCopyWith<$Res> {
  factory _$$_QuestionDescriptionChangedCopyWith(
          _$_QuestionDescriptionChanged value,
          $Res Function(_$_QuestionDescriptionChanged) then) =
      __$$_QuestionDescriptionChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$_QuestionDescriptionChangedCopyWithImpl<$Res>
    extends _$AddQuestionFormEventCopyWithImpl<$Res,
        _$_QuestionDescriptionChanged>
    implements _$$_QuestionDescriptionChangedCopyWith<$Res> {
  __$$_QuestionDescriptionChangedCopyWithImpl(
      _$_QuestionDescriptionChanged _value,
      $Res Function(_$_QuestionDescriptionChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$_QuestionDescriptionChanged(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_QuestionDescriptionChanged
    with DiagnosticableTreeMixin
    implements _QuestionDescriptionChanged {
  const _$_QuestionDescriptionChanged(this.description);

  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddQuestionFormEvent.questionDescriptionChanged(description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'AddQuestionFormEvent.questionDescriptionChanged'))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionDescriptionChanged &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionDescriptionChangedCopyWith<_$_QuestionDescriptionChanged>
      get copyWith => __$$_QuestionDescriptionChangedCopyWithImpl<
          _$_QuestionDescriptionChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Question> initialQuestionOption)
        initialized,
    required TResult Function(String description) questionDescriptionChanged,
    required TResult Function() pickImage,
    required TResult Function(File? file, Question question) addQuestionPressed,
  }) {
    return questionDescriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Question> initialQuestionOption)? initialized,
    TResult? Function(String description)? questionDescriptionChanged,
    TResult? Function()? pickImage,
    TResult? Function(File? file, Question question)? addQuestionPressed,
  }) {
    return questionDescriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Question> initialQuestionOption)? initialized,
    TResult Function(String description)? questionDescriptionChanged,
    TResult Function()? pickImage,
    TResult Function(File? file, Question question)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (questionDescriptionChanged != null) {
      return questionDescriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_QuestionDescriptionChanged value)
        questionDescriptionChanged,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_AddQuestionpressed value) addQuestionPressed,
  }) {
    return questionDescriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_AddQuestionpressed value)? addQuestionPressed,
  }) {
    return questionDescriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_AddQuestionpressed value)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (questionDescriptionChanged != null) {
      return questionDescriptionChanged(this);
    }
    return orElse();
  }
}

abstract class _QuestionDescriptionChanged implements AddQuestionFormEvent {
  const factory _QuestionDescriptionChanged(final String description) =
      _$_QuestionDescriptionChanged;

  String get description;
  @JsonKey(ignore: true)
  _$$_QuestionDescriptionChangedCopyWith<_$_QuestionDescriptionChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PickImageCopyWith<$Res> {
  factory _$$_PickImageCopyWith(
          _$_PickImage value, $Res Function(_$_PickImage) then) =
      __$$_PickImageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PickImageCopyWithImpl<$Res>
    extends _$AddQuestionFormEventCopyWithImpl<$Res, _$_PickImage>
    implements _$$_PickImageCopyWith<$Res> {
  __$$_PickImageCopyWithImpl(
      _$_PickImage _value, $Res Function(_$_PickImage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PickImage with DiagnosticableTreeMixin implements _PickImage {
  const _$_PickImage();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddQuestionFormEvent.pickImage()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'AddQuestionFormEvent.pickImage'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PickImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Question> initialQuestionOption)
        initialized,
    required TResult Function(String description) questionDescriptionChanged,
    required TResult Function() pickImage,
    required TResult Function(File? file, Question question) addQuestionPressed,
  }) {
    return pickImage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Question> initialQuestionOption)? initialized,
    TResult? Function(String description)? questionDescriptionChanged,
    TResult? Function()? pickImage,
    TResult? Function(File? file, Question question)? addQuestionPressed,
  }) {
    return pickImage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Question> initialQuestionOption)? initialized,
    TResult Function(String description)? questionDescriptionChanged,
    TResult Function()? pickImage,
    TResult Function(File? file, Question question)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_QuestionDescriptionChanged value)
        questionDescriptionChanged,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_AddQuestionpressed value) addQuestionPressed,
  }) {
    return pickImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_AddQuestionpressed value)? addQuestionPressed,
  }) {
    return pickImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_AddQuestionpressed value)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (pickImage != null) {
      return pickImage(this);
    }
    return orElse();
  }
}

abstract class _PickImage implements AddQuestionFormEvent {
  const factory _PickImage() = _$_PickImage;
}

/// @nodoc
abstract class _$$_AddQuestionpressedCopyWith<$Res> {
  factory _$$_AddQuestionpressedCopyWith(_$_AddQuestionpressed value,
          $Res Function(_$_AddQuestionpressed) then) =
      __$$_AddQuestionpressedCopyWithImpl<$Res>;
  @useResult
  $Res call({File? file, Question question});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$_AddQuestionpressedCopyWithImpl<$Res>
    extends _$AddQuestionFormEventCopyWithImpl<$Res, _$_AddQuestionpressed>
    implements _$$_AddQuestionpressedCopyWith<$Res> {
  __$$_AddQuestionpressedCopyWithImpl(
      _$_AddQuestionpressed _value, $Res Function(_$_AddQuestionpressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = freezed,
    Object? question = null,
  }) {
    return _then(_$_AddQuestionpressed(
      freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value));
    });
  }
}

/// @nodoc

class _$_AddQuestionpressed
    with DiagnosticableTreeMixin
    implements _AddQuestionpressed {
  const _$_AddQuestionpressed(this.file, this.question);

  @override
  final File? file;
  @override
  final Question question;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddQuestionFormEvent.addQuestionPressed(file: $file, question: $question)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'AddQuestionFormEvent.addQuestionPressed'))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('question', question));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddQuestionpressed &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddQuestionpressedCopyWith<_$_AddQuestionpressed> get copyWith =>
      __$$_AddQuestionpressedCopyWithImpl<_$_AddQuestionpressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Question> initialQuestionOption)
        initialized,
    required TResult Function(String description) questionDescriptionChanged,
    required TResult Function() pickImage,
    required TResult Function(File? file, Question question) addQuestionPressed,
  }) {
    return addQuestionPressed(file, question);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Question> initialQuestionOption)? initialized,
    TResult? Function(String description)? questionDescriptionChanged,
    TResult? Function()? pickImage,
    TResult? Function(File? file, Question question)? addQuestionPressed,
  }) {
    return addQuestionPressed?.call(file, question);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Question> initialQuestionOption)? initialized,
    TResult Function(String description)? questionDescriptionChanged,
    TResult Function()? pickImage,
    TResult Function(File? file, Question question)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (addQuestionPressed != null) {
      return addQuestionPressed(file, question);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_QuestionDescriptionChanged value)
        questionDescriptionChanged,
    required TResult Function(_PickImage value) pickImage,
    required TResult Function(_AddQuestionpressed value) addQuestionPressed,
  }) {
    return addQuestionPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult? Function(_PickImage value)? pickImage,
    TResult? Function(_AddQuestionpressed value)? addQuestionPressed,
  }) {
    return addQuestionPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_QuestionDescriptionChanged value)?
        questionDescriptionChanged,
    TResult Function(_PickImage value)? pickImage,
    TResult Function(_AddQuestionpressed value)? addQuestionPressed,
    required TResult orElse(),
  }) {
    if (addQuestionPressed != null) {
      return addQuestionPressed(this);
    }
    return orElse();
  }
}

abstract class _AddQuestionpressed implements AddQuestionFormEvent {
  const factory _AddQuestionpressed(final File? file, final Question question) =
      _$_AddQuestionpressed;

  File? get file;
  Question get question;
  @JsonKey(ignore: true)
  _$$_AddQuestionpressedCopyWith<_$_AddQuestionpressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddQuestionFormState {
  Question get question => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddQuestionFormStateCopyWith<AddQuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddQuestionFormStateCopyWith<$Res> {
  factory $AddQuestionFormStateCopyWith(AddQuestionFormState value,
          $Res Function(AddQuestionFormState) then) =
      _$AddQuestionFormStateCopyWithImpl<$Res, AddQuestionFormState>;
  @useResult
  $Res call(
      {Question question,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class _$AddQuestionFormStateCopyWithImpl<$Res,
        $Val extends AddQuestionFormState>
    implements $AddQuestionFormStateCopyWith<$Res> {
  _$AddQuestionFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
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
  $QuestionCopyWith<$Res> get question {
    return $QuestionCopyWith<$Res>(_value.question, (value) {
      return _then(_value.copyWith(question: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddQuestionFormStateCopyWith<$Res>
    implements $AddQuestionFormStateCopyWith<$Res> {
  factory _$$_AddQuestionFormStateCopyWith(_$_AddQuestionFormState value,
          $Res Function(_$_AddQuestionFormState) then) =
      __$$_AddQuestionFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Question question,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $QuestionCopyWith<$Res> get question;
}

/// @nodoc
class __$$_AddQuestionFormStateCopyWithImpl<$Res>
    extends _$AddQuestionFormStateCopyWithImpl<$Res, _$_AddQuestionFormState>
    implements _$$_AddQuestionFormStateCopyWith<$Res> {
  __$$_AddQuestionFormStateCopyWithImpl(_$_AddQuestionFormState _value,
      $Res Function(_$_AddQuestionFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_AddQuestionFormState(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as Question,
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

class _$_AddQuestionFormState
    with DiagnosticableTreeMixin
    implements _AddQuestionFormState {
  const _$_AddQuestionFormState(
      {required this.question,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

  @override
  final Question question;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
  @override
  final Option<Either<FirebaseFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddQuestionFormState(question: $question, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddQuestionFormState'))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('isSaving', isSaving))
      ..add(DiagnosticsProperty('isEditing', isEditing))
      ..add(DiagnosticsProperty(
          'saveFailureOrSuccessOption', saveFailureOrSuccessOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddQuestionFormState &&
            (identical(other.question, question) ||
                other.question == question) &&
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
  int get hashCode => Object.hash(runtimeType, question, showErrorMessages,
      isSaving, isEditing, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddQuestionFormStateCopyWith<_$_AddQuestionFormState> get copyWith =>
      __$$_AddQuestionFormStateCopyWithImpl<_$_AddQuestionFormState>(
          this, _$identity);
}

abstract class _AddQuestionFormState implements AddQuestionFormState {
  const factory _AddQuestionFormState(
      {required final Question question,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<FirebaseFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AddQuestionFormState;

  @override
  Question get question;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  Option<Either<FirebaseFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AddQuestionFormStateCopyWith<_$_AddQuestionFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
