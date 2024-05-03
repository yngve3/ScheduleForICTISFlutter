import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  bool get isLogin => FirebaseAuth.instance.currentUser != null;
  String? get uid => FirebaseAuth.instance.currentUser?.uid;
}