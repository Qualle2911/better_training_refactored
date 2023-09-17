import 'dart:async';

import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'exercises_state.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit() : super(ExercisesInitial()) {
    loadExercises();
    init();
  }

  void focusNewPage(int goal) {
    selectedExercise = goal;
    exerciseCarouselController.animateToPage(exercises.length > goal ? goal + 1 : 0);
    emit(ExercisesLoaded( exercises,selectedExercise));


  }

  CarouselController exerciseCarouselController = CarouselController();
  Logger logger = getIt<Env>().logger;

  int selectedExercise = 0;

  void selectExercise(int id) {
    logger.i("selectExercise($id)");
    selectedExercise = id;
    emit(ExercisesLoaded( exercises,selectedExercise));
  }

  void init() async {
    logger.i("ExercisesCubit init");
    _uebungenSubscription = db.allUebungenEntriesStream.listen((event) {
      logger.i("ExercisesCubit _uebungenSubscription");
      exercises = event.toList();
      emit(ExercisesLoaded( exercises,selectedExercise));
    });
  }
  late final StreamSubscription _uebungenSubscription;
  final Database db = getIt<Database>();

  List<UebungenData> exercises = [];

  int get lengthExercises => exercises.length;

  UebungenData getExercise(int index) => exercises[index];


  void deleteExercise(int id) {
    logger.i("deleteExercise($id)");
    db.deleteExercise(id);
    emit(ExercisesLoaded( exercises,selectedExercise));
  }

  void loadExercises() async{
    logger.i("loadExercises()");
    exercises = await db.allUebungenEntries;
    emit(ExercisesLoaded( exercises,selectedExercise));
  }



}
