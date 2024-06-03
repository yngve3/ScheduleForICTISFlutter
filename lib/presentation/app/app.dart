import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:schedule_for_ictis_flutter/utils/preferences_helper.dart';

import '../route/router.dart';
import '../theme/light_theme.dart';
import 'cubit/app_cubit.dart';
import 'cubit/app_state.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.themeMode
  });

  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(themeMode),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            supportedLocales: const [
              Locale('ru', 'RU')
            ],
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            routerConfig: AppRouter.router,
            themeMode: state.mode,
          );
        },
      ),
    );
  }
}