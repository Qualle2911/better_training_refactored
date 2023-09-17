import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../injectable/injectable_handler.dart';
import 'tables.dart';
part 'database.g.dart';

@DriftDatabase(tables: [
  Users,
  Friends,
  Messages,
  TrainingsPlan,
  Uebungen,
  UebungenInPlan,
  Training,
  UebungenInTraining
])
@LazySingleton()
class Database extends _$Database {
  Stream<List<UebungenData>> get allUebungenEntriesStream =>
      select(distinct: true, uebungen).watch();
  Future<List<UebungenData>> get allUebungenEntries =>
      select(distinct: true, uebungen).get();

  Stream<List<TrainingsPlanData>> get allTrainingPlanEntriesStream =>
      select(distinct: true, trainingsPlan).watch();

  Future<List<TrainingsPlanData>> get allTrainingPlanEntries =>
      select(distinct: true, trainingsPlan).get();

  Future<List<TypedResult>> allUebungenInPlanEntries(int id) async {
    var rs = await select(trainingsPlan).join([
      leftOuterJoin(
          uebungenInPlan, uebungenInPlan.id.equalsExp(trainingsPlan.id)),
    ]).get()
      ..where((tbl) => tbl.readTable(uebungenInPlan).id == id);
    return rs;
  }

  Future<UebungenData> getExerciseById(int id) async {
    logger.i('getExerciseByID called');
    return await (select(uebungen)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<TrainingsPlanData> getPlanById(int id) async {
    logger.i('getPlanByName called');
    return await (select(trainingsPlan)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<List<UebungenData>> getExercisesForPlan(int id) async {
    logger.i('getExercisesForPlan called');

    List<UebungenInPlanData> temp =
        await (select(uebungenInPlan, distinct: true)
              ..where((tbl) => tbl.trainingPlanId.equals(id)))
            .get();
    List<UebungenData> exercises = [];
    for (var i in temp) {
      exercises.add(await getExerciseById(i.uebungId));
    }
    logger.i('getExercisesForPlan finished $exercises');

    return exercises;
  }

  Env env = getIt<Env>();
  Logger logger = getIt<Env>().logger;
  // after creating the database, we want to fill it with some data using batch inserts
  Database() : super(_openConnection()) {
    logger.i('Database constructor called');
    // when opening the database for the first time, create all tables
    // and insert some data
    if (false) {
      //delete db
      insertMockData();
    }
  }

  @override
  int get schemaVersion => 1;

  @override
  // TODO: implement migration
  MigrationStrategy get migration {
    logger.i('MigrationStrategy called');
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }

  void saveUebung(UebungenCompanion uebungenCompanion) async {
    logger.i('saveUebung called');
    await into(uebungen)
        .insert(uebungenCompanion, mode: InsertMode.insertOrReplace);
  }

  Future<int> saveTraining(TrainingCompanion trainingCompanion) async {
    logger.i('saveTraining called');

    final insertedId = await into(training)
        .insert(trainingCompanion, mode: InsertMode.insertOrReplace);
    return insertedId;
  }

  void saveUebungInTraining(
      UebungenInTrainingCompanion uebungenInTrainingCompanion) async {
    logger.i('saveUebungInTraining called');
    await into(uebungenInTraining)
        .insert(uebungenInTrainingCompanion, mode: InsertMode.insertOrReplace);
  }

  void saveUebungInPlan(UebungenInPlanCompanion uebungenInPlanCompanion) async {
    logger.i('saveUebungInPlan called');
    await into(uebungenInPlan)
        .insert(uebungenInPlanCompanion, mode: InsertMode.insertOrReplace);
  }

  void savePlan(TrainingsPlanCompanion trainingsPlanCompanion) async {
    logger.i('savePlan called');
    await into(trainingsPlan)
        .insert(trainingsPlanCompanion, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteUebungenInPlan(int id) async {
    logger.i('deleteUebungenInPlan called');
    await (delete(uebungenInPlan)
          ..where((tbl) => tbl.trainingPlanId.equals(id)))
        .go();
  }

  void deleteUebungInPlan(int planId, int uebungsId) async {
    logger.i('deleteUebungInPlan called');
    await (delete(uebungenInPlan)
          ..where((tbl) =>
              tbl.trainingPlanId.equals(planId) &
              tbl.uebungId.equals(uebungsId)))
        .go();
  }

  void deletePLan(int id) async {
    await (delete(trainingsPlan)..where((tbl) => tbl.id.equals(id))).go();
    await (delete(uebungenInPlan)..where((tbl) => tbl.id.equals(id))).go();
  }

  void deleteExercise(int id) async {
    await (delete(uebungen)..where((tbl) => tbl.id.equals(id))).go();
  }

  void updateUebung(UebungenCompanion uebungenCompanion) async {
    logger.i('updateUebung called');
    await (update(uebungen)
          ..where((tbl) => tbl.id.equals(uebungenCompanion.id.value)))
        .write(uebungenCompanion);
  }

  void updatePlan(TrainingsPlanCompanion trainingsPlanCompanion) async {
    logger.i('updatePlan called');
    await (update(trainingsPlan)
          ..where((tbl) => tbl.id.equals(trainingsPlanCompanion.id.value)))
        .write(trainingsPlanCompanion);
  }

  Future<void> insertMockData() async {
    logger.i('insertMultipleEntries called');

    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        users,
        MockData.users,
      );
      batch.insertAllOnConflictUpdate(
        friends,
        MockData.friendsData,
      );
      batch.insertAllOnConflictUpdate(
        messages,
        MockData.listMessages(),
      );
      batch.insertAllOnConflictUpdate(
        uebungen,
        MockData.listUebungen,
      );
      batch.insertAllOnConflictUpdate(
        trainingsPlan,
        MockData.listTrainingsPlan,
      );

      batch.insertAllOnConflictUpdate(
        training,
        MockData.listTrainings(),
      );

      batch.insertAllOnConflictUpdate(
        uebungenInPlan,
        MockData.listUebungInPlan,
      );
      batch.insertAllOnConflictUpdate(
        uebungenInTraining,
        MockData.listUebungenInTraining(),
      );
    });
  }
}

LazyDatabase _openConnection() {
  Env env = getIt<Env>();
  Logger logger = getIt<Env>().logger;
  logger.i('Opening database connection');
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, '${env.databaseName}.sqlite'));
    logger.i('Opening database connection - Done');
    return NativeDatabase.createInBackground(file);
  });
}

class MockData {
// Fill List with MockData, There are 5 Users userId = 1-5
// User 1 has 2 Friends, User 2 has 1 Friend, User 3 has 3 Friends, User 4 has 1 Friend, User 5 has 2 Friends

  static List<UsersCompanion> users = [
    for (var i = 1; i <= 5; i++)
      UsersCompanion.insert(
        name: 'User $i',
        email: 'user$i@testmail.de',
        password: '123',
        image: const Value(""),
        age: const Value(20),
        startWeight: const Value(80),
        currentWeight: const Value(80),
        createdAt: DateTime(2022, 1, 1, 12, 00, 30).toString(),
        updatedAt: DateTime(2022, 1, 1, 12, 00, 30).toString(),
      ),
  ];

  static List<FriendsCompanion> friendsData = [
    for (var i = 1; i <= 5; i++)
      for (var j = 1; j <= (Random().nextInt(4) + 1); j++)
        if (i != j)
          FriendsCompanion.insert(
            userId: i,
            friendId: j,
            createdAt: DateTime(2022, 1, 1, 12, 00, 30).toString(),
          )
  ];

  static List<MessagesCompanion> listMessages() {
    List<MessagesCompanion> messages = [];
    for (int i = 1; i <= 5; i++) {
      for (int j = 1; j <= 5; j++) {
        if (i != j) {
          int random = Random().nextInt(4) + 2;
          for (int k = 1; k <= random; k++) {
            var temp = MessagesCompanion.insert(
              userId: (i),
              friendId: j,
              message: 'Message $k from User $i to User $j',
              createdAt: DateTime(2022, 1, 1, 12, 00, 30).toString(),
            );
            messages.add(temp);
          }
        }
      }
    }
    return messages;
  }

  static List<TrainingsPlanCompanion> listTrainingsPlan = [
    for (int i = 1; i <= 5; i++)
      TrainingsPlanCompanion.insert(
        name: ('Plan $i'),
        createdByUser: ('Me'),
        subinfo: Value('Subinfo $i'),
        description: Value('Description $i'),
        isPublic: const Value(true),
        createdAt: (DateTime(2022, 1, 1, 12, 00, 30)),
        updatedAt: (DateTime(2022, 1, 1, 12, 00, 30)),
      )
  ];

  static List<UebungenInPlanCompanion> listUebungInPlan = [
    for (int i = 1; i <= 5; i++)
      for (int j = 1; j <= 10; j++)
        UebungenInPlanCompanion.insert(
          trainingPlanId: i * j,
          uebungId: j * j * i,
          trainingPlanName: ('Plan $i'),
          uebungName: ('Uebung $j'),
          plannedReps: 10,
          plannedSets: 3,
          createdAt: (DateTime(2022, 1, 1, 12, 00, 30)),
          updatedAt: (DateTime(2022, 1, 1, 12, 00, 30)),
        )
  ];

  static List<TrainingCompanion> listTrainings() {
    List<TrainingCompanion> listTrainings = [];
    for (int i = 1; i <= 5; i++) {
      for (int j = 1; j <= 10; j++) {
        listTrainings.add(TrainingCompanion.insert(
          planId: '$i',
          createdAt: DateTime.now(),
        ));
      }
    }
    return listTrainings;
  }

  static List<UebungenInTrainingCompanion> listUebungenInTraining() {
    List<UebungenInTrainingCompanion> listUebungenInTraining = [];
    for (int i = 1; i <= 5; i++) {
      // Pläne
      for (int j = 1; j <= 10; j++) {
        // 10x plan trainiert
        for (int k = 1; k <= 10; k++) {
          // 10 Uebungen pro Training
          for (int l = 1; l <= 3; l++) {
            // Sätze
            listUebungenInTraining.add(UebungenInTrainingCompanion.insert(
              trainingID: (j),
              uebungsId: k.toString(),
              reps: 10,
              weight: 80,
            ));
          }
        }
      }
    }
    return listUebungenInTraining;
  }

  static List<UebungenCompanion> listUebungen = [
    for (int i = 1; i <= 10; i++)
      UebungenCompanion.insert(
        name: ('Uebung $i'),
        subinfo: Value('subinfo $i'),
        description: Value('description $i'),
        comment: Value('comment $i'),
        createdByUser: ('Me'),
        createdAt: DateTime(2022, 1, 1, 12, 00, 30),
        updatedAt: DateTime(2022, 1, 1, 12, 00, 30),
      )
  ];
}
