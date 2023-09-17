part of 'create_exercise_controller_cubit.dart';

@immutable
abstract class CreateExerciseControllerState {}

class CreateExerciseControllerLoading extends CreateExerciseControllerState {}

class CreateExerciseControllerTakingInput extends CreateExerciseControllerState {}

class CreateExerciseControllerPickingMuscles extends CreateExerciseControllerState {}

class CreateExerciseControllerError extends CreateExerciseControllerState {}
