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
  $Res call({List<ScheduleSubject> favoriteSchedules});
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
  }) {
    return _then(_value.copyWith(
      favoriteSchedules: null == favoriteSchedules
          ? _value.favoriteSchedules
          : favoriteSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
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
  $Res call({List<ScheduleSubject> favoriteSchedules});
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
  }) {
    return _then(_$FavoriteSchedulesListStateImpl(
      favoriteSchedules: null == favoriteSchedules
          ? _value._favoriteSchedules
          : favoriteSchedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduleSubject>,
    ));
  }
}

/// @nodoc

class _$FavoriteSchedulesListStateImpl implements _FavoriteSchedulesListState {
  const _$FavoriteSchedulesListStateImpl(
      {required final List<ScheduleSubject> favoriteSchedules})
      : _favoriteSchedules = favoriteSchedules;

  final List<ScheduleSubject> _favoriteSchedules;
  @override
  List<ScheduleSubject> get favoriteSchedules {
    if (_favoriteSchedules is EqualUnmodifiableListView)
      return _favoriteSchedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteSchedules);
  }

  @override
  String toString() {
    return 'FavoriteSchedulesListState(favoriteSchedules: $favoriteSchedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteSchedulesListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteSchedules, _favoriteSchedules));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteSchedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteSchedulesListStateImplCopyWith<_$FavoriteSchedulesListStateImpl>
      get copyWith => __$$FavoriteSchedulesListStateImplCopyWithImpl<
          _$FavoriteSchedulesListStateImpl>(this, _$identity);
}

abstract class _FavoriteSchedulesListState
    implements FavoriteSchedulesListState {
  const factory _FavoriteSchedulesListState(
          {required final List<ScheduleSubject> favoriteSchedules}) =
      _$FavoriteSchedulesListStateImpl;

  @override
  List<ScheduleSubject> get favoriteSchedules;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteSchedulesListStateImplCopyWith<_$FavoriteSchedulesListStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
