import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import 'create_plan_controller_cubit.dart';

class MyExerciseListTile extends StatefulWidget {
  const MyExerciseListTile(
      {Key? key,
      required this.id,
      required this.onSelected,
      required this.exerciseName,
      required this.exerciseInfo,
      required this.onDeselected})
      : super(key: key);
  final int id;
  final VoidCallback onSelected;
  final VoidCallback onDeselected;
  final String exerciseName;
  final String exerciseInfo;

  @override
  State<MyExerciseListTile> createState() => _MyExerciseListTileState();
}

class _MyExerciseListTileState extends State<MyExerciseListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.exerciseName),
      subtitle: Text(widget.exerciseInfo),
      trailing: Checkbox(
          value: context
              .read<CreatePlanControllerCubit>()
              .selectedExercises
              .contains(widget.exerciseName),
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

class CreatePlanDetailSheet extends StatefulWidget {
  const CreatePlanDetailSheet({Key? key}) : super(key: key);

  final String title = "Add Exercises";

  @override
  State<CreatePlanDetailSheet> createState() => _CreatePlanDetailSheetState();
}

class _CreatePlanDetailSheetState extends State<CreatePlanDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<CreatePlanControllerCubit>().takingInput();
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
                          context.read<CreatePlanControllerCubit>().loadExercises(
                              CreatePlanControllerPickingExercise());
                          // close keyboard
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: context
                            .read<CreatePlanControllerCubit>()
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
                              .read<CreatePlanControllerCubit>()
                              .exercises
                              .length,
                          itemBuilder: (context, index) {
                            return MyExerciseListTile(
                              id: index,
                              exerciseName: context
                                  .read<CreatePlanControllerCubit>()
                                  .exercises[index]
                                  .name,
                              exerciseInfo: "Info",
                              onSelected: () {
                                context
                                    .read<CreatePlanControllerCubit>()
                                    .addExercise(context
                                    .read<CreatePlanControllerCubit>()
                                    .exercises[index]
                                    .name);
                              },
                              onDeselected: () {
                                context
                                    .read<CreatePlanControllerCubit>()
                                    .removeExercise(context
                                    .read<CreatePlanControllerCubit>()
                                    .exercises[index]
                                    .name);
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
                                context.read<CreatePlanControllerCubit>().save();
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
