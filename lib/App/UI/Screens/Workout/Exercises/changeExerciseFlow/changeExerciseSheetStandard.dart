import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import 'change_exercise_controller_cubit.dart';

class ChangeExerciseStandardSheet extends StatefulWidget {
  const ChangeExerciseStandardSheet({Key? key}) : super(key: key);

  final String title = "Change Exercise";

  @override
  State<ChangeExerciseStandardSheet> createState() =>
      _ChangeExerciseStandardSheetState();
}

class _ChangeExerciseStandardSheetState
    extends State<ChangeExerciseStandardSheet> {
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
          children: const [
            _Content(),
            _Attachments(),
          ],
        ));
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      .read<ChangeExerciseControllerCubit>()
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
                      .read<ChangeExerciseControllerCubit>()
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
                      .read<ChangeExerciseControllerCubit>()
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
                      .read<ChangeExerciseControllerCubit>()
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
    );
  }
}

class _Attachments extends StatelessWidget {
  const _Attachments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        _Footer(),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        child: const Text("Change Details"),
                        onPressed: () {
                          context
                              .read<ChangeExerciseControllerCubit>()
                              .detailSheet();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: OutlinedButton(
                        onPressed: () {
                          context
                              .read<ChangeExerciseControllerCubit>()
                              .save();

                          Routemaster.of(context).popUntil(
                              (routeData) =>
                                  routeData.fullPath == '/');
                        },
                        child: const Text("Save"),
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
    );
  }
}
