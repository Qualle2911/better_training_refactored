import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/createExerciseFlow/createExerciseSheetDetail.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/createExerciseFlow/createExerciseSheetStandard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_exercise_controller_cubit.dart';

class CreateExercise extends StatefulWidget {
  const CreateExercise({Key? key}) : super(key: key);

  @override
  State<CreateExercise> createState() => _CreateExerciseState();
}

class _CreateExerciseState extends State<CreateExercise> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateExerciseControllerCubit(),
      child: const CreateExerciseView(),
    );
  }
}

class CreateExerciseView extends StatefulWidget {
  const CreateExerciseView({Key? key}) : super(key: key);

  final Widget pickingMusclesSheet = const CreateExerciseDetailSheet();
  final Widget takingInputSheet = const CreateExerciseStandardSheet();

  @override
  State<CreateExerciseView> createState() => _CreateExerciseViewState();
}

class _CreateExerciseViewState extends State<CreateExerciseView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateExerciseControllerCubit,
        CreateExerciseControllerState>(builder: (context, state) {
      var stateSnapshot = state;
      if (stateSnapshot is CreateExerciseControllerTakingInput) {
        return widget.takingInputSheet;
      } else if (stateSnapshot is CreateExerciseControllerPickingMuscles) {
        return widget.pickingMusclesSheet;
      } else if (stateSnapshot is CreateExerciseControllerLoading) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      }
    });
  }
}
