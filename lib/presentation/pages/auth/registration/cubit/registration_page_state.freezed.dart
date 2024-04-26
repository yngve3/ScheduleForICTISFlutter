// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationPageState {
  bool get isRegister => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationPageStateCopyWith<RegistrationPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationPageStateCopyWith<$Res> {
  factory $RegistrationPageStateCopyWith(RegistrationPageState value,
          $Res Function(RegistrationPageState) then) =
      _$RegistrationPageStateCopyWithImpl<$Res, RegistrationPageState>;
  @useResult
  $Res call({bool isRegister, String errorMessage});
}

/// @nodoc
class _$RegistrationPageStateCopyWithImpl<$Res,
        $Val extends RegistrationPageState>
    implements $RegistrationPageStateCopyWith<$Res> {
  _$RegistrationPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegister = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      isRegister: null == isRegister
          ? _value.isRegister
          : isRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationPageStateImplCopyWith<$Res>
    implements $RegistrationPageStateCopyWith<$Res> {
  factory _$$RegistrationPageStateImplCopyWith(
          _$RegistrationPageStateImpl value,
          $Res Function(_$RegistrationPageStateImpl) then) =
      __$$RegistrationPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isRegister, String errorMessage});
}

/// @nodoc
class __$$RegistrationPageStateImplCopyWithImpl<$Res>
    extends _$RegistrationPageStateCopyWithImpl<$Res,
        _$RegistrationPageStateImpl>
    implements _$$RegistrationPageStateImplCopyWith<$Res> {
  __$$RegistrationPageStateImplCopyWithImpl(_$RegistrationPageStateImpl _value,
      $Res Function(_$RegistrationPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRegister = null,
    Object? errorMessage = null,
  }) {
    return _then(_$RegistrationPageStateImpl(
      isRegister: null == isRegister
          ? _value.isRegister
          : isRegister // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationPageStateImpl implements _RegistrationPageState {
  const _$RegistrationPageStateImpl(
      {this.isRegister = true, this.errorMessage = ""});

  @override
  @JsonKey()
  final bool isRegister;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'RegistrationPageState(isRegister: $isRegister, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationPageStateImpl &&
            (identical(other.isRegister, isRegister) ||
                other.isRegister == isRegister) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRegister, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationPageStateImplCopyWith<_$RegistrationPageStateImpl>
      get copyWith => __$$RegistrationPageStateImplCopyWithImpl<
          _$RegistrationPageStateImpl>(this, _$identity);
}

abstract class _RegistrationPageState implements RegistrationPageState {
  const factory _RegistrationPageState(
      {final bool isRegister,
      final String errorMessage}) = _$RegistrationPageStateImpl;

  @override
  bool get isRegister;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationPageStateImplCopyWith<_$RegistrationPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
