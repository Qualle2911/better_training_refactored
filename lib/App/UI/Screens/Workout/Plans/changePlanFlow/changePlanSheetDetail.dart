import 'dart:ui';

import 'package:better_training_refactored/App/UI/Widgets/ListTiles/pick_exercise_in_plan_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import 'change_plan_controller_cubit.dart';



class ChangePlanDetailSheet extends StatefulWidget {
  const ChangePlanDetailSheet({Key? key}) : super(key: key);

  final String title = "Change Exercises";

  @override
  State<ChangePlanDetailSheet> createState() => _ChangePlanDetailSheetState();
}

class _ChangePlanDetailSheetState extends State<ChangePlanDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<ChangePlanControllerCubit>().takingInput();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Center(child: Text(widget.title)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Routemaster.of(context)
                  .popUntil((routeData) => routeData.fullPath == '/');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: TextFormField(
                        onEditingComplete: () {
                          context
                              .read<ChangePlanControllerCubit>()
                              .loadExercisesWithSearch(
                                  ChangePlanControllerPickingExercise());
                          // close keyboard
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: context
                            .read<ChangePlanControllerCubit>()
                            .nameSearchController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                      child: SizedBox(
                        height:
                            MediaQueryData.fromWindow(window).size.height * 0.6,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: context
                              .read<ChangePlanControllerCubit>()
                              .exercisesData
                              .length,
                          itemBuilder: (context, index) {
                            return PickExercisePlanListTile(
                              uebung: context
                                  .read<ChangePlanControllerCubit>()
                                  .exercisesData[index],
                              onSelected: () {
                                context
                                    .read<ChangePlanControllerCubit>()
                                    .pickedExercise(context
                                        .read<ChangePlanControllerCubit>()
                                        .exercisesData[index]);
                              },
                              onDeselected: () {
                                context
                                    .read<ChangePlanControllerCubit>()
                                    .pickedExercise(context
                                        .read<ChangePlanControllerCubit>()
                                        .exercisesData[index]);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    //Textfields
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: Theme.of(context).hintColor,
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: OutlinedButton(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text("Cancel"),
                                ],
                              ),
                              onPressed: () {
                                Routemaster.of(context).popUntil(
                                    (routeData) => routeData.fullPath == '/');
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: FilledButton(
                              child: SizedBox(
                                width: 65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Save"),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<ChangePlanControllerCubit>()
                                    .save();

                                Routemaster.of(context).pop('/');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Buttons
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
