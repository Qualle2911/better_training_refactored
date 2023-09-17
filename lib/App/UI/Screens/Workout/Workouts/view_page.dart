
import 'package:better_training_refactored/App/UI/Screens/Workout/Exercises/exercises.dart';
import 'package:better_training_refactored/App/UI/Screens/Workout/Plans/plan.dart';
import 'package:better_training_refactored/App/UI/Widgets/Navigation/NavBar/navbar.dart';
import 'package:flutter/material.dart';

class MyWorkoutView extends StatefulWidget {
  const MyWorkoutView({Key? key}) : super(key: key);

  @override
  State<MyWorkoutView> createState() => _MyWorkoutViewState();
}


//Todo Tab-Bar ist in der Klasse drinne ? Wenn möglich auslagern in eigene Klasse!

class _MyWorkoutViewState extends State<MyWorkoutView> with SingleTickerProviderStateMixin {

  final List<Tab> tabsWorkout = <Tab>[
    const Tab(text: 'Planning'),
    const Tab(text: 'Exercises'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabsWorkout.length, vsync: this);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TabBar(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),

          controller: _tabController,
          tabs: tabsWorkout,
        ),

      body: TabBarView(
        controller: _tabController,
        children:   const [
          Center(child: Plan()),
          Center(child: Exercises()),
        ],
      ),
      bottomNavigationBar: Navbar());
  }
}

