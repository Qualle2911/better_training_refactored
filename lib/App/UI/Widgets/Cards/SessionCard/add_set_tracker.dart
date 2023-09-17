
import 'package:flutter/material.dart';

class AddSetTracker extends StatelessWidget {
  const AddSetTracker({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: onPressed, icon: const Icon(Icons.add)),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text("Add Set"),
            ),
          ],
        ),
      ),
    );
  }
}