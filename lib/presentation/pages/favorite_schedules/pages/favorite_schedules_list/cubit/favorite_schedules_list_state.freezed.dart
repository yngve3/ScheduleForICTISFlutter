// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_schedules_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteSchedulesListState {
  List<ScheduleSubject> get favoriteSchedules =>
      throw _privateConstructorUsedError;
  List<ScheduleSubject> get favoriteVPKs => throw _privateConstructorUsedError;
  dynamic get isButtonSaveEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteSchedulesListStateCopyWith<FavoriteSchedulesListState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteSchedulesListStateCopyWith<$Res> {
  factory $FavoriteSchedulesListStateCopyWith(FavoriteSchedulesListState value,
          $Res Function(FavoriteSchedulesListState) then) =
      _$FavoriteSchedulesListStateCopyWithImpl<$Res,
          FavoriteSchedulesListState>;
  @useResult
  $Res call(
      {List<ScheduleSubject> favoriteSchedules,
      List<ScheduleSubject> favoriteVPKs,
      dynamic isButtonSaveEnabled});
}

/// @nodoc
class _$FavoriteSchedulesListStateCopyWithImpl<$Res,
        $Val extends FavoriteSchedulesListState>
    implements $FavoriteSchedulesListStateCopyWith<$Res> {
  _$FavoriteSchedulesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteSchedules = null,
    Object? favoriteVPKs = null,
    Object? isButtonSaveEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      favoriteSchedules: null == favoriteSchedules
          ? _value.favoriteSchedules
          : favoriteSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      favoriteVPKs: null == favoriteVPKs
          ? _value.favoriteVPKs
          : favoriteVPKs // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled
          : isButtonSaveEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteSchedulesListStateImplCopyWith<$Res>
    implements $FavoriteSchedulesListStateCopyWith<$Res> {
  factory _$$FavoriteSchedulesListStateImplCopyWith(
          _$FavoriteSchedulesListStateImpl value,
          $Res Function(_$FavoriteSchedulesListStateImpl) then) =
      __$$FavoriteSchedulesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ScheduleSubject> favoriteSchedules,
      List<ScheduleSubject> favoriteVPKs,
      dynamic isButtonSaveEnabled});
}

/// @nodoc
class __$$FavoriteSchedulesListStateImplCopyWithImpl<$Res>
    extends _$FavoriteSchedulesListStateCopyWithImpl<$Res,
        _$FavoriteSchedulesListStateImpl>
    implements _$$FavoriteSchedulesListStateImplCopyWith<$Res> {
  __$$FavoriteSchedulesListStateImplCopyWithImpl(
      _$FavoriteSchedulesListStateImpl _value,
      $Res Function(_$FavoriteSchedulesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteSchedules = null,
    Object? favoriteVPKs = null,
    Object? isButtonSaveEnabled = freezed,
  }) {
    return _then(_$FavoriteSchedulesListStateImpl(
      favoriteSchedules: null == favoriteSchedules
          ? _value._favoriteSchedules
          : favoriteSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      favoriteVPKs: null == favoriteVPKs
          ? _value._favoriteVPKs
          : favoriteVPKs // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled!
          : isButtonSaveEnabled,
    ));
  }
}

/// @nodoc

class _$FavoriteSchedulesListStateImpl extends _FavoriteSchedulesListState {
  _$FavoriteSchedulesListStateImpl(
      {final List<ScheduleSubject> favoriteSchedules = const [],
      final List<ScheduleSubject> favoriteVPKs = const [],
      this.isButtonSaveEnabled = false})
      : _favoriteSchedules = favoriteSchedules,
        _favoriteVPKs = favoriteVPKs,
        super._();

  final List<ScheduleSubject> _favoriteSchedules;
  @override
  @JsonKey()
  List<ScheduleSubject> get favoriteSchedules {
    if (_favoriteSchedules is EqualUnmodifiableListView)
      return _favoriteSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteSchedules);
  }

  final List<ScheduleSubject> _favoriteVPKs;
  @override
  @JsonKey()
  List<ScheduleSubject> get favoriteVPKs {
    if (_favoriteVPKs is EqualUnmodifiableListView) return _favoriteVPKs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteVPKs);
  }

  @override
  @JsonKey()
  final dynamic isButtonSaveEnabled;

  @override
  String toString() {
    return 'FavoriteSchedulesListState(favoriteSchedules: $favoriteSchedules, favoriteVPKs: $favoriteVPKs, isButtonSaveEnabled: $isButtonSaveEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSchedulesListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteSchedules, _favoriteSchedules) &&
            const DeepCollectionEquality()
                .equals(other._favoriteVPKs, _favoriteVPKs) &&
            const DeepCollectionEquality()
                .equals(other.isButtonSaveEnabled, isButtonSaveEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favoriteSchedules),
      const DeepCollectionEquality().hash(_favoriteVPKs),
      const DeepCollectionEquality().hash(isButtonSaveEnabled));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSchedulesListStateImplCopyWith<_$FavoriteSchedulesListStateImpl>
      get copyWith => __$$FavoriteSchedulesListStateImplCopyWithImpl<
          _$FavoriteSchedulesListStateImpl>(this, _$identity);
}

abstract class _FavoriteSchedulesListState extends FavoriteSchedulesListState {
  factory _FavoriteSchedulesListState(
      {final List<ScheduleSubject> favoriteSchedules,
      final List<ScheduleSubject> favoriteVPKs,
      final dynamic isButtonSaveEnabled}) = _$FavoriteSchedulesListStateImpl;
  _FavoriteSchedulesListState._() : super._();

  @override
  List<ScheduleSubject> get favoriteSchedules;
  @override
  List<ScheduleSubject> get favoriteVPKs;
  @override
  dynamic get isButtonSaveEnabled;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteSchedulesListStateImplCopyWith<_$FavoriteSchedulesListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
