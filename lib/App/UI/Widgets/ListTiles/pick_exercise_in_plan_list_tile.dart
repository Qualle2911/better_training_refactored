import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/changePlanFlow/change_plan_controller_cubit.dart';
import 'package:better_training_refactored/DB/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PickExercisePlanListTile extends StatefulWidget {
  const PickExercisePlanListTile(
      {Key? key,
        required this.uebung,
        required this.onSelected,
        required this.onDeselected})
      : super(key: key);
  final UebungenData uebung;
  final VoidCallback onSelected;
  final VoidCallback onDeselected;

  @override
  State<PickExercisePlanListTile> createState() => _PickExercisePlanListTileState();
}

class _PickExercisePlanListTileState extends State<PickExercisePlanListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.uebung.name),
      subtitle: Text(widget.uebung.subinfo ?? ""),
      trailing: Checkbox(
          value: context
              .read<ChangePlanControllerCubit>()
              .selectedExercises
              .contains(widget.uebung),
          onChanged: (value) {
            if (value == true) {
              widget.onSelected();
            } else {
              widget.onDeselected();
            }

            setState(() {});
          }),
    );
  }
}