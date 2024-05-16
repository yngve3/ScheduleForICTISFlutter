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
  CoupleDB? get coupleDB => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  dynamic get isButtonSaveEnabled => throw _privateConstructorUsedError;
  int? get noteID => throw _privateConstructorUsedError;
  StateList<NoteFile> get files => throw _privateConstructorUsedError;
  StateList<Reminder> get reminders => throw _privateConstructorUsedError;

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
      {CoupleDB? coupleDB,
      String title,
      String? description,
      dynamic isButtonSaveEnabled,
      int? noteID,
      StateList<NoteFile> files,
      StateList<Reminder> reminders});
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
    Object? coupleDB = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? isButtonSaveEnabled = freezed,
    Object? noteID = freezed,
    Object? files = null,
    Object? reminders = null,
  }) {
    return _then(_value.copyWith(
      coupleDB: freezed == coupleDB
          ? _value.coupleDB
          : coupleDB // ignore: cast_nullable_to_non_nullable
              as CoupleDB?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled
          : isButtonSaveEnabled // ignore: cast_nullable_to_non_nullable
              as dynamic,
      noteID: freezed == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as StateList<NoteFile>,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as StateList<Reminder>,
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
      {CoupleDB? coupleDB,
      String title,
      String? description,
      dynamic isButtonSaveEnabled,
      int? noteID,
      StateList<NoteFile> files,
      StateList<Reminder> reminders});
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
    Object? coupleDB = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? isButtonSaveEnabled = freezed,
    Object? noteID = freezed,
    Object? files = null,
    Object? reminders = null,
  }) {
    return _then(_$NoteAddStateImpl(
      coupleDB: freezed == coupleDB
          ? _value.coupleDB
          : coupleDB // ignore: cast_nullable_to_non_nullable
              as CoupleDB?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isButtonSaveEnabled: freezed == isButtonSaveEnabled
          ? _value.isButtonSaveEnabled!
          : isButtonSaveEnabled,
      noteID: freezed == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as StateList<NoteFile>,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as StateList<Reminder>,
    ));
  }
}

/// @nodoc

class _$NoteAddStateImpl implements _NoteAddState {
  const _$NoteAddStateImpl(
      {this.coupleDB,
      this.title = "",
      this.description,
      this.isButtonSaveEnabled = false,
      this.noteID,
      required this.files,
      required this.reminders});

  @override
  final CoupleDB? coupleDB;
  @override
  @JsonKey()
  final String title;
  @override
  final String? description;
  @override
  @JsonKey()
  final dynamic isButtonSaveEnabled;
  @override
  final int? noteID;
  @override
  final StateList<NoteFile> files;
  @override
  final StateList<Reminder> reminders;

  @override
  String toString() {
    return 'NoteAddState(coupleDB: $coupleDB, title: $title, description: $description, isButtonSaveEnabled: $isButtonSaveEnabled, noteID: $noteID, files: $files, reminders: $reminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteAddStateImpl &&
            (identical(other.coupleDB, coupleDB) ||
                other.coupleDB == coupleDB) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.isButtonSaveEnabled, isButtonSaveEnabled) &&
            (identical(other.noteID, noteID) || other.noteID == noteID) &&
            (identical(other.files, files) || other.files == files) &&
            (identical(other.reminders, reminders) ||
                other.reminders == reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      coupleDB,
      title,
      description,
      const DeepCollectionEquality().hash(isButtonSaveEnabled),
      noteID,
      files,
      reminders);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteAddStateImplCopyWith<_$NoteAddStateImpl> get copyWith =>
      __$$NoteAddStateImplCopyWithImpl<_$NoteAddStateImpl>(this, _$identity);
}

abstract class _NoteAddState implements NoteAddState {
  const factory _NoteAddState(
      {final CoupleDB? coupleDB,
      final String title,
      final String? description,
      final dynamic isButtonSaveEnabled,
      final int? noteID,
      required final StateList<NoteFile> files,
      required final StateList<Reminder> reminders}) = _$NoteAddStateImpl;

  @override
  CoupleDB? get coupleDB;
  @override
  String get title;
  @override
  String? get description;
  @override
  dynamic get isButtonSaveEnabled;
  @override
  int? get noteID;
  @override
  StateList<NoteFile> get files;
  @override
  StateList<Reminder> get reminders;
  @override
  @JsonKey(ignore: true)
  _$$NoteAddStateImplCopyWith<_$NoteAddStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
