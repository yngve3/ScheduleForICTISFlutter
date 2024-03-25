import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../route/router.dart';
import '../theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ru_RU', null);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}