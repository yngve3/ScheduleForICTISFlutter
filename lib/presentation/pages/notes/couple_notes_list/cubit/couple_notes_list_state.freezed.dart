// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'couple_notes_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoupleNotesListState {
  List<Note> get notes => throw _privateConstructorUsedError;
  Couple? get couple => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoupleNotesListStateCopyWith<CoupleNotesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoupleNotesListStateCopyWith<$Res> {
  factory $CoupleNotesListStateCopyWith(CoupleNotesListState value,
          $Res Function(CoupleNotesListState) then) =
      _$CoupleNotesListStateCopyWithImpl<$Res, CoupleNotesListState>;
  @useResult
  $Res call({List<Note> notes, Couple? couple});
}

/// @nodoc
class _$CoupleNotesListStateCopyWithImpl<$Res,
        $Val extends CoupleNotesListState>
    implements $CoupleNotesListStateCopyWith<$Res> {
  _$CoupleNotesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? couple = freezed,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      couple: freezed == couple
          ? _value.couple
          : couple // ignore: cast_nullable_to_non_nullable
              as Couple?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoupleNotesListStateImplCopyWith<$Res>
    implements $CoupleNotesListStateCopyWith<$Res> {
  factory _$$CoupleNotesListStateImplCopyWith(_$CoupleNotesListStateImpl value,
          $Res Function(_$CoupleNotesListStateImpl) then) =
      __$$CoupleNotesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Note> notes, Couple? couple});
}

/// @nodoc
class __$$CoupleNotesListStateImplCopyWithImpl<$Res>
    extends _$CoupleNotesListStateCopyWithImpl<$Res, _$CoupleNotesListStateImpl>
    implements _$$CoupleNotesListStateImplCopyWith<$Res> {
  __$$CoupleNotesListStateImplCopyWithImpl(_$CoupleNotesListStateImpl _value,
      $Res Function(_$CoupleNotesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
    Object? couple = freezed,
  }) {
    return _then(_$CoupleNotesListStateImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      couple: freezed == couple
          ? _value.couple
          : couple // ignore: cast_nullable_to_non_nullable
              as Couple?,
    ));
  }
}

/// @nodoc

class _$CoupleNotesListStateImpl implements _CoupleNotesListState {
  const _$CoupleNotesListStateImpl(
      {final List<Note> notes = const [], this.couple})
      : _notes = notes;

  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  final Couple? couple;

  @override
  String toString() {
    return 'CoupleNotesListState(notes: $notes, couple: $couple)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoupleNotesListStateImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            (identical(other.couple, couple) || other.couple == couple));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notes), couple);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoupleNotesListStateImplCopyWith<_$CoupleNotesListStateImpl>
      get copyWith =>
          __$$CoupleNotesListStateImplCopyWithImpl<_$CoupleNotesListStateImpl>(
              this, _$identity);
}

abstract class _CoupleNotesListState implements CoupleNotesListState {
  const factory _CoupleNotesListState(
      {final List<Note> notes,
      final Couple? couple}) = _$CoupleNotesListStateImpl;

  @override
  List<Note> get notes;
  @override
  Couple? get couple;
  @override
  @JsonKey(ignore: true)
  _$$CoupleNotesListStateImplCopyWith<_$CoupleNotesListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
