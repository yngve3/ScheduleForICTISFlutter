import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/auth_interactor.dart';

import 'cubit/registration_page_state.dart';

class RegistrationPageCubit extends Cubit<RegistrationPageState> {
  RegistrationPageCubit() : super(const RegistrationPageState());

  final _interactor = AuthInteractor();

}
