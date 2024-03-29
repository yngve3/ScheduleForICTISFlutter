import 'package:flutter/material.dart';
import 'package:schedule_for_ictis_flutter/data/database/object_box.dart';
import 'package:schedule_for_ictis_flutter/presentation/app/app.dart';


late ObjectBox objectBox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const App());
}