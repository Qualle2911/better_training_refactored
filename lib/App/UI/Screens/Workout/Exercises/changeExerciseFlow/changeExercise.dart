import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/changeExerciseFlow/changeExerciseSheetStandard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'changeExerciseSheetDetail.dart';
import 'change_exercise_controller_cubit.dart';

class ChangeExercise extends StatefulWidget {
  const ChangeExercise({Key? key}) : super(key: key);

  static int id = -1;

  @override
  State<ChangeExercise> createState() => _ChangeExerciseState();


}


class _ChangeExerciseState extends State<ChangeExercise> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeExerciseControllerCubit(ChangeExercise.id),
      child:  const ChangeExerciseView(),
    );
  }
}

class ChangeExerciseView extends StatefulWidget {
   const ChangeExerciseView({Key? key}) : super(key: key);

  final Widget pickingMusclesSheet = const ChangeExerciseDetailSheet();
  final Widget takingInputSheet = const ChangeExerciseStandardSheet();

  @override
  State<ChangeExerciseView> createState() => _ChangeExerciseViewState();
}

class _ChangeExerciseViewState extends State<ChangeExerciseView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeExerciseControllerCubit,
        ChangeExerciseControllerState>(builder: (context, state) {
      var stateSnapshot = state;
      if (stateSnapshot is ChangeExerciseControllerTakingInput) {
        return widget.takingInputSheet;
      } else if (stateSnapshot is ChangeExerciseControllerPickingMuscles) {
        return widget.pickingMusclesSheet;
      } else if (stateSnapshot is ChangeExerciseControllerLoading) {
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
