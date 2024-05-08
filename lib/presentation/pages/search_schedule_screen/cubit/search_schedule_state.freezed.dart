// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchScheduleState {
  List<ScheduleSubject> get searchResults => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchScheduleStateCopyWith<SearchScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchScheduleStateCopyWith<$Res> {
  factory $SearchScheduleStateCopyWith(
          SearchScheduleState value, $Res Function(SearchScheduleState) then) =
      _$SearchScheduleStateCopyWithImpl<$Res, SearchScheduleState>;
  @useResult
  $Res call({List<ScheduleSubject> searchResults});
}

/// @nodoc
class _$SearchScheduleStateCopyWithImpl<$Res, $Val extends SearchScheduleState>
    implements $SearchScheduleStateCopyWith<$Res> {
  _$SearchScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
  }) {
    return _then(_value.copyWith(
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchScheduleStateImplCopyWith<$Res>
    implements $SearchScheduleStateCopyWith<$Res> {
  factory _$$SearchScheduleStateImplCopyWith(_$SearchScheduleStateImpl value,
          $Res Function(_$SearchScheduleStateImpl) then) =
      __$$SearchScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleSubject> searchResults});
}

/// @nodoc
class __$$SearchScheduleStateImplCopyWithImpl<$Res>
    extends _$SearchScheduleStateCopyWithImpl<$Res, _$SearchScheduleStateImpl>
    implements _$$SearchScheduleStateImplCopyWith<$Res> {
  __$$SearchScheduleStateImplCopyWithImpl(_$SearchScheduleStateImpl _value,
      $Res Function(_$SearchScheduleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
  }) {
    return _then(_$SearchScheduleStateImpl(
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
    ));
  }
}

/// @nodoc

class _$SearchScheduleStateImpl implements _SearchScheduleState {
  const _$SearchScheduleStateImpl(
      {final List<ScheduleSubject> searchResults = const []})
      : _searchResults = searchResults;

  final List<ScheduleSubject> _searchResults;
  @override
  @JsonKey()
  List<ScheduleSubject> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  String toString() {
    return 'SearchScheduleState(searchResults: $searchResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchScheduleStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_searchResults));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchScheduleStateImplCopyWith<_$SearchScheduleStateImpl> get copyWith =>
      __$$SearchScheduleStateImplCopyWithImpl<_$SearchScheduleStateImpl>(
          this, _$identity);
}

abstract class _SearchScheduleState implements SearchScheduleState {
  const factory _SearchScheduleState(
      {final List<ScheduleSubject> searchResults}) = _$SearchScheduleStateImpl;

  @override
  List<ScheduleSubject> get searchResults;
  @override
  @JsonKey(ignore: true)
  _$$SearchScheduleStateImplCopyWith<_$SearchScheduleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
