import 'dart:core';
import 'package:drift/drift.dart';
export 'database.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get image => text().nullable()();
  IntColumn get age => integer().nullable()();
  IntColumn get startWeight => integer().nullable()();
  IntColumn get currentWeight => integer().nullable()();
  TextColumn get createdAt => text()();
  TextColumn get updatedAt => text()();
}

class Friends extends Table {
  IntColumn get userId => integer()();
  IntColumn get friendId => integer()();
  TextColumn get createdAt => text()();

  @override
  Set<Column> get primaryKey => {userId, friendId};
}

class Messages extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get friendId => integer()();
  TextColumn get message => text()();
  TextColumn get createdAt => text()();
}

class TrainingsPlan extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get subinfo => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get createdByUser => text()();
  BoolColumn get isPublic => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();


}

class Uebungen extends Table {

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get subinfo => text().nullable()();

  TextColumn get description => text().nullable()();

  TextColumn get comment => text().nullable()();

  TextColumn get createdByUser => text()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  BoolColumn get impactsChest => boolean().withDefault(const Constant(false))();

  BoolColumn get impactsShoulders =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get impactsBack => boolean().withDefault(const Constant(false))();

  BoolColumn get impactsCalves =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get impactsTriceps =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get impactsBiceps =>
      boolean().withDefault(const Constant(false))();

  BoolColumn get impactsAbs => boolean().withDefault(const Constant(false))();

  BoolColumn get impactsLegs => boolean().withDefault(const Constant(false))();

}

class UebungenInPlan extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trainingPlanId => integer().references(TrainingsPlan, #id)();
  IntColumn get uebungId => integer().references(Uebungen, #id)();
  TextColumn get trainingPlanName => text().references(TrainingsPlan, #name)();
  TextColumn get uebungName => text().references(Uebungen, #name)();
  IntColumn get plannedReps => integer()();
  IntColumn get plannedSets => integer()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

}

class Training extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get planId => text().references(TrainingsPlan, #id)();
  DateTimeColumn get createdAt => dateTime()();
}

class UebungenInTraining extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trainingID => integer().references(Training, #id)();
  TextColumn get uebungsId => text().references(Uebungen, #id)();
  IntColumn get reps => integer()();
  IntColumn get weight => integer()();
}
