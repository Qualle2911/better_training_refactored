import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import 'change_plan_controller_cubit.dart';

class ChangePlanStandardSheet extends StatefulWidget {
  const ChangePlanStandardSheet({Key? key}) : super(key: key);

  final String title = "Change Your Plan";

  @override
  State<ChangePlanStandardSheet> createState() =>
      _ChangePlanStandardSheetState();
}

class _ChangePlanStandardSheetState extends State<ChangePlanStandardSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              .read<ChangePlanControllerCubit>()
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
                              .read<ChangePlanControllerCubit>()
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
                              .read<ChangePlanControllerCubit>()
                              .descriptionController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description',
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
                              child: OutlinedButton(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("Change Exercises"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Icon(Icons.arrow_forward),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  context
                                      .read<ChangePlanControllerCubit>()
                                      .selectExercises();
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
        ));
  }
}
