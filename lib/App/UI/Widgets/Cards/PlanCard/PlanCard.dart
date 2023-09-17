import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/changePlanFlow/change_plan.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/plan_cubit.dart';
import 'package:better_training_refactored/App/UI/Widgets/Buttons/plan_buttons.dart';

import 'package:better_training_refactored/DB/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:routemaster/routemaster.dart';


class PlanCard extends StatefulWidget {
  const PlanCard({Key? key, required this.data, required this.posId}) : super(key: key);
  final int posId;

  final TrainingsPlanData data;

  @override
  State<PlanCard> createState() => _PlanCardState();
}

class _PlanCardState extends State<PlanCard> {
  @override
  Widget build(BuildContext context) {

    bool isExpanded = context.read<PlanCubit>().currentPlan == widget.data.id;

    if (isExpanded) {
      return PlanCardExpanded(data: widget.data);
    } else {
      return PlanCardCollapsed(data: widget.data, posId: widget.posId);
    }
  }
}



class PlanCardExpanded extends StatelessWidget {
   PlanCardExpanded({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Widget image = SvgPicture.asset("assets/img/whole_body.svg");
  final TrainingsPlanData data;

  static String creatorNameHint = "Creator Name";
  static String lastSessionHint = "Last Session";
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
              subtitle: Text(data.subinfo ?? ''),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AttachmentsIconButtonPlanning(),
                  CalenderIconButtonPlanning(),
                  FurtherPointsIconButtonPlanning(
                    onPressedDelete: () {
                      //Todo: RangeError..
                      context.read<PlanCubit>().deletePlan(data.id);
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
                  Text("$lastSessionHint: "),
                  Text("${data.updatedAt.day}.${data.updatedAt.month}.${data.updatedAt.year}"),
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
                      data.description ?? '',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChangeTextButtonPlan(
                    onPressed: () {
                      ChangePlan.id = data.id;
                      Routemaster.of(context).push("/changePlan");
                    },
                  ),
                  StartTextButtonPlan(id: data.id,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCardCollapsed extends StatelessWidget {
  const PlanCardCollapsed({
    Key? key,
    required this.data, required this.posId,
  }) : super(key: key);


  final int posId;

  final TrainingsPlanData data;

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
                context.read<PlanCubit>().focusNewPlan( posId);
              },
              title: Text(data.name),
              subtitle: Text(data.subinfo ?? ''),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AttachmentsIconButtonPlanning(),
                  CalenderIconButtonPlanning(),
                  FurtherPointsIconButtonPlanning(
                    onPressedDelete: () {
                      context.read<PlanCubit>().deletePlan(data.id);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCardAdd extends StatelessWidget {
  const PlanCardAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        child: SizedBox(
          height: 75,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Add Plan"),
                IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () =>
                        Routemaster.of(context).push('/createPlanSheet')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
