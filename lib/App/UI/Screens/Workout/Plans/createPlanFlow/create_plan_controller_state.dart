part of 'create_plan_controller_cubit.dart';

@immutable
abstract class CreatePlanControllerState {}

class CreatePlanControllerTakingInput extends CreatePlanControllerState {}

class CreatePlanControllerPickingExercise extends CreatePlanControllerState {}

class CreatePlanControllerLoading extends CreatePlanControllerState {}

class CreatePlanControllerLoaded extends CreatePlanControllerState {}

class CreatePlanControllerStateError extends CreatePlanControllerState {}

