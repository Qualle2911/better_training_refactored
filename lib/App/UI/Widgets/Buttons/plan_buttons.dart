import 'package:better_training_refactored/injectable/injectable_handler.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:routemaster/routemaster.dart';

class AttachmentsIconButtonPlanning extends StatelessWidget {

  final Logger _logger = getIt<Env>().logger;
  AttachmentsIconButtonPlanning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _logger.i("AttachmentsIconButtonPlanning build");
    return IconButton(
      onPressed: () {
        _logger.i("AttachmentsIconButtonPlanning pressed");
      },
      icon: const Icon(
        Icons.attach_file,
        size: 20,
      ),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class CalenderIconButtonPlanning extends StatelessWidget {
   CalenderIconButtonPlanning({Key? key}) : super(key: key);

  final Logger _logger = getIt<Env>().logger;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _logger.i("CalenderIconButtonPlanning pressed");
      },
      icon: const Icon(
        Icons.today,
        size: 20,
      ),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class FurtherPointsIconButtonPlanning extends StatelessWidget {
   FurtherPointsIconButtonPlanning({Key? key, required this.onPressedDelete}) : super(key: key);
  final Logger _logger = getIt<Env>().logger;
  final VoidCallback onPressedDelete;
  @override
  Widget build(BuildContext context) {

    void handleClick(String value) {
      switch (value) {
        case 'Delete':
          _logger.i("Delete pressed");
          onPressedDelete();
          break;
        case 'Close':
          _logger.i("Close pressed");
          break;
      }
    }

    return PopupMenuButton<String>(
      icon: Icon(
        color: Theme.of(context).colorScheme.primary,
        Icons.more_vert,
        size: 20,
      ),
      onSelected: handleClick,
      itemBuilder: (BuildContext context) {
        return {'Delete', 'Close'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}

class ChangeTextButtonPlan extends StatelessWidget {
   ChangeTextButtonPlan({Key? key,required this.onPressed}) : super(key: key);
  final String buttonChangeText = "Change";
  final Logger _logger = getIt<Env>().logger;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {

        _logger.i("ChangeTextButtonPlan pressed");
        onPressed();
      },
      child: Text(buttonChangeText),
    );
  }
}

//! Code for the Change and Start Session Buttons in the Card

class StartTextButtonPlan extends StatelessWidget {
   StartTextButtonPlan({required this.id, Key? key}) : super(key: key);
  final String buttonStartSessionText = "Start Session";
  final int id;
  final Logger _logger = getIt<Env>().logger;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        _logger.i("StartTextButtonPlan pressed $id");
        Routemaster.of(context).push("/session/$id");
      },
      child: Text(buttonStartSessionText),
    );
  }
}
