import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../route/router.dart';
import '../theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('ru', 'RU')
      ],
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: AppRouter.router,
    );
  }
}