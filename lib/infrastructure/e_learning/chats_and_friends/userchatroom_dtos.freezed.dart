// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userchatroom_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatroomDto _$ChatroomDtoFromJson(Map<String, dynamic> json) {
  return _ChatroomDto.fromJson(json);
}

/// @nodoc
mixin _$ChatroomDto {
  String get chatroomId => throw _privateConstructorUsedError;
  String get partnerId => throw _privateConstructorUsedError;
  String get chatroomDescription => throw _privateConstructorUsedError;
  DateTime get chatroomAt => throw _privateConstructorUsedError;
  List<String> get usersId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatroomDtoCopyWith<ChatroomDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatroomDtoCopyWith<$Res> {
  factory $ChatroomDtoCopyWith(
          ChatroomDto value, $Res Function(ChatroomDto) then) =
      _$ChatroomDtoCopyWithImpl<$Res, ChatroomDto>;
  @useResult
  $Res call(
      {String chatroomId,
      String partnerId,
      String chatroomDescription,
      DateTime chatroomAt,
      List<String> usersId});
}

/// @nodoc
class _$ChatroomDtoCopyWithImpl<$Res, $Val extends ChatroomDto>
    implements $ChatroomDtoCopyWith<$Res> {
  _$ChatroomDtoCopyWithImpl(this._value, this._then);

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
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      chatroomDescription: null == chatroomDescription
          ? _value.chatroomDescription
          : chatroomDescription // ignore: cast_nullable_to_non_nullable
              as String,
      chatroomAt: null == chatroomAt
          ? _value.chatroomAt
          : chatroomAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usersId: null == usersId
          ? _value.usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatroomDtoCopyWith<$Res>
    implements $ChatroomDtoCopyWith<$Res> {
  factory _$$_ChatroomDtoCopyWith(
          _$_ChatroomDto value, $Res Function(_$_ChatroomDto) then) =
      __$$_ChatroomDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatroomId,
      String partnerId,
      String chatroomDescription,
      DateTime chatroomAt,
      List<String> usersId});
}

/// @nodoc
class __$$_ChatroomDtoCopyWithImpl<$Res>
    extends _$ChatroomDtoCopyWithImpl<$Res, _$_ChatroomDto>
    implements _$$_ChatroomDtoCopyWith<$Res> {
  __$$_ChatroomDtoCopyWithImpl(
      _$_ChatroomDto _value, $Res Function(_$_ChatroomDto) _then)
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
    return _then(_$_ChatroomDto(
      chatroomId: null == chatroomId
          ? _value.chatroomId
          : chatroomId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerId: null == partnerId
          ? _value.partnerId
          : partnerId // ignore: cast_nullable_to_non_nullable
              as String,
      chatroomDescription: null == chatroomDescription
          ? _value.chatroomDescription
          : chatroomDescription // ignore: cast_nullable_to_non_nullable
              as String,
      chatroomAt: null == chatroomAt
          ? _value.chatroomAt
          : chatroomAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usersId: null == usersId
          ? _value._usersId
          : usersId // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatroomDto extends _ChatroomDto {
  const _$_ChatroomDto(
      {required this.chatroomId,
      required this.partnerId,
      required this.chatroomDescription,
      required this.chatroomAt,
      required final List<String> usersId})
      : _usersId = usersId,
        super._();

  factory _$_ChatroomDto.fromJson(Map<String, dynamic> json) =>
      _$$_ChatroomDtoFromJson(json);

  @override
  final String chatroomId;
  @override
  final String partnerId;
  @override
  final String chatroomDescription;
  @override
  final DateTime chatroomAt;
  final List<String> _usersId;
  @override
  List<String> get usersId {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersId);
  }

  @override
  String toString() {
    return 'ChatroomDto(chatroomId: $chatroomId, partnerId: $partnerId, chatroomDescription: $chatroomDescription, chatroomAt: $chatroomAt, usersId: $usersId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatroomDto &&
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

  @JsonKey(ignore: true)
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
  _$$_ChatroomDtoCopyWith<_$_ChatroomDto> get copyWith =>
      __$$_ChatroomDtoCopyWithImpl<_$_ChatroomDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatroomDtoToJson(
      this,
    );
  }
}

abstract class _ChatroomDto extends ChatroomDto {
  const factory _ChatroomDto(
      {required final String chatroomId,
      required final String partnerId,
      required final String chatroomDescription,
      required final DateTime chatroomAt,
      required final List<String> usersId}) = _$_ChatroomDto;
  const _ChatroomDto._() : super._();

  factory _ChatroomDto.fromJson(Map<String, dynamic> json) =
      _$_ChatroomDto.fromJson;

  @override
  String get chatroomId;
  @override
  String get partnerId;
  @override
  String get chatroomDescription;
  @override
  DateTime get chatroomAt;
  @override
  List<String> get usersId;
  @override
  @JsonKey(ignore: true)
  _$$_ChatroomDtoCopyWith<_$_ChatroomDto> get copyWith =>
      throw _privateConstructorUsedError;
}
