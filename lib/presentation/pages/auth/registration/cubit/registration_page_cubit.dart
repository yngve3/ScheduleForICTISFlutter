import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/auth_repository.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/auth_interactor.dart';
import 'package:schedule_for_ictis_flutter/domain/models/auth/auth_model.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/auth/registration/cubit/registration_page_state.dart';

class RegistrationPageCubit extends Cubit<RegistrationPageState> {
  RegistrationPageCubit() : super(const RegistrationPageState());

  final _interactor = AuthInteractor();

  void register({required String email, required String password}) async {
    try {
      await _interactor.register(AuthModel(email: email, password: password));
      emit(state.copyWith(isRegister: true));
    } on ValidationException catch (e) {
      emit(const RegistrationPageState(isRegister: false, errorMessage: "Неправильное имя пользователя или пароль"));
    } on AuthException catch (e) {
      if (e.code == "network-request-failed") {
        emit(const RegistrationPageState(isRegister: false, errorMessage: "Проблемы с сетью"));
      } else if (e.code == "email-already-in-use") {
        emit(const RegistrationPageState(isRegister: false, errorMessage: "Email уже занят"));
      }
    }
  }
}
