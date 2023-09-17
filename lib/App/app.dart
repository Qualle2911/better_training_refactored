import 'package:better_training_refactored/App/Dashboard/dashboard.dart';
import 'package:better_training_refactored/App/UI/ColorScheme/color_schemes.g.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/changeExerciseFlow/changeExercise.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/createExerciseFlow/createExercise.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/changePlanFlow/change_plan.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Workouts/session/session.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Workouts/view_page.dart';

import 'package:routemaster/routemaster.dart';


import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';



class MyApp extends StatelessWidget {
  final routes = RouteMap(
    routes: {
      '/': (_) =>  const MaterialPage(child: MyWorkoutView()),
      '/2': (_) =>  const MaterialPage(child: MyWorkoutView()),
      '/3': (_) =>  const MaterialPage(child: MyWorkoutView()),
      '/createPlanSheet': (_) => const MaterialPage(child: CreatePlan()),
      '/changePlan': (_) => const MaterialPage(child: ChangePlan()),
      '/createExercise': (_) => const MaterialPage(child: CreateExercise()),
      '/changeExercise': (_) => const MaterialPage(child: ChangeExercise()),
      '/dashboard': (_) => MaterialPage(child: DashboardPage(title: "title")),
      '/session/:id': (info) =>  MaterialPage(child: MySession(planId: info.pathParameters['id'],)),
    },
  );

  MyApp({super.key});
  final Logger logger = getIt<Env>().logger;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    logger.i("App Build");
    ColorScheme theming =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? MyColorScheme.darkColorScheme
            : MyColorScheme.lightColorScheme;
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: theming,
        useMaterial3: true,
      ),
      routeInformationParser: const RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(
        routesBuilder: (_) => routes,
      ),
    );
  }
}
