// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ScheduleSubject _$ScheduleSubjectFromJson(Map<String, dynamic> json) {
  return _ScheduleSubject.fromJson(json);
}

/// @nodoc
mixin _$ScheduleSubject {
  @Id(assignable: true)
  int? get dbId => throw _privateConstructorUsedError;
  @JsonKey(name: "group")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isChosen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleSubjectCopyWith<ScheduleSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleSubjectCopyWith<$Res> {
  factory $ScheduleSubjectCopyWith(
          ScheduleSubject value, $Res Function(ScheduleSubject) then) =
      _$ScheduleSubjectCopyWithImpl<$Res, ScheduleSubject>;
  @useResult
  $Res call(
      {@Id(assignable: true) int? dbId,
      @JsonKey(name: "group") String id,
      String name,
      bool isChosen});
}

/// @nodoc
class _$ScheduleSubjectCopyWithImpl<$Res, $Val extends ScheduleSubject>
    implements $ScheduleSubjectCopyWith<$Res> {
  _$ScheduleSubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbId = freezed,
    Object? id = null,
    Object? name = null,
    Object? isChosen = null,
  }) {
    return _then(_value.copyWith(
      dbId: freezed == dbId
          ? _value.dbId
          : dbId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isChosen: null == isChosen
          ? _value.isChosen
          : isChosen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleSubjectImplCopyWith<$Res>
    implements $ScheduleSubjectCopyWith<$Res> {
  factory _$$ScheduleSubjectImplCopyWith(_$ScheduleSubjectImpl value,
          $Res Function(_$ScheduleSubjectImpl) then) =
      __$$ScheduleSubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Id(assignable: true) int? dbId,
      @JsonKey(name: "group") String id,
      String name,
      bool isChosen});
}

/// @nodoc
class __$$ScheduleSubjectImplCopyWithImpl<$Res>
    extends _$ScheduleSubjectCopyWithImpl<$Res, _$ScheduleSubjectImpl>
    implements _$$ScheduleSubjectImplCopyWith<$Res> {
  __$$ScheduleSubjectImplCopyWithImpl(
      _$ScheduleSubjectImpl _value, $Res Function(_$ScheduleSubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dbId = freezed,
    Object? id = null,
    Object? name = null,
    Object? isChosen = null,
  }) {
    return _then(_$ScheduleSubjectImpl(
      dbId: freezed == dbId
          ? _value.dbId
          : dbId // ignore: cast_nullable_to_non_nullable
              as int?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isChosen: null == isChosen
          ? _value.isChosen
          : isChosen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Entity(realClass: ScheduleSubject)
class _$ScheduleSubjectImpl implements _ScheduleSubject {
  _$ScheduleSubjectImpl(
      {@Id(assignable: true) this.dbId,
      @JsonKey(name: "group") required this.id,
      required this.name,
      this.isChosen = false});

  factory _$ScheduleSubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleSubjectImplFromJson(json);

  @override
  @Id(assignable: true)
  final int? dbId;
  @override
  @JsonKey(name: "group")
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isChosen;

  @override
  String toString() {
    return 'ScheduleSubject(dbId: $dbId, id: $id, name: $name, isChosen: $isChosen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleSubjectImpl &&
            (identical(other.dbId, dbId) || other.dbId == dbId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isChosen, isChosen) ||
                other.isChosen == isChosen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dbId, id, name, isChosen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleSubjectImplCopyWith<_$ScheduleSubjectImpl> get copyWith =>
      __$$ScheduleSubjectImplCopyWithImpl<_$ScheduleSubjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleSubjectImplToJson(
      this,
    );
  }
}

abstract class _ScheduleSubject implements ScheduleSubject {
  factory _ScheduleSubject(
      {@Id(assignable: true) final int? dbId,
      @JsonKey(name: "group") required final String id,
      required final String name,
      final bool isChosen}) = _$ScheduleSubjectImpl;

  factory _ScheduleSubject.fromJson(Map<String, dynamic> json) =
      _$ScheduleSubjectImpl.fromJson;

  @override
  @Id(assignable: true)
  int? get dbId;
  @override
  @JsonKey(name: "group")
  String get id;
  @override
  String get name;
  @override
  bool get isChosen;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleSubjectImplCopyWith<_$ScheduleSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
