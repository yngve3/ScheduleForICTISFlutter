import '../models/auth/auth_model.dart';

class ValidationException implements Exception {
  final ValidationResult validationResult;
  ValidationException(this.validationResult);
}

class AuthValidator {
  ValidationResult validate(AuthModel authModel) {
    final emailValidator = EmailValidator();
    final passwordValidator = PasswordValidator();

    final emailValidationResult = emailValidator.validate(authModel.email);
    final passwordValidationResult = passwordValidator.validate(authModel.password);

    List<ValidationError> errors = [];
    if (emailValidationResult != null) errors.add(emailValidationResult);
    if (passwordValidationResult != null) errors.add(passwordValidationResult);

    return ValidationResult(errors);
  }
}

class EmailValidator {
  ValidationError? validate(String email) {
    final RegExp regExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (regExp.hasMatch(email)) return null;
    return const ValidationError("email");
  }
}

class PasswordValidator {
  ValidationError? validate(String password) {
    if (password.length < 6) return const ValidationError("password");
    return null;
  }
}

class ValidationError {
  final String error;

  const ValidationError(this.error);
}

class ValidationResult {
  final List<ValidationError> errors;

  ValidationResult(this.errors);

  bool get isValid => errors.isEmpty;
  bool get isNotValid => errors.isNotEmpty;
}