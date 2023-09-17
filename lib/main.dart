
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:flutter/material.dart';
import 'App/app.dart';







void main() async {
  configureDependencies(Env.dev);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MediaQuery(data: const MediaQueryData(), child: MyApp()));
}
