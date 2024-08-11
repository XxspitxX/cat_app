import 'package:cat_app/cat_app.dart';
import 'package:cat_app/dependency_injection/cat_di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const CatApp());
}
