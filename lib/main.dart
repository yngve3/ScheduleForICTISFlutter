import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:schedule_for_ictis_flutter/data/database/object_box.dart';
import 'package:schedule_for_ictis_flutter/presentation/route/router.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/light_theme.dart';


late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const App());
}

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