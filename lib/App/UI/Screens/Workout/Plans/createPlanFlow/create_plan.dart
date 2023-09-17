import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_controller_cubit.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/createPlanFlow/create_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePlan extends StatelessWidget {
  const CreatePlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePlanControllerCubit(),
      child: const CreatePlanView(),
    );
  }
}
