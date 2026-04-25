import 'package:flutter/material.dart';

class SyncStatusDot extends StatelessWidget {
  const SyncStatusDot({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const SizedBox.square(dimension: 10),
    );
  }
}
