// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  DateTime get selectedDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
  @useResult
  $Res call({DateTime selectedDay});
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
  }) {
    return _then(_value.copyWith(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleStateImplCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$$ScheduleStateImplCopyWith(
          _$ScheduleStateImpl value, $Res Function(_$ScheduleStateImpl) then) =
      __$$ScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selectedDay});
}

/// @nodoc
class __$$ScheduleStateImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$ScheduleStateImpl>
    implements _$$ScheduleStateImplCopyWith<$Res> {
  __$$ScheduleStateImplCopyWithImpl(
      _$ScheduleStateImpl _value, $Res Function(_$ScheduleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDay = null,
  }) {
    return _then(_$ScheduleStateImpl(
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ScheduleStateImpl implements _ScheduleState {
  _$ScheduleStateImpl({required this.selectedDay});

  @override
  final DateTime selectedDay;

  @override
  String toString() {
    return 'ScheduleState(selectedDay: $selectedDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleStateImpl &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleStateImplCopyWith<_$ScheduleStateImpl> get copyWith =>
      __$$ScheduleStateImplCopyWithImpl<_$ScheduleStateImpl>(this, _$identity);
}

abstract class _ScheduleState implements ScheduleState {
  factory _ScheduleState({required final DateTime selectedDay}) =
      _$ScheduleStateImpl;

  @override
  DateTime get selectedDay;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleStateImplCopyWith<_$ScheduleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
