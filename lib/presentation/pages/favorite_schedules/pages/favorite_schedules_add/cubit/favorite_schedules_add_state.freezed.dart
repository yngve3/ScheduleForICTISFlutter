// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_schedules_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteScheduleAddState {
  List<ScheduleSubject> get searchResults => throw _privateConstructorUsedError;
  List<ScheduleSubject> get filteredSearchResult =>
      throw _privateConstructorUsedError;
  SearchCategory get category => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  bool get isSaveButtonEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteScheduleAddStateCopyWith<FavoriteScheduleAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteScheduleAddStateCopyWith<$Res> {
  factory $FavoriteScheduleAddStateCopyWith(FavoriteScheduleAddState value,
          $Res Function(FavoriteScheduleAddState) then) =
      _$FavoriteScheduleAddStateCopyWithImpl<$Res, FavoriteScheduleAddState>;
  @useResult
  $Res call(
      {List<ScheduleSubject> searchResults,
      List<ScheduleSubject> filteredSearchResult,
      SearchCategory category,
      String query,
      bool isSaveButtonEnabled});
}

/// @nodoc
class _$FavoriteScheduleAddStateCopyWithImpl<$Res,
        $Val extends FavoriteScheduleAddState>
    implements $FavoriteScheduleAddStateCopyWith<$Res> {
  _$FavoriteScheduleAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
    Object? filteredSearchResult = null,
    Object? category = null,
    Object? query = null,
    Object? isSaveButtonEnabled = null,
  }) {
    return _then(_value.copyWith(
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      filteredSearchResult: null == filteredSearchResult
          ? _value.filteredSearchResult
          : filteredSearchResult // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteScheduleAddStateImplCopyWith<$Res>
    implements $FavoriteScheduleAddStateCopyWith<$Res> {
  factory _$$FavoriteScheduleAddStateImplCopyWith(
          _$FavoriteScheduleAddStateImpl value,
          $Res Function(_$FavoriteScheduleAddStateImpl) then) =
      __$$FavoriteScheduleAddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScheduleSubject> searchResults,
      List<ScheduleSubject> filteredSearchResult,
      SearchCategory category,
      String query,
      bool isSaveButtonEnabled});
}

/// @nodoc
class __$$FavoriteScheduleAddStateImplCopyWithImpl<$Res>
    extends _$FavoriteScheduleAddStateCopyWithImpl<$Res,
        _$FavoriteScheduleAddStateImpl>
    implements _$$FavoriteScheduleAddStateImplCopyWith<$Res> {
  __$$FavoriteScheduleAddStateImplCopyWithImpl(
      _$FavoriteScheduleAddStateImpl _value,
      $Res Function(_$FavoriteScheduleAddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchResults = null,
    Object? filteredSearchResult = null,
    Object? category = null,
    Object? query = null,
    Object? isSaveButtonEnabled = null,
  }) {
    return _then(_$FavoriteScheduleAddStateImpl(
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      filteredSearchResult: null == filteredSearchResult
          ? _value._filteredSearchResult
          : filteredSearchResult // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as SearchCategory,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isSaveButtonEnabled: null == isSaveButtonEnabled
          ? _value.isSaveButtonEnabled
          : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteScheduleAddStateImpl implements _FavoriteScheduleAddState {
  const _$FavoriteScheduleAddStateImpl(
      {final List<ScheduleSubject> searchResults = const [],
      final List<ScheduleSubject> filteredSearchResult = const [],
      this.category = SearchCategory.all,
      this.query = "",
      this.isSaveButtonEnabled = false})
      : _searchResults = searchResults,
        _filteredSearchResult = filteredSearchResult;

  final List<ScheduleSubject> _searchResults;
  @override
  @JsonKey()
  List<ScheduleSubject> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  final List<ScheduleSubject> _filteredSearchResult;
  @override
  @JsonKey()
  List<ScheduleSubject> get filteredSearchResult {
    if (_filteredSearchResult is EqualUnmodifiableListView)
      return _filteredSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredSearchResult);
  }

  @override
  @JsonKey()
  final SearchCategory category;
  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isSaveButtonEnabled;

  @override
  String toString() {
    return 'FavoriteScheduleAddState(searchResults: $searchResults, filteredSearchResult: $filteredSearchResult, category: $category, query: $query, isSaveButtonEnabled: $isSaveButtonEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteScheduleAddStateImpl &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            const DeepCollectionEquality()
                .equals(other._filteredSearchResult, _filteredSearchResult) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isSaveButtonEnabled, isSaveButtonEnabled) ||
                other.isSaveButtonEnabled == isSaveButtonEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_searchResults),
      const DeepCollectionEquality().hash(_filteredSearchResult),
      category,
      query,
      isSaveButtonEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteScheduleAddStateImplCopyWith<_$FavoriteScheduleAddStateImpl>
      get copyWith => __$$FavoriteScheduleAddStateImplCopyWithImpl<
          _$FavoriteScheduleAddStateImpl>(this, _$identity);
}

abstract class _FavoriteScheduleAddState implements FavoriteScheduleAddState {
  const factory _FavoriteScheduleAddState(
      {final List<ScheduleSubject> searchResults,
      final List<ScheduleSubject> filteredSearchResult,
      final SearchCategory category,
      final String query,
      final bool isSaveButtonEnabled}) = _$FavoriteScheduleAddStateImpl;

  @override
  List<ScheduleSubject> get searchResults;
  @override
  List<ScheduleSubject> get filteredSearchResult;
  @override
  SearchCategory get category;
  @override
  String get query;
  @override
  bool get isSaveButtonEnabled;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteScheduleAddStateImplCopyWith<_$FavoriteScheduleAddStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
