import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

part 'change_exercise_controller_state.dart';

class ChangeExerciseControllerCubit
    extends Cubit<ChangeExerciseControllerState> {
  ChangeExerciseControllerCubit(this.id)
      : super(ChangeExerciseControllerLoading()) {
    init();
  }

  final int id;
  late  UebungenData exercise;

  final Database db = getIt<Database>();

  final Map<String, bool> muscles = {
    "Biceps": false,
    "Triceps": false,
    "Shoulders": false,
    "Chest": false,
    "Back": false,
    "Legs": false,
    "Abs": false,
    "Calves": false,
  };

  void init() {
    loadExercise(id);

    emit(ChangeExerciseControllerTakingInput());
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController subinfoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  void takeInput() {
    emit(ChangeExerciseControllerTakingInput());
  }

  void detailSheet() {
    emit(ChangeExerciseControllerPickingMuscles());
  }

  void standardSheet() {
    emit(ChangeExerciseControllerTakingInput());
  }

  bool isPicked(String muscle) {
    return muscles[muscle]!;

  }

  void loadExercise(int id) async {

    UebungenData exercise = await db.getExerciseById(id);

    nameController.text = exercise.name;
    subinfoController.text = exercise.subinfo ?? "";
    descriptionController.text = exercise.description ?? "";
    commentController.text = exercise.comment ?? "";
    muscles.update("Biceps", (value) => exercise.impactsBiceps);
    muscles.update("Triceps", (value) => exercise.impactsTriceps);
    muscles.update("Shoulders", (value) => exercise.impactsShoulders);
    muscles.update("Chest", (value) => exercise.impactsChest);
    muscles.update("Back", (value) => exercise.impactsBack);
    muscles.update("Legs", (value) => exercise.impactsLegs);
    muscles.update("Abs", (value) => exercise.impactsAbs);
    muscles.update("Calves", (value) => exercise.impactsCalves);

  }

  void save() async {

    UebungenCompanion temp = UebungenCompanion(
        id: Value(id),
        name: Value(nameController.text),
        subinfo: Value(subinfoController.text),
        createdByUser: const Value("Me"),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
        description: Value(descriptionController.text),
        comment: Value(commentController.text),
        impactsAbs: Value(isPicked("Abs")),
        impactsBiceps: Value(isPicked("Biceps")),
        impactsBack: Value(isPicked("Back")),
        impactsCalves: Value(isPicked("Calves")),
        impactsChest: Value(isPicked("Chest")),
        impactsLegs: Value(isPicked("Legs")),
        impactsShoulders: Value(isPicked("Shoulders")),
        impactsTriceps: Value(isPicked("Triceps")));
    db.saveUebung(temp);
  }

  void toggleMuscle(String title, ChangeExerciseControllerState state) {
    muscles.update(title, (value) => !value);
  }
}
