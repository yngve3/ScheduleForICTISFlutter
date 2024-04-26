import 'package:schedule_for_ictis_flutter/data/repositories/auth_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/models/auth/auth_model.dart';
import 'package:schedule_for_ictis_flutter/domain/validators/auth_validator.dart';

class ValidationException implements Exception {
  final ValidationResult validationResult;
  ValidationException(this.validationResult);
}

class AuthInteractor {
  final _authRepository = AuthRepository();

  Future<void> logIn(AuthModel authModel) async {
    final AuthValidator validator = AuthValidator();
    final validationResult = validator.validate(authModel);

    if (validationResult.isNotValid) {
      throw ValidationException(validationResult);
    }

    try {
      await _authRepository.logInWithEmailAndPassword(authModel);
    } on AuthException catch(_) {
      rethrow;
    }
  }

  Future<void> register(AuthModel authModel) async {
    final AuthValidator validator = AuthValidator();
    final validationResult = validator.validate(authModel);

    if (validationResult.isNotValid) {
      throw ValidationException(validationResult);
    }

    try {
      await _authRepository.registerWithEmailAndPassword(authModel);
    } on AuthException catch(_) {
      rethrow;
    }
  }
}