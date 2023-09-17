import 'package:better_training_refactored/App/UI/Screens/Workout/Workouts/session/session_cubit.dart';
import 'package:better_training_refactored/App/UI/Widgets/Cards/SessionCard/set_tracker.dart';
import 'package:better_training_refactored/DB/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_set_tracker.dart';

class SessionExerciseCard extends StatefulWidget {
  const SessionExerciseCard(
      {Key? key, required this.uebung, required this.posInList})
      : super(key: key);
  final int posInList;

  final UebungenData uebung;

  @override
  State<SessionExerciseCard> createState() => _SessionExerciseCardState();
}

class _SessionExerciseCardState extends State<SessionExerciseCard> {
  void addSet() {
    TextEditingController reps = TextEditingController();
    TextEditingController weight = TextEditingController();
    int setNrRaw = context
        .read<SessionCubit>()
        .exerciseInformation[widget.posInList]
        .setInformation
        .length;

    setList.insert(
        setList.length,
        SetTracker(
          setNr: (setNrRaw + 1).toString(),
          save: () {
            context.read<SessionCubit>().addSet(
                widget.posInList, setNrRaw, reps.value.text, weight.value.text);
          },
          repsController: reps,
          weightController: weight,
        ));
  }

  late List<Widget> setList;

  @override
  Widget build(BuildContext context) {
    setList = [];

    List<SetInformation> setInfos = context
        .read<SessionCubit>()
        .exerciseInformation[widget.posInList]
        .setInformation;

    for (int i = 0; i < setInfos.length; i++) {
      TextEditingController weight = TextEditingController();
      TextEditingController reps = TextEditingController();

      weight.text = setInfos[i].weight;
      reps.text = setInfos[i].reps;

      setList.add(SetTracker(
        setNr: (i + 1).toString(),
        save: () {
          context
              .read<SessionCubit>()
              .addSet(widget.posInList, i, reps.value.text, weight.value.text);
        },
        repsController: reps,
        weightController: weight,
      ));
    }

    return Card(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Text(widget.uebung.name),
              subtitle: Text(widget.uebung.subinfo ?? ''),
            ), //!= null ? Text(data.subinfo!) : null
            const Padding(
              padding: EdgeInsets.all(2),
              child: Divider(
                height: 2,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var set in setList) set,
                    AddSetTracker(onPressed: () {
                      setState(() {
                        addSet();
                        context.read<SessionCubit>().addSet(
                            widget.posInList,
                            context
                                .read<SessionCubit>()
                                .exerciseInformation[widget.posInList]
                                .setInformation
                                .length,
                            '10',
                            '120');
                      });
                    }),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2),
              child: Divider(
                height: 2,
              ),
            ),
            Column(
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Attachments: "),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}