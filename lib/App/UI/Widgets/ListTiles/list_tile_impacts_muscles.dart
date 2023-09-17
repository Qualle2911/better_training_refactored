import 'package:flutter/material.dart';

class ListTileImpactsMuscle extends StatefulWidget {
  const ListTileImpactsMuscle(
      {Key? key, required this.title, required this.onChanged, required this.isPicked})
      : super(key: key);
  final String title;
  final VoidCallback onChanged;
  final bool isPicked;

  @override
  State<ListTileImpactsMuscle> createState() => _ListTileImpactsMuscleState();
}

class _ListTileImpactsMuscleState extends State<ListTileImpactsMuscle> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),

      //request value from muscles with string key
      value:
          widget.isPicked,
      onChanged: (value) {
        widget.onChanged();

      },
    );
  }
}
