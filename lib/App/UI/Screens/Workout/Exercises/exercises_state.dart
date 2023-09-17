part of 'exercises_cubit.dart';

@immutable
abstract class ExercisesState {}

class ExercisesInitial extends ExercisesState {}

class ExercisesLoaded extends ExercisesState {
  ExercisesLoaded(this.exercises, this.selectedExercise);

  final List<UebungenData> exercises;
  final int selectedExercise;
}

class ExercisesStateError extends ExercisesState {}

class ExercisesStateLoading extends ExercisesState {}
