
import 'package:better_training_refactored/App/UI/Widgets/ListTiles/list_tile_impacts_muscles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

import 'create_exercise_controller_cubit.dart';



class CreateExerciseDetailSheet extends StatefulWidget {
   const CreateExerciseDetailSheet({Key? key}) : super(key: key);

  final String titleAddDetails = "Add Details";





  @override
  State<CreateExerciseDetailSheet> createState() => _CreateExerciseDetailSheetState();
}


class _CreateExerciseDetailSheetState extends State<CreateExerciseDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<CreateExerciseControllerCubit>().standardSheet();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Center(child: Text(widget.titleAddDetails)),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Routemaster.of(context).popUntil((routeData) => routeData.fullPath == '/');
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
                  children:  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: ListView(
                          shrinkWrap: true,
                          children: context.read<CreateExerciseControllerCubit>().muscles.keys.map((e) {
                            return ListTileImpactsMuscle(
                              title: e,
                              onChanged: () {
                                context.read<CreateExerciseControllerCubit>().toggleMuscle(e, CreateExerciseControllerPickingMuscles());
                                setState(() {

                                });
                              },
                              isPicked: context.read<CreateExerciseControllerCubit>().isPicked(e),
                            );
                          }).toList(),
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
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: OutlinedButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Routemaster.of(context).popUntil((routeData) => routeData.fullPath == '/');
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: FilledButton(
                              child: const Text("Add Exercise"),
                              onPressed: () {
                                context.read<CreateExerciseControllerCubit>().save();
                                Routemaster.of(context).popUntil((routeData) => routeData.fullPath == '/');
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
