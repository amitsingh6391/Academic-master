// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subject_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubjectDto _$SubjectDtoFromJson(Map<String, dynamic> json) {
  return _SubjectDto.fromJson(json);
}

/// @nodoc
mixin _$SubjectDto {
  @JsonKey(ignore: true)
  String get id => throw _privateConstructorUsedError;
  String get subjectIcon => throw _privateConstructorUsedError;
  List<SubjectMaterialDto> get studyMaterial =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectDtoCopyWith<SubjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectDtoCopyWith<$Res> {
  factory $SubjectDtoCopyWith(
          SubjectDto value, $Res Function(SubjectDto) then) =
      _$SubjectDtoCopyWithImpl<$Res, SubjectDto>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String id,
      String subjectIcon,
      List<SubjectMaterialDto> studyMaterial});
}

/// @nodoc
class _$SubjectDtoCopyWithImpl<$Res, $Val extends SubjectDto>
    implements $SubjectDtoCopyWith<$Res> {
  _$SubjectDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectIcon = null,
    Object? studyMaterial = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectIcon: null == subjectIcon
          ? _value.subjectIcon
          : subjectIcon // ignore: cast_nullable_to_non_nullable
              as String,
      studyMaterial: null == studyMaterial
          ? _value.studyMaterial
          : studyMaterial // ignore: cast_nullable_to_non_nullable
              as List<SubjectMaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectDtoCopyWith<$Res>
    implements $SubjectDtoCopyWith<$Res> {
  factory _$$_SubjectDtoCopyWith(
          _$_SubjectDto value, $Res Function(_$_SubjectDto) then) =
      __$$_SubjectDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) String id,
      String subjectIcon,
      List<SubjectMaterialDto> studyMaterial});
}

/// @nodoc
class __$$_SubjectDtoCopyWithImpl<$Res>
    extends _$SubjectDtoCopyWithImpl<$Res, _$_SubjectDto>
    implements _$$_SubjectDtoCopyWith<$Res> {
  __$$_SubjectDtoCopyWithImpl(
      _$_SubjectDto _value, $Res Function(_$_SubjectDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectIcon = null,
    Object? studyMaterial = null,
  }) {
    return _then(_$_SubjectDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectIcon: null == subjectIcon
          ? _value.subjectIcon
          : subjectIcon // ignore: cast_nullable_to_non_nullable
              as String,
      studyMaterial: null == studyMaterial
          ? _value._studyMaterial
          : studyMaterial // ignore: cast_nullable_to_non_nullable
              as List<SubjectMaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubjectDto extends _SubjectDto {
  const _$_SubjectDto(
      {@JsonKey(ignore: true) this.id = "studyMaterial",
      required this.subjectIcon,
      required final List<SubjectMaterialDto> studyMaterial})
      : _studyMaterial = studyMaterial,
        super._();

  factory _$_SubjectDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectDtoFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String subjectIcon;
  final List<SubjectMaterialDto> _studyMaterial;
  @override
  List<SubjectMaterialDto> get studyMaterial {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_studyMaterial);
  }

  @override
  String toString() {
    return 'SubjectDto(id: $id, subjectIcon: $subjectIcon, studyMaterial: $studyMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectIcon, subjectIcon) ||
                other.subjectIcon == subjectIcon) &&
            const DeepCollectionEquality()
                .equals(other._studyMaterial, _studyMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectIcon,
      const DeepCollectionEquality().hash(_studyMaterial));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectDtoCopyWith<_$_SubjectDto> get copyWith =>
      __$$_SubjectDtoCopyWithImpl<_$_SubjectDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectDtoToJson(
      this,
    );
  }
}

abstract class _SubjectDto extends SubjectDto {
  const factory _SubjectDto(
      {@JsonKey(ignore: true) final String id,
      required final String subjectIcon,
      required final List<SubjectMaterialDto> studyMaterial}) = _$_SubjectDto;
  const _SubjectDto._() : super._();

  factory _SubjectDto.fromJson(Map<String, dynamic> json) =
      _$_SubjectDto.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get subjectIcon;
  @override
  List<SubjectMaterialDto> get studyMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectDtoCopyWith<_$_SubjectDto> get copyWith =>
      throw _privateConstructorUsedError;
}

SubjectMaterialDto _$SubjectMaterialDtoFromJson(Map<String, dynamic> json) {
  return _SubjectMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$SubjectMaterialDto {
  String get id => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get subjectNote => throw _privateConstructorUsedError;
  String get subjectSyllabus => throw _privateConstructorUsedError;
  String get subjectIcon => throw _privateConstructorUsedError;
  String get subjectPaper => throw _privateConstructorUsedError;
  String get subjectColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectMaterialDtoCopyWith<SubjectMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectMaterialDtoCopyWith<$Res> {
  factory $SubjectMaterialDtoCopyWith(
          SubjectMaterialDto value, $Res Function(SubjectMaterialDto) then) =
      _$SubjectMaterialDtoCopyWithImpl<$Res, SubjectMaterialDto>;
  @useResult
  $Res call(
      {String id,
      String subjectName,
      String subjectNote,
      String subjectSyllabus,
      String subjectIcon,
      String subjectPaper,
      String subjectColor});
}

/// @nodoc
class _$SubjectMaterialDtoCopyWithImpl<$Res, $Val extends SubjectMaterialDto>
    implements $SubjectMaterialDtoCopyWith<$Res> {
  _$SubjectMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = null,
    Object? subjectNote = null,
    Object? subjectSyllabus = null,
    Object? subjectIcon = null,
    Object? subjectPaper = null,
    Object? subjectColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectNote: null == subjectNote
          ? _value.subjectNote
          : subjectNote // ignore: cast_nullable_to_non_nullable
              as String,
      subjectSyllabus: null == subjectSyllabus
          ? _value.subjectSyllabus
          : subjectSyllabus // ignore: cast_nullable_to_non_nullable
              as String,
      subjectIcon: null == subjectIcon
          ? _value.subjectIcon
          : subjectIcon // ignore: cast_nullable_to_non_nullable
              as String,
      subjectPaper: null == subjectPaper
          ? _value.subjectPaper
          : subjectPaper // ignore: cast_nullable_to_non_nullable
              as String,
      subjectColor: null == subjectColor
          ? _value.subjectColor
          : subjectColor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubjectMaterialDtoCopyWith<$Res>
    implements $SubjectMaterialDtoCopyWith<$Res> {
  factory _$$_SubjectMaterialDtoCopyWith(_$_SubjectMaterialDto value,
          $Res Function(_$_SubjectMaterialDto) then) =
      __$$_SubjectMaterialDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String subjectName,
      String subjectNote,
      String subjectSyllabus,
      String subjectIcon,
      String subjectPaper,
      String subjectColor});
}

/// @nodoc
class __$$_SubjectMaterialDtoCopyWithImpl<$Res>
    extends _$SubjectMaterialDtoCopyWithImpl<$Res, _$_SubjectMaterialDto>
    implements _$$_SubjectMaterialDtoCopyWith<$Res> {
  __$$_SubjectMaterialDtoCopyWithImpl(
      _$_SubjectMaterialDto _value, $Res Function(_$_SubjectMaterialDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = null,
    Object? subjectNote = null,
    Object? subjectSyllabus = null,
    Object? subjectIcon = null,
    Object? subjectPaper = null,
    Object? subjectColor = null,
  }) {
    return _then(_$_SubjectMaterialDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectNote: null == subjectNote
          ? _value.subjectNote
          : subjectNote // ignore: cast_nullable_to_non_nullable
              as String,
      subjectSyllabus: null == subjectSyllabus
          ? _value.subjectSyllabus
          : subjectSyllabus // ignore: cast_nullable_to_non_nullable
              as String,
      subjectIcon: null == subjectIcon
          ? _value.subjectIcon
          : subjectIcon // ignore: cast_nullable_to_non_nullable
              as String,
      subjectPaper: null == subjectPaper
          ? _value.subjectPaper
          : subjectPaper // ignore: cast_nullable_to_non_nullable
              as String,
      subjectColor: null == subjectColor
          ? _value.subjectColor
          : subjectColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubjectMaterialDto extends _SubjectMaterialDto {
  const _$_SubjectMaterialDto(
      {required this.id,
      required this.subjectName,
      required this.subjectNote,
      required this.subjectSyllabus,
      required this.subjectIcon,
      required this.subjectPaper,
      required this.subjectColor})
      : super._();

  factory _$_SubjectMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$$_SubjectMaterialDtoFromJson(json);

  @override
  final String id;
  @override
  final String subjectName;
  @override
  final String subjectNote;
  @override
  final String subjectSyllabus;
  @override
  final String subjectIcon;
  @override
  final String subjectPaper;
  @override
  final String subjectColor;

  @override
  String toString() {
    return 'SubjectMaterialDto(id: $id, subjectName: $subjectName, subjectNote: $subjectNote, subjectSyllabus: $subjectSyllabus, subjectIcon: $subjectIcon, subjectPaper: $subjectPaper, subjectColor: $subjectColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectMaterialDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.subjectNote, subjectNote) ||
                other.subjectNote == subjectNote) &&
            (identical(other.subjectSyllabus, subjectSyllabus) ||
                other.subjectSyllabus == subjectSyllabus) &&
            (identical(other.subjectIcon, subjectIcon) ||
                other.subjectIcon == subjectIcon) &&
            (identical(other.subjectPaper, subjectPaper) ||
                other.subjectPaper == subjectPaper) &&
            (identical(other.subjectColor, subjectColor) ||
                other.subjectColor == subjectColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectName, subjectNote,
      subjectSyllabus, subjectIcon, subjectPaper, subjectColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectMaterialDtoCopyWith<_$_SubjectMaterialDto> get copyWith =>
      __$$_SubjectMaterialDtoCopyWithImpl<_$_SubjectMaterialDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubjectMaterialDtoToJson(
      this,
    );
  }
}

abstract class _SubjectMaterialDto extends SubjectMaterialDto {
  const factory _SubjectMaterialDto(
      {required final String id,
      required final String subjectName,
      required final String subjectNote,
      required final String subjectSyllabus,
      required final String subjectIcon,
      required final String subjectPaper,
      required final String subjectColor}) = _$_SubjectMaterialDto;
  const _SubjectMaterialDto._() : super._();

  factory _SubjectMaterialDto.fromJson(Map<String, dynamic> json) =
      _$_SubjectMaterialDto.fromJson;

  @override
  String get id;
  @override
  String get subjectName;
  @override
  String get subjectNote;
  @override
  String get subjectSyllabus;
  @override
  String get subjectIcon;
  @override
  String get subjectPaper;
  @override
  String get subjectColor;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectMaterialDtoCopyWith<_$_SubjectMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}
