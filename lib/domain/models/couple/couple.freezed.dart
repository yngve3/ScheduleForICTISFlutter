// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'couple.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Couple {
  TimeOfDay get timeStart => throw _privateConstructorUsedError;
  TimeOfDay get timeEnd => throw _privateConstructorUsedError;
  String get audience => throw _privateConstructorUsedError;
  CoupleType get type => throw _privateConstructorUsedError;
  String get discipline => throw _privateConstructorUsedError;
  String get lecturer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoupleCopyWith<Couple> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoupleCopyWith<$Res> {
  factory $CoupleCopyWith(Couple value, $Res Function(Couple) then) =
      _$CoupleCopyWithImpl<$Res, Couple>;
  @useResult
  $Res call(
      {TimeOfDay timeStart,
      TimeOfDay timeEnd,
      String audience,
      CoupleType type,
      String discipline,
      String lecturer});
}

/// @nodoc
class _$CoupleCopyWithImpl<$Res, $Val extends Couple>
    implements $CoupleCopyWith<$Res> {
  _$CoupleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? audience = null,
    Object? type = null,
    Object? discipline = null,
    Object? lecturer = null,
  }) {
    return _then(_value.copyWith(
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      audience: null == audience
          ? _value.audience
          : audience // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoupleType,
      discipline: null == discipline
          ? _value.discipline
          : discipline // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoupleImplCopyWith<$Res> implements $CoupleCopyWith<$Res> {
  factory _$$CoupleImplCopyWith(
          _$CoupleImpl value, $Res Function(_$CoupleImpl) then) =
      __$$CoupleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimeOfDay timeStart,
      TimeOfDay timeEnd,
      String audience,
      CoupleType type,
      String discipline,
      String lecturer});
}

/// @nodoc
class __$$CoupleImplCopyWithImpl<$Res>
    extends _$CoupleCopyWithImpl<$Res, _$CoupleImpl>
    implements _$$CoupleImplCopyWith<$Res> {
  __$$CoupleImplCopyWithImpl(
      _$CoupleImpl _value, $Res Function(_$CoupleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeStart = null,
    Object? timeEnd = null,
    Object? audience = null,
    Object? type = null,
    Object? discipline = null,
    Object? lecturer = null,
  }) {
    return _then(_$CoupleImpl(
      timeStart: null == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      timeEnd: null == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
      audience: null == audience
          ? _value.audience
          : audience // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CoupleType,
      discipline: null == discipline
          ? _value.discipline
          : discipline // ignore: cast_nullable_to_non_nullable
              as String,
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CoupleImpl extends _Couple {
  _$CoupleImpl(
      {required this.timeStart,
      required this.timeEnd,
      required this.audience,
      required this.type,
      required this.discipline,
      required this.lecturer})
      : super._();

  @override
  final TimeOfDay timeStart;
  @override
  final TimeOfDay timeEnd;
  @override
  final String audience;
  @override
  final CoupleType type;
  @override
  final String discipline;
  @override
  final String lecturer;

  @override
  String toString() {
    return 'Couple(timeStart: $timeStart, timeEnd: $timeEnd, audience: $audience, type: $type, discipline: $discipline, lecturer: $lecturer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoupleImpl &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd) &&
            (identical(other.audience, audience) ||
                other.audience == audience) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.discipline, discipline) ||
                other.discipline == discipline) &&
            (identical(other.lecturer, lecturer) ||
                other.lecturer == lecturer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, timeStart, timeEnd, audience, type, discipline, lecturer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoupleImplCopyWith<_$CoupleImpl> get copyWith =>
      __$$CoupleImplCopyWithImpl<_$CoupleImpl>(this, _$identity);
}

abstract class _Couple extends Couple {
  factory _Couple(
      {required final TimeOfDay timeStart,
      required final TimeOfDay timeEnd,
      required final String audience,
      required final CoupleType type,
      required final String discipline,
      required final String lecturer}) = _$CoupleImpl;
  _Couple._() : super._();

  @override
  TimeOfDay get timeStart;
  @override
  TimeOfDay get timeEnd;
  @override
  String get audience;
  @override
  CoupleType get type;
  @override
  String get discipline;
  @override
  String get lecturer;
  @override
  @JsonKey(ignore: true)
  _$$CoupleImplCopyWith<_$CoupleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
