import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_for_ictis_flutter/data/database/object_box.dart';
import 'package:schedule_for_ictis_flutter/presentation/app/app.dart';
import 'package:schedule_for_ictis_flutter/utils/reminders_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  RemindersHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(const App());
}
