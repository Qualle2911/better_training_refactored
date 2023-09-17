import 'package:better_training_refactored/App/UI/Screens/Workout/Workouts/session/session_cubit.dart';
import 'package:better_training_refactored/App/UI/Widgets/Cards/SessionCard/add_set_tracker.dart';
import 'package:better_training_refactored/App/UI/Widgets/Cards/SessionCard/session_exercise_card.dart';
import 'package:better_training_refactored/App/UI/Widgets/Cards/SessionCard/set_tracker.dart';
import 'package:better_training_refactored/DB/tables.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySession extends StatefulWidget {
  const MySession({required this.planId, Key? key}) : super(key: key);
  final String? planId;

  @override
  State<MySession> createState() => _MySessionState();
}

//Todo Tab-Bar ist in der Klasse drinne ? Wenn möglich auslagern in eigene Klasse!

class _MySessionState extends State<MySession>
    with SingleTickerProviderStateMixin {
  final logger = getIt<Env>().logger;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SessionCubit(planId: int.parse(widget.planId ?? '401')),
      child: BlocBuilder<SessionCubit, SessionState>(builder: (context, state) {
        SessionState stateSnapshot = state;
        if (stateSnapshot is SessionLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (stateSnapshot is SessionLoaded) {
          return SessionLoadedView(
            uebungen: stateSnapshot.exercises,
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      }),
    );
  }
}

class SessionLoadedView extends StatefulWidget {
  const SessionLoadedView({required this.uebungen, Key? key}) : super(key: key);

  final List<UebungenData> uebungen;

  @override
  State<SessionLoadedView> createState() => _SessionLoadedViewState();
}

class _SessionLoadedViewState extends State<SessionLoadedView>
    with SingleTickerProviderStateMixin {
  late final List<Tab> tabsExercises;
  late final TabController _tabController;

  @override
  void initState() {
    tabsExercises = [
      for (var uebung in widget.uebungen)
        const Tab(
          icon: Icon(
            Icons.circle,
            size: 14,
          ),
          height: 22,
        )
    ];
    _tabController = TabController(length: tabsExercises.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Text('Session'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: OutlinedButton(
                onPressed: () {
                  context.read<SessionCubit>().finishSession();
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.check)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (int i = 0; i < widget.uebungen.length; i++)
                    SessionExerciseCard(
                      uebung: widget.uebungen[i],
                      posInList: i,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: TabBar(
                isScrollable: true,
                tabs: tabsExercises,
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}





