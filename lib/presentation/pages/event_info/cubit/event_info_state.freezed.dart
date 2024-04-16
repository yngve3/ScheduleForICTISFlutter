// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventInfoState {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  TimeOfDay? get timeStart => throw _privateConstructorUsedError;
  TimeOfDay? get timeEnd => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  List<Reminder>? get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventInfoStateCopyWith<EventInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoStateCopyWith<$Res> {
  factory $EventInfoStateCopyWith(
          EventInfoState value, $Res Function(EventInfoState) then) =
      _$EventInfoStateCopyWithImpl<$Res, EventInfoState>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      DateTime? date,
      TimeOfDay? timeStart,
      TimeOfDay? timeEnd,
      String? location,
      List<Reminder>? reminders});
}

/// @nodoc
class _$EventInfoStateCopyWithImpl<$Res, $Val extends EventInfoState>
    implements $EventInfoStateCopyWith<$Res> {
  _$EventInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? location = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      reminders: freezed == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventInfoStateImplCopyWith<$Res>
    implements $EventInfoStateCopyWith<$Res> {
  factory _$$EventInfoStateImplCopyWith(_$EventInfoStateImpl value,
          $Res Function(_$EventInfoStateImpl) then) =
      __$$EventInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      DateTime? date,
      TimeOfDay? timeStart,
      TimeOfDay? timeEnd,
      String? location,
      List<Reminder>? reminders});
}

/// @nodoc
class __$$EventInfoStateImplCopyWithImpl<$Res>
    extends _$EventInfoStateCopyWithImpl<$Res, _$EventInfoStateImpl>
    implements _$$EventInfoStateImplCopyWith<$Res> {
  __$$EventInfoStateImplCopyWithImpl(
      _$EventInfoStateImpl _value, $Res Function(_$EventInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = freezed,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? location = freezed,
    Object? reminders = freezed,
  }) {
    return _then(_$EventInfoStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      reminders: freezed == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>?,
    ));
  }
}

/// @nodoc

class _$EventInfoStateImpl implements _EventInfoState {
  const _$EventInfoStateImpl(
      {this.id = 0,
      this.title = "",
      this.description,
      this.date,
      this.timeStart,
      this.timeEnd,
      this.location,
      final List<Reminder>? reminders})
      : _reminders = reminders;

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  final String? description;
  @override
  final DateTime? date;
  @override
  final TimeOfDay? timeStart;
  @override
  final TimeOfDay? timeEnd;
  @override
  final String? location;
  final List<Reminder>? _reminders;
  @override
  List<Reminder>? get reminders {
    final value = _reminders;
    if (value == null) return null;
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventInfoState(id: $id, title: $title, description: $description, date: $date, timeStart: $timeStart, timeEnd: $timeEnd, location: $location, reminders: $reminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      date,
      timeStart,
      timeEnd,
      location,
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoStateImplCopyWith<_$EventInfoStateImpl> get copyWith =>
      __$$EventInfoStateImplCopyWithImpl<_$EventInfoStateImpl>(
          this, _$identity);
}

abstract class _EventInfoState implements EventInfoState {
  const factory _EventInfoState(
      {final int id,
      final String title,
      final String? description,
      final DateTime? date,
      final TimeOfDay? timeStart,
      final TimeOfDay? timeEnd,
      final String? location,
      final List<Reminder>? reminders}) = _$EventInfoStateImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime? get date;
  @override
  TimeOfDay? get timeStart;
  @override
  TimeOfDay? get timeEnd;
  @override
  String? get location;
  @override
  List<Reminder>? get reminders;
  @override
  @JsonKey(ignore: true)
  _$$EventInfoStateImplCopyWith<_$EventInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
