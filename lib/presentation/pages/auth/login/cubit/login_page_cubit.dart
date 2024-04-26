import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/auth_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/auth_interactor.dart';

import '../../../../../domain/models/auth/auth_model.dart';
import 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());

  final AuthInteractor _interactor = AuthInteractor();

  void logIn({required String email, required String password}) async{
    try {
      await _interactor.logIn(AuthModel(email: email, password: password));

      emit(const LoginPageState(isLogin: true, errorMessage: ""));
    } on ValidationException catch (_) {
      emit(const LoginPageState(isLogin: false, errorMessage: "Неправильное имя пользователя или пароль"));
    } on AuthException catch (e) {
      if (e.code == "network-request-failed") {
        emit(const LoginPageState(isLogin: false, errorMessage: "Проблемы с сетью"));
      } else {
        emit(const LoginPageState(isLogin: false, errorMessage: "Неправильное имя пользователя или пароль"));
      }
    } finally {
      emit(state.copyWith(errorMessage: ""));
    }
  }
}
