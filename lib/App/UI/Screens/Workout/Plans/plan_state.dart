part of 'plan_cubit.dart';

@immutable
abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoaded extends PlanState {
  PlanLoaded({required this.currentPlan, required this.plaene});
  final int currentPlan;
  final List<TrainingsPlanData> plaene;

}
