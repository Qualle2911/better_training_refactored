import 'package:flutter/material.dart';

class SetTracker extends StatelessWidget {
  const SetTracker({
    super.key,
    required this.setNr,
    required this.save,
    required this.repsController,
    required this.weightController,
  });

  final String setNr;
  final TextEditingController repsController;
  final TextEditingController weightController;
  final VoidCallback save;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SizedBox(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: setNr),
                    decoration: const InputDecoration(
                      labelText: 'Set',
                    ),
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              color: Colors.orange,
              width: 1,
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                child: TextField(
                  onEditingComplete: save,
                  onTapOutside: (value) {
                    save();
                    FocusScope.of(context).unfocus();
                  },
                  controller: repsController,
                  decoration: const InputDecoration(
                    labelText: 'Reps',
                  ),
                ),
              ),
            ),
            const VerticalDivider(
              width: 1,
              color: Colors.yellow,
            ),
            Flexible(
              flex: 3,
              child: SizedBox(
                child: TextField(
                  onEditingComplete: save,
                  onTapOutside: (value) {
                    save();
                    FocusScope.of(context).unfocus();
                  },
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}