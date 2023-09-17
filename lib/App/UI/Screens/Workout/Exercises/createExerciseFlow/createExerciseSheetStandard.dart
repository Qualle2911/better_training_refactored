import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/createExerciseFlow/create_exercise_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class CreateExerciseStandardSheet extends StatefulWidget {
  const CreateExerciseStandardSheet({Key? key}) : super(key: key);

  final String title = "Create Exercise";

  @override
  State<CreateExerciseStandardSheet> createState() =>
      _CreateExerciseStandardSheetState();
}

class _CreateExerciseStandardSheetState
    extends State<CreateExerciseStandardSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: const SizedBox(),
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        child: TextField(
                          controller: context
                              .read<CreateExerciseControllerCubit>()
                              .nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Title',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                        child: TextField(
                          controller: context
                              .read<CreateExerciseControllerCubit>()
                              .subinfoController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Subinfo',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                        child: TextField(
                          controller: context
                              .read<CreateExerciseControllerCubit>()
                              .descriptionController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 24, 12, 0),
                        child: TextField(
                          controller: context
                              .read<CreateExerciseControllerCubit>()
                              .commentController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Comment',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text("Attachments: "),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.sticky_note_2,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.sticky_note_2,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.add_a_photo,
                                          size: 40,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
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
                                        padding: const EdgeInsets.only(right: 12),
                                        child: FilledButton(
                                          child: const Text("Add Details"),
                                          onPressed: () {
                                            context
                                                .read<CreateExerciseControllerCubit>()
                                                .detailSheet();
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 12),
                                        child: OutlinedButton(
                                          onPressed: () {
                                            context
                                                .read<CreateExerciseControllerCubit>()
                                                .save();

                                            Routemaster.of(context).popUntil(
                                                (routeData) => routeData.fullPath == '/');
                                          },
                                          child: const Text("Add Exercise"),
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
                ),
              ],
            ),
          ],
        ));
  }
}
