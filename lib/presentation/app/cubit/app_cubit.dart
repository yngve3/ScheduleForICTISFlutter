import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/utils/preferences_helper.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(ThemeMode mode) : super(AppState(mode: mode));

  void changeThemeMode(ThemeMode mode) {
    if (mode == state.mode) return;
    PreferencesHelper.setThemeMode(mode);
    emit(state.copyWith(mode: mode));
  }
}
