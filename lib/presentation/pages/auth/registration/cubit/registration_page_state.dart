import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_page_state.freezed.dart';

@freezed
class RegistrationPageState with _$RegistrationPageState {
  const factory RegistrationPageState({
    @Default(false) bool isRegister,
    @Default("") String errorMessage
  }) = _RegistrationPageState;
}
