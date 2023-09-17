part of 'change_exercise_controller_cubit.dart';

@immutable
abstract class ChangeExerciseControllerState {}

class ChangeExerciseControllerLoading extends ChangeExerciseControllerState {}

class ChangeExerciseControllerTakingInput extends ChangeExerciseControllerState {}

class ChangeExerciseControllerPickingMuscles extends ChangeExerciseControllerState {}

class ChangeExerciseControllerError extends ChangeExerciseControllerState {}
