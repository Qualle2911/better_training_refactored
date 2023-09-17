part of 'session_cubit.dart';

@immutable
abstract class SessionState {}

class SessionLoading extends SessionState {}

class SessionLoaded extends SessionState {
  SessionLoaded(this.exercises);
  final List<UebungenData> exercises;
}

class SessionStateError extends SessionState {}
