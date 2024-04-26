import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/auth/auth_model.dart';

class UserNotFoundException implements Exception {}
class WrongPasswordException implements Exception {}
class WeakPasswordException implements Exception {}
class EmailAlreadyInUseException implements Exception {}
class UnknownException implements Exception {}

class AuthException implements Exception {
  final String code;

  const AuthException(this.code);
}

class AuthRepository {
  Future<void> logInWithEmailAndPassword(AuthModel authModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: authModel.email,
          password: authModel.password
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> registerWithEmailAndPassword(AuthModel authModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }
}