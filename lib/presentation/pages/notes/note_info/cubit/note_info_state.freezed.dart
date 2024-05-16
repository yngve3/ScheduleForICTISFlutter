// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NoteInfoState {
  CoupleDB? get coupleDB => throw _privateConstructorUsedError;
  int get noteID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<NoteFile> get files => throw _privateConstructorUsedError;
  List<Reminder> get reminders => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteInfoStateCopyWith<NoteInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteInfoStateCopyWith<$Res> {
  factory $NoteInfoStateCopyWith(
          NoteInfoState value, $Res Function(NoteInfoState) then) =
      _$NoteInfoStateCopyWithImpl<$Res, NoteInfoState>;
  @useResult
  $Res call(
      {CoupleDB? coupleDB,
      int noteID,
      String title,
      String? description,
      List<NoteFile> files,
      List<Reminder> reminders});
}

/// @nodoc
class _$NoteInfoStateCopyWithImpl<$Res, $Val extends NoteInfoState>
    implements $NoteInfoStateCopyWith<$Res> {
  _$NoteInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupleDB = freezed,
    Object? noteID = null,
    Object? title = null,
    Object? description = freezed,
    Object? files = null,
    Object? reminders = null,
  }) {
    return _then(_value.copyWith(
      coupleDB: freezed == coupleDB
          ? _value.coupleDB
          : coupleDB // ignore: cast_nullable_to_non_nullable
              as CoupleDB?,
      noteID: null == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<NoteFile>,
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteInfoStateImplCopyWith<$Res>
    implements $NoteInfoStateCopyWith<$Res> {
  factory _$$NoteInfoStateImplCopyWith(
          _$NoteInfoStateImpl value, $Res Function(_$NoteInfoStateImpl) then) =
      __$$NoteInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CoupleDB? coupleDB,
      int noteID,
      String title,
      String? description,
      List<NoteFile> files,
      List<Reminder> reminders});
}

/// @nodoc
class __$$NoteInfoStateImplCopyWithImpl<$Res>
    extends _$NoteInfoStateCopyWithImpl<$Res, _$NoteInfoStateImpl>
    implements _$$NoteInfoStateImplCopyWith<$Res> {
  __$$NoteInfoStateImplCopyWithImpl(
      _$NoteInfoStateImpl _value, $Res Function(_$NoteInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coupleDB = freezed,
    Object? noteID = null,
    Object? title = null,
    Object? description = freezed,
    Object? files = null,
    Object? reminders = null,
  }) {
    return _then(_$NoteInfoStateImpl(
      coupleDB: freezed == coupleDB
          ? _value.coupleDB
          : coupleDB // ignore: cast_nullable_to_non_nullable
              as CoupleDB?,
      noteID: null == noteID
          ? _value.noteID
          : noteID // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<NoteFile>,
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<Reminder>,
    ));
  }
}

/// @nodoc

class _$NoteInfoStateImpl implements _NoteInfoState {
  const _$NoteInfoStateImpl(
      {this.coupleDB,
      this.noteID = 0,
      this.title = "",
      this.description,
      final List<NoteFile> files = const [],
      final List<Reminder> reminders = const []})
      : _files = files,
        _reminders = reminders;

  @override
  final CoupleDB? coupleDB;
  @override
  @JsonKey()
  final int noteID;
  @override
  @JsonKey()
  final String title;
  @override
  final String? description;
  final List<NoteFile> _files;
  @override
  @JsonKey()
  List<NoteFile> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

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
    return 'NoteInfoState(coupleDB: $coupleDB, noteID: $noteID, title: $title, description: $description, files: $files, reminders: $reminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteInfoStateImpl &&
            (identical(other.coupleDB, coupleDB) ||
                other.coupleDB == coupleDB) &&
            (identical(other.noteID, noteID) || other.noteID == noteID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      coupleDB,
      noteID,
      title,
      description,
      const DeepCollectionEquality().hash(_files),
      const DeepCollectionEquality().hash(_reminders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteInfoStateImplCopyWith<_$NoteInfoStateImpl> get copyWith =>
      __$$NoteInfoStateImplCopyWithImpl<_$NoteInfoStateImpl>(this, _$identity);
}

abstract class _NoteInfoState implements NoteInfoState {
  const factory _NoteInfoState(
      {final CoupleDB? coupleDB,
      final int noteID,
      final String title,
      final String? description,
      final List<NoteFile> files,
      final List<Reminder> reminders}) = _$NoteInfoStateImpl;

  @override
  CoupleDB? get coupleDB;
  @override
  int get noteID;
  @override
  String get title;
  @override
  String? get description;
  @override
  List<NoteFile> get files;
  @override
  List<Reminder> get reminders;
  @override
  @JsonKey(ignore: true)
  _$$NoteInfoStateImplCopyWith<_$NoteInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
