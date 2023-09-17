
import 'package:better_training_refactored/DB/database.dart';
import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../UI/Widgets/Navigation/NavBar/navbar.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key, required this.title});

  final Logger logger = getIt<Env>().logger;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashboardPage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<DashboardPage> {
  int _counter = 0;

  void _incrementCounter() {
    widget.logger.i("Counter Incremented");

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    widget.logger.e("Counter is $_counter");

  }

  @override
  void initState() {
    widget.logger.i("HomePage State Created");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.logger.i("HomePage Build");

    return Scaffold(
      bottomNavigationBar: Navbar(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DriftDbViewer(
                          getIt.get<Database>(),

                        ),
                      ),
                    );
                  },
                  child: const Text('Open DB Viewer'),
                ),
              ],
            ),

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
