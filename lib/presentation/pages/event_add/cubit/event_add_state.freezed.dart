// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventAddState {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TimeOfDay? get timeStart => throw _privateConstructorUsedError;
  TimeOfDay? get timeEnd => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  bool get isSaveButtonEnabled => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  List<Reminder> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventAddStateCopyWith<EventAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventAddStateCopyWith<$Res> {
  factory $EventAddStateCopyWith(
          EventAddState value, $Res Function(EventAddState) then) =
      _$EventAddStateCopyWithImpl<$Res, EventAddState>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      TimeOfDay? timeStart,
      TimeOfDay? timeEnd,
      DateTime? date,
      bool isSaveButtonEnabled,
      String location,
      List<Reminder> reminders});
}

/// @nodoc
class _$EventAddStateCopyWithImpl<$Res, $Val extends EventAddState>
    implements $EventAddStateCopyWith<$Res> {
  _$EventAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? date = freezed,
    Object? isSaveButtonEnabled = null,
    Object? location = null,
    Object? reminders = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventAddStateImplCopyWith<$Res>
    implements $EventAddStateCopyWith<$Res> {
  factory _$$EventAddStateImplCopyWith(
          _$EventAddStateImpl value, $Res Function(_$EventAddStateImpl) then) =
      __$$EventAddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String description,
      TimeOfDay? timeStart,
      TimeOfDay? timeEnd,
      DateTime? date,
      bool isSaveButtonEnabled,
      String location,
      List<Reminder> reminders});
}

/// @nodoc
class __$$EventAddStateImplCopyWithImpl<$Res>
    extends _$EventAddStateCopyWithImpl<$Res, _$EventAddStateImpl>
    implements _$$EventAddStateImplCopyWith<$Res> {
  __$$EventAddStateImplCopyWithImpl(
      _$EventAddStateImpl _value, $Res Function(_$EventAddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? timeStart = freezed,
    Object? timeEnd = freezed,
    Object? date = freezed,
    Object? isSaveButtonEnabled = null,
    Object? location = null,
    Object? reminders = null,
  }) {
    return _then(_$EventAddStateImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      timeStart: freezed == timeStart
          ? _value.timeStart
          : timeStart // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      timeEnd: freezed == timeEnd
          ? _value.timeEnd
          : timeEnd // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc

class _$EventAddStateImpl implements _EventAddState {
  _$EventAddStateImpl(
      {this.id,
      this.title = "",
      this.description = "",
      this.timeStart = null,
      this.timeEnd = null,
      this.date = null,
      this.isSaveButtonEnabled = false,
      this.location = "",
      final List<Reminder> reminders = const []})
      : _reminders = reminders;

  @override
  final int? id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final TimeOfDay? timeStart;
  @override
  @JsonKey()
  final TimeOfDay? timeEnd;
  @override
  @JsonKey()
  final DateTime? date;
  @override
  @JsonKey()
  final bool isSaveButtonEnabled;
  @override
  @JsonKey()
  final String location;
  final List<Reminder> _reminders;
  @override
  @JsonKey()
  List<Reminder> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  String toString() {
    return 'EventAddState(id: $id, title: $title, description: $description, timeStart: $timeStart, timeEnd: $timeEnd, date: $date, isSaveButtonEnabled: $isSaveButtonEnabled, location: $location, reminders: $reminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAddStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timeStart, timeStart) ||
                other.timeStart == timeStart) &&
            (identical(other.timeEnd, timeEnd) || other.timeEnd == timeEnd) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isSaveButtonEnabled, isSaveButtonEnabled) ||
                other.isSaveButtonEnabled == isSaveButtonEnabled) &&
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
      timeStart,
      timeEnd,
      date,
      isSaveButtonEnabled,
      location,
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAddStateImplCopyWith<_$EventAddStateImpl> get copyWith =>
      __$$EventAddStateImplCopyWithImpl<_$EventAddStateImpl>(this, _$identity);
}

abstract class _EventAddState implements EventAddState {
  factory _EventAddState(
      {final int? id,
      final String title,
      final String description,
      final TimeOfDay? timeStart,
      final TimeOfDay? timeEnd,
      final DateTime? date,
      final bool isSaveButtonEnabled,
      final String location,
      final List<Reminder> reminders}) = _$EventAddStateImpl;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  TimeOfDay? get timeStart;
  @override
  TimeOfDay? get timeEnd;
  @override
  DateTime? get date;
  @override
  bool get isSaveButtonEnabled;
  @override
  String get location;
  @override
  List<Reminder> get reminders;
  @override
  @JsonKey(ignore: true)
  _$$EventAddStateImplCopyWith<_$EventAddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
