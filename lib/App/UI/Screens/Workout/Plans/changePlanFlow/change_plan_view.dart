import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'changePlanSheetDetail.dart';
import 'changePlanSheetStandard.dart';
import 'change_plan_controller_cubit.dart';

class ChangePlanView extends StatefulWidget {
  const ChangePlanView({Key? key}) : super(key: key);

  final Widget pickingExerciseSheet = const ChangePlanDetailSheet();
  final Widget takingInputSheet = const ChangePlanStandardSheet();

  @override
  State<ChangePlanView> createState() => _ChangePlanViewState();
}

class _ChangePlanViewState extends State<ChangePlanView> {
  @override
  Widget build(BuildContext context) {
    context.read<ChangePlanControllerCubit>().loadPlan();
    return BlocBuilder<ChangePlanControllerCubit, ChangePlanControllerState>(
        builder: (context, state) {
      var stateSnapshot = state;
      if (stateSnapshot is ChangePlanControllerTakingInput) {
        return widget.takingInputSheet;
      } else if (stateSnapshot is ChangePlanControllerPickingExercise) {
        return widget.pickingExerciseSheet;
      } else if (stateSnapshot is ChangePlanControllerLoading ||
          stateSnapshot is ChangePlanControllerLoaded) {
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
