
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/changeExerciseFlow/changeExercise.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/exercises_cubit.dart';
import 'package:better_training_refactored/App/UI/Widgets/Buttons/plan_buttons.dart';

import 'package:better_training_refactored/DB/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routemaster/routemaster.dart';

class ExerciseCardExpanded extends StatelessWidget {
   ExerciseCardExpanded({
    Key? key, required this.data,
  }) : super(key: key);
  final UebungenData data;
  final Widget image = SvgPicture.asset("assets/img/biceps.svg");
  static String creatorNameHint = "Creator Name";
  static String lastTrainedHint = "Last Trained";
  static String descriptionHint = "Description";
  static String buttonChangeText = "Change";
  static String buttonStartSessionText = "Start Session";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(data.name),
              subtitle: data.subinfo != null ? Text(data.subinfo!) : null,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AttachmentsIconButtonPlanning(),
                  FurtherPointsIconButtonPlanning(
                    onPressedDelete: () {
                      context.read<ExercisesCubit>().deleteExercise(data.id);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              height: 150,
              child: image,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("$creatorNameHint: "),
                  Text(data.createdByUser),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("$lastTrainedHint: "),
                  Text(
                      "${data.updatedAt.day}.${data.updatedAt.month}.${data.updatedAt.year}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$descriptionHint: ",
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      data.description ?? "",
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ChangeTextButtonPlan(onPressed: () {
                    ChangeExercise.id = data.id;
                    Routemaster.of(context).push('/changeExercise');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCardCollapsed extends StatelessWidget {
  const ExerciseCardCollapsed({
    Key? key, required this.data, required this.posId,
  }) : super(key: key);

  final UebungenData data;
  final int posId;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              onTap: () {
                context.read<ExercisesCubit>().focusNewPage(posId);
              },
              title: Text(data.name),
              subtitle: data.subinfo != null ? Text(data.subinfo!) : null,
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AttachmentsIconButtonPlanning(),
                  FurtherPointsIconButtonPlanning(
                    onPressedDelete: () {
                      context.read<ExercisesCubit>().deleteExercise(data.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCardAdd extends StatelessWidget {
  const ExerciseCardAdd({Key? key}) : super(key: key);

  final String title = "Add Exercise";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,0,8,0),
      child: Card(
        child: SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(title),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    Routemaster.of(context).push('/createExercise');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
