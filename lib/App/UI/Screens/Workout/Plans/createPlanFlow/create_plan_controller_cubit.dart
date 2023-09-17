import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'create_plan_controller_state.dart';

@Injectable()
class CreatePlanControllerCubit extends Cubit<CreatePlanControllerState> {
  CreatePlanControllerCubit() : super(CreatePlanControllerLoading()) {
    init();
  }

  final Logger logger = getIt<Env>().logger;

  final Database db = getIt<Database>();
  final TextEditingController nameSearchController = TextEditingController();

  final TextEditingController subinfoController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List<String> selectedExercises = [];
  List<UebungenData> exercises = [];

  init() {
    logger.d("CreatePlanControllerCubit init");
    loadExercises(null);

    emit(CreatePlanControllerTakingInput());
  }

  void addExercise(String exercise) {
    logger.d("CreatePlanControllerCubit addExercise");
    selectedExercises.add(exercise);
    emit(CreatePlanControllerPickingExercise());
  }

  void removeExercise(String exercise) {
    logger.d("CreatePlanControllerCubit removeExercise");
    selectedExercises.remove(exercise);
    emit(CreatePlanControllerPickingExercise());
  }

  void loadExercises(CreatePlanControllerState? state) async {
    logger.d("CreatePlanControllerCubit loadExercises");
    if (nameSearchController.text.isNotEmpty) {
      var exercisesTemp = await db.allUebungenEntries;
      exercises = exercisesTemp
          .where((element) =>
              element.name.compareTo(nameSearchController.text) == 0)
          .toList();
    } else {
      exercises = await db.allUebungenEntries;
    }
    if (state != null) {
      emit(state);
    }
  }

  void selectExercises() {
    logger.i("CreatePlanControllerCubit selectExercises");
    emit(CreatePlanControllerPickingExercise());
  }

  void takingInput() {
    logger.i("CreatePlanControllerCubit takingInput");
    emit(CreatePlanControllerTakingInput());
  }

  void cancel() {
    logger.i("CreatePlanControllerCubit cancel");
    selectedExercises.clear();
    emit(CreatePlanControllerTakingInput());
  }

  void save() async {
    logger.i("CreatePlanControllerCubit save");
    savePlan();
    saveUebungen();
    emit(CreatePlanControllerTakingInput());
  }

  void saveUebungen() async {
    logger.i("CreatePlanControllerCubit saveUebungen");
    for (String exercise in selectedExercises) {
      UebungenInPlanCompanion companion = UebungenInPlanCompanion(
        trainingPlanName: Value(nameController.text),
        uebungName: Value(exercise),
        plannedReps: const Value(10),
        plannedSets: const Value(3),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );

      await db.into(db.uebungenInPlan).insert(companion);
    }
    logger.i("CreatePlanControllerCubit saveUebungen done");
    emit(CreatePlanControllerTakingInput());
  }

  void savePlan() async {
    logger.i("CreatePlanControllerCubit savePlan");
    TrainingsPlanCompanion planCompanion = TrainingsPlanCompanion(
      name: Value(nameController.text),
      subinfo: Value(subinfoController.text),
      description: Value(descriptionController.text),
      createdAt: Value(DateTime.now()),
      updatedAt: Value(DateTime.now()),
      createdByUser: const Value("Me"),
      isPublic: const Value(false),
    );
    logger.i("CreatePlanControllerCubit savePlan: $planCompanion finished");
    await db.into(db.trainingsPlan).insert(planCompanion);

    emit(CreatePlanControllerTakingInput());
  }
}
