// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  List<DayScheduleItem> get scheduleItems => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;
  int? get studyWeekNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {List<DayScheduleItem> scheduleItems,
      List<Note> notes,
      int? studyWeekNumber});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleItems = null,
    Object? notes = null,
    Object? studyWeekNumber = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleItems: null == scheduleItems
          ? _value.scheduleItems
          : scheduleItems // ignore: cast_nullable_to_non_nullable
              as List<DayScheduleItem>,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      studyWeekNumber: freezed == studyWeekNumber
          ? _value.studyWeekNumber
          : studyWeekNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DayScheduleItem> scheduleItems,
      List<Note> notes,
      int? studyWeekNumber});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleItems = null,
    Object? notes = null,
    Object? studyWeekNumber = freezed,
  }) {
    return _then(_$HomePageStateImpl(
      scheduleItems: null == scheduleItems
          ? _value._scheduleItems
          : scheduleItems // ignore: cast_nullable_to_non_nullable
              as List<DayScheduleItem>,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      studyWeekNumber: freezed == studyWeekNumber
          ? _value.studyWeekNumber
          : studyWeekNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {final List<DayScheduleItem> scheduleItems = const [],
      final List<Note> notes = const [],
      this.studyWeekNumber})
      : _scheduleItems = scheduleItems,
        _notes = notes;

  final List<DayScheduleItem> _scheduleItems;
  @override
  @JsonKey()
  List<DayScheduleItem> get scheduleItems {
    if (_scheduleItems is EqualUnmodifiableListView) return _scheduleItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleItems);
  }

  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final int? studyWeekNumber;

  @override
  String toString() {
    return 'HomePageState(scheduleItems: $scheduleItems, notes: $notes, studyWeekNumber: $studyWeekNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            const DeepCollectionEquality()
                .equals(other._scheduleItems, _scheduleItems) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.studyWeekNumber, studyWeekNumber) ||
                other.studyWeekNumber == studyWeekNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scheduleItems),
      const DeepCollectionEquality().hash(_notes),
      studyWeekNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final List<DayScheduleItem> scheduleItems,
      final List<Note> notes,
      final int? studyWeekNumber}) = _$HomePageStateImpl;

  @override
  List<DayScheduleItem> get scheduleItems;
  @override
  List<Note> get notes;
  @override
  int? get studyWeekNumber;
  @override
  @JsonKey(ignore: true)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
