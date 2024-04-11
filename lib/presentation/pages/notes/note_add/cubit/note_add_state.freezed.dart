// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_add_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NoteAddState {
  String get coupleID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get discipline => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  dynamic get isButtonSaveEnabled => throw _privateConstructorUsedError;
  int? get noteID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteAddStateCopyWith<NoteAddState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteAddStateCopyWith<$Res> {
  factory $NoteAddStateCopyWith(
          NoteAddState value, $Res Function(NoteAddState) then) =
      _$NoteAddStateCopyWithImpl<$Res, NoteAddState>;
  @useResult
  $Res call(
      {String coupleID,
      String title,
      String? description,
      String discipline,
      DateTime? date,
      dynamic isButtonSaveEnabled,
      int? noteID});
}

/// @nodoc
class _$NoteAddStateCopyWithImpl<$Res, $Val extends NoteAddState>
    implements $NoteAddStateCopyWith<$Res> {
  _$NoteAddStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupleID = null,
    Object? title = null,
    Object? description = freezed,
    Object? discipline = null,
    Object? date = freezed,
    Object? isButtonSaveEnabled = freezed,
    Object? noteID = freezed,
  }) {
    return _then(_value.copyWith(
      coupleID: null == coupleID
          ? _value.coupleID
          : coupleID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discipline: null == discipline
          ? _value.discipline
          : discipline // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled
          : isButtonSaveEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noteID: freezed == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteAddStateImplCopyWith<$Res>
    implements $NoteAddStateCopyWith<$Res> {
  factory _$$NoteAddStateImplCopyWith(
          _$NoteAddStateImpl value, $Res Function(_$NoteAddStateImpl) then) =
      __$$NoteAddStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String coupleID,
      String title,
      String? description,
      String discipline,
      DateTime? date,
      dynamic isButtonSaveEnabled,
      int? noteID});
}

/// @nodoc
class __$$NoteAddStateImplCopyWithImpl<$Res>
    extends _$NoteAddStateCopyWithImpl<$Res, _$NoteAddStateImpl>
    implements _$$NoteAddStateImplCopyWith<$Res> {
  __$$NoteAddStateImplCopyWithImpl(
      _$NoteAddStateImpl _value, $Res Function(_$NoteAddStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupleID = null,
    Object? title = null,
    Object? description = freezed,
    Object? discipline = null,
    Object? date = freezed,
    Object? isButtonSaveEnabled = freezed,
    Object? noteID = freezed,
  }) {
    return _then(_$NoteAddStateImpl(
      coupleID: null == coupleID
          ? _value.coupleID
          : coupleID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      discipline: null == discipline
          ? _value.discipline
          : discipline // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled!
          : isButtonSaveEnabled,
      noteID: freezed == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NoteAddStateImpl implements _NoteAddState {
  const _$NoteAddStateImpl(
      {this.coupleID = "",
      this.title = "",
      this.description,
      this.discipline = "",
      this.date,
      this.isButtonSaveEnabled = false,
      this.noteID});

  @override
  @JsonKey()
  final String coupleID;
  @override
  @JsonKey()
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final String discipline;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final dynamic isButtonSaveEnabled;
  @override
  final int? noteID;

  @override
  String toString() {
    return 'NoteAddState(coupleID: $coupleID, title: $title, description: $description, discipline: $discipline, date: $date, isButtonSaveEnabled: $isButtonSaveEnabled, noteID: $noteID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteAddStateImpl &&
            (identical(other.coupleID, coupleID) ||
                other.coupleID == coupleID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discipline, discipline) ||
                other.discipline == discipline) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other.isButtonSaveEnabled, isButtonSaveEnabled) &&
            (identical(other.noteID, noteID) || other.noteID == noteID));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      coupleID,
      title,
      description,
      discipline,
      date,
      const DeepCollectionEquality().hash(isButtonSaveEnabled),
      noteID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteAddStateImplCopyWith<_$NoteAddStateImpl> get copyWith =>
      __$$NoteAddStateImplCopyWithImpl<_$NoteAddStateImpl>(this, _$identity);
}

abstract class _NoteAddState implements NoteAddState {
  const factory _NoteAddState(
      {final String coupleID,
      final String title,
      final String? description,
      final String discipline,
      final DateTime? date,
      final dynamic isButtonSaveEnabled,
      final int? noteID}) = _$NoteAddStateImpl;

  @override
  String get coupleID;
  @override
  String get title;
  @override
  String? get description;
  @override
  String get discipline;
  @override
  DateTime? get date;
  @override
  dynamic get isButtonSaveEnabled;
  @override
  int? get noteID;
  @override
  @JsonKey(ignore: true)
  _$$NoteAddStateImplCopyWith<_$NoteAddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
