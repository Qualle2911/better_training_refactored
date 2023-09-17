import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'change_plan_controller_state.dart';

@Injectable()
class ChangePlanControllerCubit extends Cubit<ChangePlanControllerState> {
  ChangePlanControllerCubit(this.id) : super(ChangePlanControllerLoading()) {
    init();

  }

  final int id;
  final Logger logger = getIt<Env>().logger;
  final Database db = getIt<Database>();
  final TextEditingController nameSearchController = TextEditingController(

  );

  final TextEditingController subinfoController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<UebungenData> selectedExercises = [];
  List<UebungenData> unselectedExercises = [];
  List<UebungenData> exercisesData = [];

  late final TrainingsPlanData plan;

  init() async {

    plan = await db.getPlanById(id);
    logger.d("ChangePlanControllerCubit init");
    loadPlan();
    loadExercises();



    emit(ChangePlanControllerTakingInput());
  }

  void pickedExercise(UebungenData exercise)  {
    logger.d("ChangePlanControllerCubit addExercise");

    if(selectedExercises.contains(exercise)) {
      selectedExercises.remove(exercise);
      unselectedExercises.add(exercise);
    }
    else if(unselectedExercises.contains(exercise)) {
      unselectedExercises.remove(exercise);
      selectedExercises.add(exercise);
    }
    emit(ChangePlanControllerPickingExercise());
  }

  void loadExercisesWithSearch(ChangePlanControllerState? state) async{
    logger.d("ChangePlanControllerCubit loadExercises");

      if(nameSearchController.text.isNotEmpty) {

        var exercisesTemp = await db.allUebungenEntries;
        exercisesData = exercisesTemp.where((element) => element.name.compareTo(nameSearchController.text) == 0).toList();
      } else {
        exercisesData = await db.allUebungenEntries;
        if (state != null) {
          emit(state);
        }
      }}

  void loadExercises() async {
    logger.d("ChangePlanControllerCubit loadExercises");
      exercisesData = await db.allUebungenEntries;
  }

  void selectExercises() {
    logger.i("ChangePlanControllerCubit selectExercises");
    emit(ChangePlanControllerPickingExercise());
  }

  void takingInput() {
    logger.i("ChangePlanControllerCubit takingInput");
    emit(ChangePlanControllerTakingInput());
  }


  void cancel() {
    logger.i("ChangePlanControllerCubit cancel");
    emit(ChangePlanControllerTakingInput());
  }

  void save() async {
    logger.i("ChangePlanControllerCubit save");
    savePlan();
    saveUebungen();
    emit(ChangePlanControllerTakingInput());
  }

  void saveUebungen() async {

    logger.i("ChangePlanControllerCubit saveUebungen");

    for (UebungenData exercise in unselectedExercises) {
      db.deleteUebungInPlan(plan.id, exercise.id);
    }
    for(UebungenData exercise in selectedExercises) {
      UebungenInPlanCompanion companion = UebungenInPlanCompanion(
        id: Value(exercise.id),
        uebungId: Value(exercise.id),
        trainingPlanId: Value(id),
        trainingPlanName: Value(nameController.text),
        uebungName: Value(exercise.name),
        createdAt: Value(exercise.createdAt),
        updatedAt: Value(exercise.updatedAt),
        plannedReps: const Value(10),
        plannedSets: const Value(3),

      );
      db.saveUebungInPlan(companion);


    }
    logger.i("ChangePlanControllerCubit saveUebungen done");
    emit(ChangePlanControllerTakingInput());
  }

  void savePlan() async {
    logger.i("ChangePlanControllerCubit savePlan");
    TrainingsPlanCompanion planCompanion = TrainingsPlanCompanion(
      id: Value(id),
      name: Value(nameController.text),
      subinfo: Value(subinfoController.text),
      description: Value(descriptionController.text),
      updatedAt: Value(DateTime.now()),
      isPublic: const Value(false),
      createdAt: Value(plan.createdAt),
      createdByUser: Value(plan.createdByUser),


    );
    logger.i("ChangePlanControllerCubit savePlan: $planCompanion finished");
    db.savePlan(planCompanion);
  }

  void loadPlan() async {
    logger.i("ChangePlanControllerCubit loadPlan");
    nameController.text = plan.name;
    subinfoController.text = plan.subinfo ?? "";
    descriptionController.text = plan.description ?? "";

    exercisesData = await db.allUebungenEntries;
    selectedExercises =  await db.getExercisesForPlan(id);
    unselectedExercises = exercisesData.where((element) => !selectedExercises.contains(element)).toList();



    emit(ChangePlanControllerTakingInput());
  }






}
