

import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/exercises_cubit.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/plan_cubit.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class ExpandablePlan extends StatefulWidget {
  final Logger _logger = getIt<Env>().logger;
  ExpandablePlan(
      {Key? key,
      required this.collapsedChild,
      required this.expandedChild,
      required this.id,
      required this.planId})
      : super(key: key);
  final Widget collapsedChild;
  final Widget expandedChild;
  final int id;
  final int planId;

  @override
  State<ExpandablePlan> createState() => _ExpandablePlanState();
}

class _ExpandablePlanState extends State<ExpandablePlan> {
  void toggleExpanded() {
    widget._logger.d("toggleExpanded");
    context.read<PlanCubit>().changeCurrentPlan(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    bool isExpanded = context.read<PlanCubit>().currentPlan == widget.id;
    return isExpanded ? widget.expandedChild : widget.collapsedChild;
  }
}

class ExpandableExercise extends StatefulWidget {
  final Logger _logger = getIt<Env>().logger;
  ExpandableExercise({
    Key? key,
    required this.collapsedChild,
    required this.expandedChild,
    required this.id,
    required this.exerciseId,
  }) : super(key: key);
  final Widget collapsedChild;
  final Widget expandedChild;
  final int id;
  final int exerciseId;

  @override
  State<ExpandableExercise> createState() => _ExpandableExerciseState();
}

class _ExpandableExerciseState extends State<ExpandableExercise> {
  void toggleExpanded() {
    widget._logger.d("toggleExpanded $widget.id ");
    context.read<ExercisesCubit>().selectExercise(widget.id);

  }

  @override
  Widget build(BuildContext context) {
    bool isExpanded =
        context.read<ExercisesCubit>().selectedExercise == widget.id;
    return isExpanded ? widget.expandedChild : widget.collapsedChild;
  }
}
