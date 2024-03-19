// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleSearchState {
  List<ScheduleSubject> get searchResult => throw _privateConstructorUsedError;
  bool get isSaveButtonEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleSearchStateCopyWith<ScheduleSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleSearchStateCopyWith<$Res> {
  factory $ScheduleSearchStateCopyWith(
          ScheduleSearchState value, $Res Function(ScheduleSearchState) then) =
      _$ScheduleSearchStateCopyWithImpl<$Res, ScheduleSearchState>;
  @useResult
  $Res call({List<ScheduleSubject> searchResult, bool isSaveButtonEnabled});
}

/// @nodoc
class _$ScheduleSearchStateCopyWithImpl<$Res, $Val extends ScheduleSearchState>
    implements $ScheduleSearchStateCopyWith<$Res> {
  _$ScheduleSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
    Object? isSaveButtonEnabled = null,
  }) {
    return _then(_value.copyWith(
      searchResult: null == searchResult
          ? _value.searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleSearchStateImplCopyWith<$Res>
    implements $ScheduleSearchStateCopyWith<$Res> {
  factory _$$ScheduleSearchStateImplCopyWith(_$ScheduleSearchStateImpl value,
          $Res Function(_$ScheduleSearchStateImpl) then) =
      __$$ScheduleSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ScheduleSubject> searchResult, bool isSaveButtonEnabled});
}

/// @nodoc
class __$$ScheduleSearchStateImplCopyWithImpl<$Res>
    extends _$ScheduleSearchStateCopyWithImpl<$Res, _$ScheduleSearchStateImpl>
    implements _$$ScheduleSearchStateImplCopyWith<$Res> {
  __$$ScheduleSearchStateImplCopyWithImpl(_$ScheduleSearchStateImpl _value,
      $Res Function(_$ScheduleSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResult = null,
    Object? isSaveButtonEnabled = null,
  }) {
    return _then(_$ScheduleSearchStateImpl(
      searchResult: null == searchResult
          ? _value._searchResult
          : searchResult // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScheduleSearchStateImpl implements _ScheduleSearchState {
  const _$ScheduleSearchStateImpl(
      {required final List<ScheduleSubject> searchResult,
      this.isSaveButtonEnabled = false})
      : _searchResult = searchResult;

  final List<ScheduleSubject> _searchResult;
  @override
  List<ScheduleSubject> get searchResult {
    if (_searchResult is EqualUnmodifiableListView) return _searchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResult);
  }

  @override
  @JsonKey()
  final bool isSaveButtonEnabled;

  @override
  String toString() {
    return 'ScheduleSearchState(searchResult: $searchResult, isSaveButtonEnabled: $isSaveButtonEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleSearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchResult, _searchResult) &&
            (identical(other.isSaveButtonEnabled, isSaveButtonEnabled) ||
                other.isSaveButtonEnabled == isSaveButtonEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_searchResult), isSaveButtonEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleSearchStateImplCopyWith<_$ScheduleSearchStateImpl> get copyWith =>
      __$$ScheduleSearchStateImplCopyWithImpl<_$ScheduleSearchStateImpl>(
          this, _$identity);
}

abstract class _ScheduleSearchState implements ScheduleSearchState {
  const factory _ScheduleSearchState(
      {required final List<ScheduleSubject> searchResult,
      final bool isSaveButtonEnabled}) = _$ScheduleSearchStateImpl;

  @override
  List<ScheduleSubject> get searchResult;
  @override
  bool get isSaveButtonEnabled;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleSearchStateImplCopyWith<_$ScheduleSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
