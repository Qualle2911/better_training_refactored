import 'dart:core';
import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

part 'session_state.dart';

class SetInformation {
  SetInformation({required this.reps, required this.weight});
  final String reps;
  final String weight;
}

class ExerciseInformation {
  ExerciseInformation({required this.exercise, required this.setInformation});
  final UebungenData exercise;
  final List<SetInformation> setInformation;
}

class SessionCubit extends Cubit<SessionState> {
  SessionCubit({required this.planId}) : super(SessionLoading()) {
    init();
  }

  final int planId;
  final Database db = getIt<Database>();
  final Logger logger = getIt<Env>().logger;
  List<UebungenData> exercises = [];
  List<ExerciseInformation> exerciseInformation = [];

  void init() async {
    logger.i("SessionCubit init");
    exercises = await db.getExercisesForPlan(planId);
    exerciseInformation = List.generate(
        exercises.length,
        (index) => ExerciseInformation(
            exercise: exercises[index], setInformation: []));
    emit(SessionLoaded(exercises));
  }

  void addSet(int exerciseNr, int setNr, String reps, String weight) {
    logger.i("SessionCubit addSet");
    logger.i("$exerciseNr, $setNr, $reps, $weight");
    if (exerciseInformation[exerciseNr].setInformation.length <= setNr) {
      exerciseInformation[exerciseNr]
          .setInformation
          .add(SetInformation(reps: reps, weight: weight));
    } else {
      exerciseInformation[exerciseNr].setInformation.removeAt(setNr);
      exerciseInformation[exerciseNr]
          .setInformation
          .insert(setNr, SetInformation(reps: reps, weight: weight));
    }
  }

  void finishSession() async {
    logger.i("SessionCubit finishSession");

    TrainingCompanion trainingsCompanion = TrainingCompanion(
      planId: Value(planId.toString()),
      createdAt: Value(DateTime.now()),
    );
    int trainingsId = await db.saveTraining(trainingsCompanion);
    List<UebungenInTrainingCompanion> uebungenInTrainingCompanion = [];

    logger.i("training saved id : $trainingsId");

    for (int i = 0; i < exerciseInformation.length; i++) {
      UebungenData exercise = exerciseInformation[i].exercise;
      List<SetInformation> setInformation =
          exerciseInformation[i].setInformation;
      for (var element in setInformation) {
        uebungenInTrainingCompanion.add(
          UebungenInTrainingCompanion(
            trainingID: Value(trainingsId),
            uebungsId: Value(exercise.id.toString()),
            reps: Value(
              int.parse(element.reps),
            ),
            weight: Value(int.parse(element.weight)),
          ),
        );
      }
    }

    for (var element in uebungenInTrainingCompanion) {
      db.saveUebungInTraining(element);
    }
  }
}
