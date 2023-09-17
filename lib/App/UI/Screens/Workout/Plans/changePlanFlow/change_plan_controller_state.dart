part of 'change_plan_controller_cubit.dart';

@immutable
abstract class ChangePlanControllerState {}

class ChangePlanControllerTakingInput extends ChangePlanControllerState {}

class ChangePlanControllerPickingExercise extends ChangePlanControllerState {}

class ChangePlanControllerLoading extends ChangePlanControllerState {}

class ChangePlanControllerLoaded extends ChangePlanControllerState {}

class ChangePlanControllerStateError extends ChangePlanControllerState {}

