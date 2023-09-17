import 'dart:async';
import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanInitial()) {
    init();
  }

  @override
  Future<void> close() {
    _planSubscription.cancel();
    return super.close();
  }

  CarouselController planCarouselController = CarouselController();

  void focusNewPlan(int goal) {
    currentPlan = goal;
    planCarouselController.jumpToPage(plans.length > goal ? goal + 1 : 0);
    emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));
  }

  final Logger logger = getIt<Env>().logger;
  void init() async {
    plans = await db.allTrainingPlanEntries;
    _planSubscription = db.allTrainingPlanEntriesStream.listen((event) {
      logger.i("PlanCubit _planSubscription");
      plans = event;
      emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));
    });
    logger.d("PlanCubit init");
    emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));
  }

  final Database db = getIt<Database>();

  late final StreamSubscription _planSubscription;

  List<TrainingsPlanData> plans = [];

  int currentPlan = 0;

  List<UebungenData> currentExercises = [];

  void deletePlan(int id) {
    logger.i("deletePlan($id)");
    db.deletePLan(id);
    currentExercises = [];
    emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));
  }

  void changeCurrentPlan(int id) async {
    logger.i("changeCurrentPlan($id)");
    currentPlan = id;
    emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));

    currentExercises = await db.getExercisesForPlan(id);
    emit(PlanLoaded(currentPlan: currentPlan, plaene: plans, ));
  }
}
