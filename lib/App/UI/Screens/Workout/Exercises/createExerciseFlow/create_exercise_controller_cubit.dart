import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';

part 'create_exercise_controller_state.dart';

class CreateExerciseControllerCubit
    extends Cubit<CreateExerciseControllerState> {
  CreateExerciseControllerCubit() : super(CreateExerciseControllerLoading()) {
    init();
  }
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
    emit(CreateExerciseControllerTakingInput());
  }

  List<String> selectedMuscles = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController subinfoController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  void takeInput() {
    emit(CreateExerciseControllerTakingInput());
  }

  void detailSheet() {
    emit(CreateExerciseControllerPickingMuscles());
  }

  void standardSheet() {
    emit(CreateExerciseControllerTakingInput());
  }

  bool isPicked(String muscle) {
    return muscles[muscle]!;
  }

  void save() async {
    var temp = UebungenCompanion(
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
    await db.into(db.uebungen).insert(temp);
  }

  void toggleMuscle(String title, CreateExerciseControllerState state) {
    muscles.update(title, (value) => !value);
  }
}
