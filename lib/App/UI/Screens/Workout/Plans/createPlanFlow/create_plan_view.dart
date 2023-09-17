
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_controller_cubit.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_sheet_detail.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_sheet_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePlanView extends StatefulWidget {
  const CreatePlanView({Key? key}) : super(key: key);

  final Widget pickingExerciseSheet = const CreatePlanDetailSheet();
  final Widget takingInputSheet = const CreatePlanStandardSheet();

  @override
  State<CreatePlanView> createState() => _CreatePlanViewState();
}

class _CreatePlanViewState extends State<CreatePlanView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePlanControllerCubit, CreatePlanControllerState>(
        builder: (context, state) {
      var stateSnapshot = state;
      if (stateSnapshot is CreatePlanControllerTakingInput) {
        return widget.takingInputSheet;
      } else if (stateSnapshot is CreatePlanControllerPickingExercise) {
        return widget.pickingExerciseSheet;
      } else if (stateSnapshot is CreatePlanControllerLoading ||
          stateSnapshot is CreatePlanControllerLoaded) {
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
